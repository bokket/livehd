
#include <unistd.h>
#include <fcntl.h>
#include <limits.h>
#include <string.h>

#include <cstring>
#include <cassert>

#include "eprp_utils.hpp"

std::vector<std::string> Eprp_utils::parse_files(const std::string &files, const std::string &module) {
  char seps[] = ",";
  char *token;

  std::vector<std::string> raw_file_list;

  char *files_char = (char *)alloca(files.size());
  strcpy(files_char,files.c_str());
  token = std::strtok(files_char, seps);
  while( token != NULL ) {

    if (token[0] != 0) { // Empty sequences are valid and ignored. E.g: foo,bar,,,,potato
      raw_file_list.push_back(token);
    }

    token = std::strtok( NULL, seps );
  }

  return raw_file_list;
}

std::string Eprp_utils::get_exe_path() {
  char exePath[PATH_MAX];
  int len = readlink("/proc/self/exe", exePath, PATH_MAX);
  assert(len > 0 && len < PATH_MAX);
  for(int p=len-1;p>=0;p--) {
    if (exePath[p] == '/') {
      len = p;
      break;
    }
  }

  return std::string(exePath,0,len);
}

bool Eprp_utils::ends_with(const std::string &s, const std::string &suffix) {
  return s.rfind(suffix) == (s.size()-suffix.size());
}

