#include <cstdio>      // for popen, pclose
#include <cstring>     // for strcpy
#include <filesystem>  // for *nix file hierarchy traversal
#include <fstream>
#include <random>
#include <stdexcept>
#include <string>
#include <unordered_map>

#include "dag.hpp"
#include "fmt/format.h"
#include "hier_tree.hpp"
#include "profile_time.hpp"

void Hier_tree::construct_bounds(const size_t dag_id, const unsigned int optimal_thresh) {
  auto& d      = dags[dag_id];

  // set dimensions of leaf nodes in the dag
  std::function<void(const Dag::pdag)> assign_leaf_dims = [&](const Dag::pdag pd) {
    if (pd->is_leaf()) {
      static constexpr double               max_aspect_ratio = 1.0 / 5.0;
      static std::default_random_engine     gen;
      static std::uniform_real_distribution dist(max_aspect_ratio, 1.0 - max_aspect_ratio);

      double width_factor = dist(gen);
      pd->width           = pd->area * width_factor;
      pd->height          = pd->area * (1.0 - width_factor);
    }

    for (auto child : pd->children) {
      assign_leaf_dims(child);
    }
  };

  assign_leaf_dims(d.root);

  std::function<void(const Dag::pdag)> floorplan_patterns = [&](const Dag::pdag pd) {
    // avoid floorplanning leaves (no point, since they only contain a single generic node)
    if (pd->is_leaf()) {
      return;
    }

    // make sure all children are floorplanned before we start floorplanning ourselves
    for (auto child : pd->children) {
      floorplan_patterns(child);
    }

    // avoid floorplanning the entire design for now
    if (pd->is_root()) {
      return;
    }

    std::stringstream instr, outstr;

    size_t in_count;
    instr << fmt::format("{}\n", pd->children.size());
    for (size_t child_i = 0; child_i < pd->children.size(); child_i++) {
      auto child = pd->children[child_i];
      I(child->width != 0);
      I(child->height != 0);
      // account for the fact that there may be more than one children of a given type
      for (in_count = 0; in_count < pd->child_edge_count[child_i]; in_count++) {
        // keep a few digits of precision to ourselves
        in_count++;
        instr << fmt::format("{:.12f} {:.12f}\n", child->width, child->height);
      }
    }

    if (bound_verbose) {
      fmt::print("\ninput string stream:\n{}", instr.str());
    }

    // if the pattern is small, we can afford to use an exhaustive approach to finding floorplans.
    bool small_pat = pd->children.size() <= optimal_thresh;

    invoke_blobb(instr, outstr, small_pat);

    // only record bounding box ("bounding curve") information right now

    double pat_width, pat_height;
    outstr >> pat_width;
    outstr >> pat_height;

    pd->width  = pat_width;
    pd->height = pat_height;
  };

  floorplan_patterns(d.root);
}

void Hier_tree::construct_bounds(const unsigned int optimal_thresh) {
  for (size_t i = 0; i < dags.size(); i++) {
    construct_bounds(i, optimal_thresh);
  }
}

void Hier_tree::invoke_blobb(const std::stringstream& instr, std::stringstream& outstr, const bool small) {
  // shelling out here because blobb uses static variables that can't easily be reset across calls.
  // TODO: information is passed to blobb by reading and writing files for now, which is slow.
  // can we map files to memory?  The files are pretty small...

  std::ofstream blobb_inf;

  blobb_inf.open("/tmp/infile.txt", std::ios::out | std::ios::trunc);
  if (!blobb_inf) {
    throw std::runtime_error("cannot open file /tmp/infile.txt!");
  }
  blobb_inf << instr.str();
  blobb_inf.close();

  // should be <...>/livehd (symlink)
  auto curr_p = std::filesystem::current_path();

  const auto blobb_p = curr_p / "bazel-bin" / "third_party" / "misc" / "blobb_compass" / "blobb";
  if (!std::filesystem::exists(blobb_p)) {
    throw std::runtime_error(fmt::format("No binary found in {}!", blobb_p.string()));
  }

  // configure BloBB as follows:
  // 1. only consider slicing packings (default)
  // 2. allow for blocks to be rotated (default)
  // 3. enable quiet operation (-t)
  // 4. switch between an optimal floorplanning algorithm and a hierarchical one capable of handling bigger inputs with reduced
  // quality
  // 5. a maximum deadspace percent that starts small and grows bigger over time

  // note that another option here is to use the --backtrack option to find _some_ packing with a slowly increasing deadspace
  // percent it isn't optimal, but it's a lot faster

  const std::string files      = "/tmp/infile.txt /tmp/outfile.bbb";
  const std::string fixed_args = "-t";
  const std::string alg        = (small) ? "--optimal" : "--hierarchical";

  std::ifstream blobb_outf;

  profile_time::timer t;
  t.start();

  fmt::print("    running blobb...");

  const std::string command = fmt::format("{} {} {} {}", blobb_p.string(), files, fixed_args, alg);

  auto cfstream = popen(command.c_str(), "r");
  I(cfstream);

  // even if we don't print the output of BloBB, we still have to read it or BloBB will hang?
  char c;
  while ((c = fgetc(cfstream)) != EOF) {
    // putchar(ch);
  }

  int retcode = pclose(cfstream);
  if (retcode != 0) {
    throw std::runtime_error("blobb exited with non-zero value!");
  }

  blobb_outf.open("/tmp/outfile.bbb");
  if (!blobb_outf) {
    throw std::runtime_error("cannot open /tmp/outfile.bbb!");
  }

  if (blobb_outf.peek() == std::ifstream::traits_type::eof()) {
    throw std::runtime_error("no output from blobb!");
  }

  fmt::print("\ndone ({} ms).\n", t.time());

  outstr << blobb_outf.rdbuf();

  blobb_outf.close();
}