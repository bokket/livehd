circuit Xor128Thread8 :
  module Xor16 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip ii : UInt<8>, flip iivec : UInt<8>[15], oo : UInt<8>}

    wire tmp_vec : UInt<8>[16] @[Xor128Thread8.scala 9:21]
    tmp_vec[0] <= io.ii @[Xor128Thread8.scala 10:14]
    node _tmp_vec_1_T = xor(tmp_vec[0], io.iivec[0]) @[Xor128Thread8.scala 13:32]
    tmp_vec[1] <= _tmp_vec_1_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_2_T = xor(tmp_vec[1], io.iivec[1]) @[Xor128Thread8.scala 13:32]
    tmp_vec[2] <= _tmp_vec_2_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_3_T = xor(tmp_vec[2], io.iivec[2]) @[Xor128Thread8.scala 13:32]
    tmp_vec[3] <= _tmp_vec_3_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_4_T = xor(tmp_vec[3], io.iivec[3]) @[Xor128Thread8.scala 13:32]
    tmp_vec[4] <= _tmp_vec_4_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_5_T = xor(tmp_vec[4], io.iivec[4]) @[Xor128Thread8.scala 13:32]
    tmp_vec[5] <= _tmp_vec_5_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_6_T = xor(tmp_vec[5], io.iivec[5]) @[Xor128Thread8.scala 13:32]
    tmp_vec[6] <= _tmp_vec_6_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_7_T = xor(tmp_vec[6], io.iivec[6]) @[Xor128Thread8.scala 13:32]
    tmp_vec[7] <= _tmp_vec_7_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_8_T = xor(tmp_vec[7], io.iivec[7]) @[Xor128Thread8.scala 13:32]
    tmp_vec[8] <= _tmp_vec_8_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_9_T = xor(tmp_vec[8], io.iivec[8]) @[Xor128Thread8.scala 13:32]
    tmp_vec[9] <= _tmp_vec_9_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_10_T = xor(tmp_vec[9], io.iivec[9]) @[Xor128Thread8.scala 13:32]
    tmp_vec[10] <= _tmp_vec_10_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_11_T = xor(tmp_vec[10], io.iivec[10]) @[Xor128Thread8.scala 13:32]
    tmp_vec[11] <= _tmp_vec_11_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_12_T = xor(tmp_vec[11], io.iivec[11]) @[Xor128Thread8.scala 13:32]
    tmp_vec[12] <= _tmp_vec_12_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_13_T = xor(tmp_vec[12], io.iivec[12]) @[Xor128Thread8.scala 13:32]
    tmp_vec[13] <= _tmp_vec_13_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_14_T = xor(tmp_vec[13], io.iivec[13]) @[Xor128Thread8.scala 13:32]
    tmp_vec[14] <= _tmp_vec_14_T @[Xor128Thread8.scala 13:16]
    node _tmp_vec_15_T = xor(tmp_vec[14], io.iivec[14]) @[Xor128Thread8.scala 13:32]
    tmp_vec[15] <= _tmp_vec_15_T @[Xor128Thread8.scala 13:16]
    io.oo <= tmp_vec[15] @[Xor128Thread8.scala 16:9]

  module Xor128Thread8 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip ii : UInt<8>, flip iivec : UInt<8>[15], oo : UInt<8>}

    inst m0 of Xor16 @[Xor128Thread8.scala 25:18]
    m0.clock <= clock
    m0.reset <= reset
    m0.io.ii <= io.ii @[Xor128Thread8.scala 26:12]
    m0.io.iivec[0] <= io.iivec[0] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[1] <= io.iivec[1] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[2] <= io.iivec[2] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[3] <= io.iivec[3] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[4] <= io.iivec[4] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[5] <= io.iivec[5] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[6] <= io.iivec[6] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[7] <= io.iivec[7] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[8] <= io.iivec[8] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[9] <= io.iivec[9] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[10] <= io.iivec[10] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[11] <= io.iivec[11] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[12] <= io.iivec[12] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[13] <= io.iivec[13] @[Xor128Thread8.scala 28:20]
    m0.io.iivec[14] <= io.iivec[14] @[Xor128Thread8.scala 28:20]
    inst m1 of Xor16 @[Xor128Thread8.scala 31:18]
    m1.clock <= clock
    m1.reset <= reset
    m1.io.ii <= m0.io.oo @[Xor128Thread8.scala 32:12]
    m1.io.iivec[0] <= io.iivec[0] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[1] <= io.iivec[1] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[2] <= io.iivec[2] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[3] <= io.iivec[3] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[4] <= io.iivec[4] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[5] <= io.iivec[5] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[6] <= io.iivec[6] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[7] <= io.iivec[7] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[8] <= io.iivec[8] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[9] <= io.iivec[9] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[10] <= io.iivec[10] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[11] <= io.iivec[11] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[12] <= io.iivec[12] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[13] <= io.iivec[13] @[Xor128Thread8.scala 34:20]
    m1.io.iivec[14] <= io.iivec[14] @[Xor128Thread8.scala 34:20]
    inst m2 of Xor16 @[Xor128Thread8.scala 37:18]
    m2.clock <= clock
    m2.reset <= reset
    m2.io.ii <= m1.io.oo @[Xor128Thread8.scala 38:12]
    m2.io.iivec[0] <= io.iivec[0] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[1] <= io.iivec[1] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[2] <= io.iivec[2] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[3] <= io.iivec[3] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[4] <= io.iivec[4] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[5] <= io.iivec[5] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[6] <= io.iivec[6] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[7] <= io.iivec[7] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[8] <= io.iivec[8] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[9] <= io.iivec[9] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[10] <= io.iivec[10] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[11] <= io.iivec[11] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[12] <= io.iivec[12] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[13] <= io.iivec[13] @[Xor128Thread8.scala 40:20]
    m2.io.iivec[14] <= io.iivec[14] @[Xor128Thread8.scala 40:20]
    inst m3 of Xor16 @[Xor128Thread8.scala 43:18]
    m3.clock <= clock
    m3.reset <= reset
    m3.io.ii <= m2.io.oo @[Xor128Thread8.scala 44:12]
    m3.io.iivec[0] <= io.iivec[0] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[1] <= io.iivec[1] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[2] <= io.iivec[2] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[3] <= io.iivec[3] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[4] <= io.iivec[4] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[5] <= io.iivec[5] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[6] <= io.iivec[6] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[7] <= io.iivec[7] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[8] <= io.iivec[8] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[9] <= io.iivec[9] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[10] <= io.iivec[10] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[11] <= io.iivec[11] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[12] <= io.iivec[12] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[13] <= io.iivec[13] @[Xor128Thread8.scala 46:20]
    m3.io.iivec[14] <= io.iivec[14] @[Xor128Thread8.scala 46:20]
    inst m4 of Xor16 @[Xor128Thread8.scala 49:18]
    m4.clock <= clock
    m4.reset <= reset
    m4.io.ii <= m3.io.oo @[Xor128Thread8.scala 50:12]
    m4.io.iivec[0] <= io.iivec[0] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[1] <= io.iivec[1] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[2] <= io.iivec[2] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[3] <= io.iivec[3] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[4] <= io.iivec[4] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[5] <= io.iivec[5] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[6] <= io.iivec[6] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[7] <= io.iivec[7] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[8] <= io.iivec[8] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[9] <= io.iivec[9] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[10] <= io.iivec[10] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[11] <= io.iivec[11] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[12] <= io.iivec[12] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[13] <= io.iivec[13] @[Xor128Thread8.scala 52:20]
    m4.io.iivec[14] <= io.iivec[14] @[Xor128Thread8.scala 52:20]
    inst m5 of Xor16 @[Xor128Thread8.scala 55:18]
    m5.clock <= clock
    m5.reset <= reset
    m5.io.ii <= m4.io.oo @[Xor128Thread8.scala 56:12]
    m5.io.iivec[0] <= io.iivec[0] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[1] <= io.iivec[1] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[2] <= io.iivec[2] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[3] <= io.iivec[3] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[4] <= io.iivec[4] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[5] <= io.iivec[5] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[6] <= io.iivec[6] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[7] <= io.iivec[7] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[8] <= io.iivec[8] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[9] <= io.iivec[9] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[10] <= io.iivec[10] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[11] <= io.iivec[11] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[12] <= io.iivec[12] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[13] <= io.iivec[13] @[Xor128Thread8.scala 58:20]
    m5.io.iivec[14] <= io.iivec[14] @[Xor128Thread8.scala 58:20]
    inst m6 of Xor16 @[Xor128Thread8.scala 61:18]
    m6.clock <= clock
    m6.reset <= reset
    m6.io.ii <= m5.io.oo @[Xor128Thread8.scala 62:12]
    m6.io.iivec[0] <= io.iivec[0] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[1] <= io.iivec[1] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[2] <= io.iivec[2] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[3] <= io.iivec[3] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[4] <= io.iivec[4] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[5] <= io.iivec[5] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[6] <= io.iivec[6] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[7] <= io.iivec[7] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[8] <= io.iivec[8] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[9] <= io.iivec[9] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[10] <= io.iivec[10] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[11] <= io.iivec[11] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[12] <= io.iivec[12] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[13] <= io.iivec[13] @[Xor128Thread8.scala 64:20]
    m6.io.iivec[14] <= io.iivec[14] @[Xor128Thread8.scala 64:20]
    inst m7 of Xor16 @[Xor128Thread8.scala 67:18]
    m7.clock <= clock
    m7.reset <= reset
    m7.io.ii <= m6.io.oo @[Xor128Thread8.scala 68:12]
    m7.io.iivec[0] <= io.iivec[0] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[1] <= io.iivec[1] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[2] <= io.iivec[2] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[3] <= io.iivec[3] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[4] <= io.iivec[4] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[5] <= io.iivec[5] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[6] <= io.iivec[6] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[7] <= io.iivec[7] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[8] <= io.iivec[8] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[9] <= io.iivec[9] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[10] <= io.iivec[10] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[11] <= io.iivec[11] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[12] <= io.iivec[12] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[13] <= io.iivec[13] @[Xor128Thread8.scala 70:20]
    m7.io.iivec[14] <= io.iivec[14] @[Xor128Thread8.scala 70:20]
    wire tmp_wire : UInt<8> @[Xor128Thread8.scala 72:22]
    tmp_wire <= m7.io.oo @[Xor128Thread8.scala 73:12]
    node _io_oo_T = and(tmp_wire, UInt<8>("hff")) @[Xor128Thread8.scala 75:21]
    io.oo <= _io_oo_T @[Xor128Thread8.scala 75:9]