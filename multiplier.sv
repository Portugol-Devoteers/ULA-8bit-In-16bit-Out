module get_partial_products(
  input wire [7:0] a, b,
  output wire p00, p01, p02, p03, p04, p05, p06, p07,
  output wire p10, p11, p12, p13, p14, p15, p16, p17,
  output wire p20, p21, p22, p23, p24, p25, p26, p27,
  output wire p30, p31, p32, p33, p34, p35, p36, p37,
  output wire p40, p41, p42, p43, p44, p45, p46, p47,
  output wire p50, p51, p52, p53, p54, p55, p56, p57,
  output wire p60, p61, p62, p63, p64, p65, p66, p67,
  output wire p70, p71, p72, p73, p74, p75, p76, p77
);

  // Produtos parciais gerados com operações AND
  and (p00, a[0], b[0]);
  and (p01, a[1], b[0]);
  and (p02, a[2], b[0]);
  and (p03, a[3], b[0]);
  and (p04, a[4], b[0]);
  and (p05, a[5], b[0]);
  and (p06, a[6], b[0]);
  buf buf_inst_0(p07, 1'b0);

  and (p10, a[0], b[1]);
  and (p11, a[1], b[1]);
  and (p12, a[2], b[1]);
  and (p13, a[3], b[1]);
  and (p14, a[4], b[1]);
  and (p15, a[5], b[1]);
  and (p16, a[6], b[1]);
  buf buf_inst_1(p17, 1'b0);

  and (p20, a[0], b[2]);
  and (p21, a[1], b[2]);
  and (p22, a[2], b[2]);
  and (p23, a[3], b[2]);
  and (p24, a[4], b[2]);
  and (p25, a[5], b[2]);
  and (p26, a[6], b[2]);
  buf buf_inst_2(p27, 1'b0);

  and (p30, a[0], b[3]);
  and (p31, a[1], b[3]);
  and (p32, a[2], b[3]);
  and (p33, a[3], b[3]);
  and (p34, a[4], b[3]);
  and (p35, a[5], b[3]);
  and (p36, a[6], b[3]);
  buf buf_inst_3(p37, 1'b0);

  and (p40, a[0], b[4]);
  and (p41, a[1], b[4]);
  and (p42, a[2], b[4]);
  and (p43, a[3], b[4]);
  and (p44, a[4], b[4]);
  and (p45, a[5], b[4]);
  and (p46, a[6], b[4]);
  buf buf_inst_4(p47, 1'b0);

  and (p50, a[0], b[5]);
  and (p51, a[1], b[5]);
  and (p52, a[2], b[5]);
  and (p53, a[3], b[5]);
  and (p54, a[4], b[5]);
  and (p55, a[5], b[5]);
  and (p56, a[6], b[5]);
  buf buf_inst_5(p57, 1'b0);

  and (p60, a[0], b[6]);
  and (p61, a[1], b[6]);
  and (p62, a[2], b[6]);
  and (p63, a[3], b[6]);
  and (p64, a[4], b[6]);
  and (p65, a[5], b[6]);
  and (p66, a[6], b[6]);
  buf buf_inst_6(p67, 1'b0);

  buf buf_inst_7(p70, 1'b0);
  buf buf_inst_8(p71, 1'b0);
  buf buf_inst_9(p72, 1'b0);
  buf buf_inst_10(p73, 1'b0);
  buf buf_inst_11(p74, 1'b0);
  buf buf_inst_12(p75, 1'b0);
  buf buf_inst_13(p76, 1'b0);
  buf buf_inst_14(p77, 1'b0);

endmodule

// Wallace Tree Multiplier algorithm
module multiplier(
  input wire [7:0] a, b,
  output wire [15:0] result
);
  // Produtos parciais (pij)
  wire p00, p01, p02, p03, p04, p05, p06, p07;
  wire p10, p11, p12, p13, p14, p15, p16, p17;
  wire p20, p21, p22, p23, p24, p25, p26, p27;
  wire p30, p31, p32, p33, p34, p35, p36, p37;
  wire p40, p41, p42, p43, p44, p45, p46, p47;
  wire p50, p51, p52, p53, p54, p55, p56, p57;
  wire p60, p61, p62, p63, p64, p65, p66, p67;
  wire p70, p71, p72, p73, p74, p75, p76, p77;

  wire c01, c02, c03, c04, c05, c06, c07, c08;
  wire c11, c12, c13, c14, c15, c16, c17, c18;
  wire c21, c22, c23, c24, c25, c26, c27, c28;
  wire c31, c32, c33, c34, c35, c36, c37, c38;
  wire c40, c41, c42, c43, c44, c45, c46, c47;
  wire c48, c49, c50, c51, c52, c53, c54, c55;
  wire c56, c57, c58, c59, c5_10;

  wire s02, s03, s04, s05, s06, s07, s08, s11;
  wire s12, s13, s14, s15, s16, s17, s18, s22;
  wire s23, s24, s25, s26, s27, s28, s31, s32;
  wire s33, s34, s35, s36, s37, s38, s41, s42;
  wire s43, s44, s45, s46, s47, s48, s49, s51;
  wire s52, s53, s54, s55, s56, s57, s58, s59, s5_10;

  // Gerar os produtos parciais
  get_partial_products g_p_p_inst(
    .a(a), .b(b),
    .p00(result[0]), .p01(p01), .p02(p02), .p03(p03), .p04(p04), .p05(p05), .p06(p06), .p07(p07),
    .p10(p10), .p11(p11), .p12(p12), .p13(p13), .p14(p14), .p15(p15), .p16(p16), .p17(p17),
    .p20(p20), .p21(p21), .p22(p22), .p23(p23), .p24(p24), .p25(p25), .p26(p26), .p27(p27),
    .p30(p30), .p31(p31), .p32(p32), .p33(p33), .p34(p34), .p35(p35), .p36(p36), .p37(p37),
    .p40(p40), .p41(p41), .p42(p42), .p43(p43), .p44(p44), .p45(p45), .p46(p46), .p47(p47),
    .p50(p50), .p51(p51), .p52(p52), .p53(p53), .p54(p54), .p55(p55), .p56(p56), .p57(p57),
    .p60(p60), .p61(p61), .p62(p62), .p63(p63), .p64(p64), .p65(p65), .p66(p66), .p67(p67),
    .p70(p70), .p71(p71), .p72(p72), .p73(p73), .p74(p74), .p75(p75), .p76(p76), .p77(p77)
  );


  // Etapa 1 (16 operações)
  half_adder ha_inst_1 (.a(p01), .b(p10), .result(result[1]), .carry_out(c01));

  full_adder fa_inst_1 (.a(p02), .b(p11), .carry_in(p20), .result(s02), .carry_out(c02));

  full_adder fa_inst_2 (.a(p03), .b(p12), .carry_in(p21), .result(s03), .carry_out(c03));

  full_adder fa_inst_3 (.a(p04), .b(p13), .carry_in(p22), .result(s04), .carry_out(c04));

  full_adder fa_inst_4 (.a(p05), .b(p14), .carry_in(p23), .result(s05), .carry_out(c05));

  full_adder fa_inst_5 (.a(p06), .b(p15), .carry_in(p24), .result(s06), .carry_out(c06));

  full_adder fa_inst_6 (.a(p07), .b(p16), .carry_in(p25), .result(s07), .carry_out(c07));

  half_adder ha_inst_2 (.a(p17), .b(p26), .result(s08), .carry_out(c08));

  half_adder ha_inst_3 (.a(p31), .b(p40), .result(s11), .carry_out(c11));
  
  full_adder fa_inst_7 (.a(p32), .b(p41), .carry_in(p50), .result(s12), .carry_out(c12));
  
  full_adder fa_inst_8 (.a(p33), .b(p42), .carry_in(p51), .result(s13), .carry_out(c13));

  full_adder fa_inst_9 (.a(p34), .b(p43), .carry_in(p52), .result(s14), .carry_out(c14));
  
  full_adder fa_inst_10 (.a(p35), .b(p44), .carry_in(p53), .result(s15), .carry_out(c15));
 
  full_adder fa_inst_11 (.a(p36), .b(p45), .carry_in(p54), .result(s16), .carry_out(c16));

  full_adder fa_inst_12 (.a(p37), .b(p46), .carry_in(p55), .result(s17), .carry_out(c17));

  half_adder ha_inst_4 (.a(p47), .b(p56), .result(s18), .carry_out(c18));

  // Etapa 2 (16 operações)
  half_adder ha_inst_5 (.a(s02), .b(c01), .result(result[2]), .carry_out(c21));
  
  full_adder fa_inst_13 (.a(s03), .b(c02), .carry_in(p30), .result(s22), .carry_out(c22));
 
  full_adder fa_inst_14 (.a(s04), .b(c03), .carry_in(s11), .result(s23), .carry_out(c23)); 

  full_adder fa_inst_15 (.a(s05), .b(c04), .carry_in(s12), .result(s24), .carry_out(c24));

  full_adder fa_inst_16 (.a(s06), .b(c05), .carry_in(s13), .result(s25), .carry_out(c25));
  
  full_adder fa_inst_17 (.a(s07), .b(c06), .carry_in(s14), .result(s26), .carry_out(c26));

  full_adder fa_inst_18 (.a(s08), .b(c07), .carry_in(s15), .result(s27), .carry_out(c27));

  full_adder fa_inst_19 (.a(s16), .b(c08), .carry_in(p27), .result(s28), .carry_out(c28));

  half_adder ha_inst_6 (.a(p60), .b(c12), .result(s31), .carry_out(c31));

  full_adder fa_inst_20 (.a(p61), .b(c13), .carry_in(p70), .result(s32), .carry_out(c32));

  full_adder fa_inst_21 (.a(p62), .b(c14), .carry_in(p71), .result(s33), .carry_out(c33));

  full_adder fa_inst_22 (.a(p63), .b(c15), .carry_in(p72), .result(s34), .carry_out(c34));

  full_adder fa_inst_23 (.a(p64), .b(c16), .carry_in(p73), .result(s35), .carry_out(c35));

  full_adder fa_inst_24 (.a(p65), .b(c17), .carry_in(p74), .result(s36), .carry_out(c36));

  full_adder fa_inst_25 (.a(p66), .b(c18), .carry_in(p75), .result(s37), .carry_out(c37));

  half_adder ha_inst_7 (.a(p67), .b(p76), .result(s38), .carry_out(c38));


  // Etapa 3 (10 operações)
  half_adder ha_inst_8 (.a(s22), .b(c21), .result(result[3]), .carry_out(c40));
  
  half_adder ha_inst_9 (.a(s23), .b(c22), .result(s41), .carry_out(c41));

  full_adder fa_inst_26 (.a(s24), .b(c23), .carry_in(c11), .result(s42), .carry_out(c42));

  full_adder fa_inst_27 (.a(s25), .b(c24), .carry_in(s31), .result(s43), .carry_out(c43));

  full_adder fa_inst_28 (.a(s26), .b(c25), .carry_in(s32), .result(s44), .carry_out(c44));

  full_adder fa_inst_29 (.a(s27), .b(c26), .carry_in(s33), .result(s45), .carry_out(c45));

  full_adder fa_inst_30 (.a(s28), .b(c27), .carry_in(s34), .result(s46), .carry_out(c46));

  full_adder fa_inst_31 (.a(s35), .b(c28), .carry_in(s17), .result(s47), .carry_out(c47));

  half_adder ha_inst_10 (.a(s36), .b(s18), .result(s48), .carry_out(c48));

  half_adder ha_inst_11 (.a(s37), .b(p57), .result(s49), .carry_out(c49));


  // Etapa 4 (11 operações)

  half_adder ha_inst_12 (.a(s41), .b(c40), .result(result[4]), .carry_out(c50));

  half_adder ha_inst_13 (.a(s42), .b(c41), .result(s51), .carry_out(c51));

  half_adder ha_inst_14 (.a(s43), .b(c42), .result(s52), .carry_out(c52));

  full_adder fa_inst_32 (.a(s44), .b(c31), .carry_in(c43), .result(s53), .carry_out(c53));

  full_adder fa_inst_33 (.a(s45), .b(c32), .carry_in(c44), .result(s54), .carry_out(c54));

  full_adder fa_inst_34 (.a(s46), .b(c33), .carry_in(c45), .result(s55), .carry_out(c55));

  full_adder fa_inst_35 (.a(s47), .b(c34), .carry_in(c46), .result(s56), .carry_out(c56));

  full_adder fa_inst_36 (.a(s48), .b(c35), .carry_in(c47), .result(s57), .carry_out(c57));

  full_adder fa_inst_37 (.a(s49), .b(c36), .carry_in(c48), .result(s58), .carry_out(c58));

  full_adder fa_inst_38 (.a(s38), .b(c37), .carry_in(c49), .result(s59), .carry_out(c59));

  half_adder ha_inst_15 (.a(p77), .b(c38), .result(s5_10), .carry_out(c5_10));
 
  
  wire [10:0] result_adder;
  wire [9:0] a_s, b_c;
  
  buf buf_inst_0(a_s[9], s5_10);
  buf buf_inst_1(a_s[8], s59);
  buf buf_inst_2(a_s[7], s58);
  buf buf_inst_3(a_s[6], s57);
  buf buf_inst_4(a_s[5], s56);
  buf buf_inst_5(a_s[4], s55);
  buf buf_inst_6(a_s[3], s54);
  buf buf_inst_7(a_s[2], s53);
  buf buf_inst_8(a_s[1], s52);
  buf buf_inst_9(a_s[0], s51);
  
  buf buf_inst_10(b_c[9], c59);
  buf buf_inst_11(b_c[8], c58);
  buf buf_inst_12(b_c[7], c57);
  buf buf_inst_13(b_c[6], c56);
  buf buf_inst_14(b_c[5], c55);
  buf buf_inst_15(b_c[4], c54);
  buf buf_inst_16(b_c[3], c53);
  buf buf_inst_17(b_c[2], c52);
  buf buf_inst_18(b_c[1], c51);
  buf buf_inst_19(b_c[0], c50);

  rca_ten_bits rca_10_inst_0 (
    .a(a_s),           
    .b(b_c),          
    .result(result_adder)
  );

  buf buf_inst_20_0(result[5], result_adder[0]);
  buf buf_inst_20_1(result[6], result_adder[1]);
  buf buf_inst_20_2(result[7], result_adder[2]);
  buf buf_inst_20_3(result[8], result_adder[3]);
  buf buf_inst_20_4(result[9], result_adder[4]);
  buf buf_inst_20_5(result[10], result_adder[5]);
  buf buf_inst_20_6(result[11], result_adder[6]);
  buf buf_inst_20_7(result[12], result_adder[7]);
  buf buf_inst_20_8(result[13], result_adder[8]);
  buf buf_inst_20_9(result[14], result_adder[9]);
  buf buf_inst_20_10(result[15], result_adder[10]);
endmodule

module ula_multiplier(
  input wire [7:0] a, b,
  output wire [15:0] result,
  output wire sign_flag, zero_flag 
);
  wire [7:0] a_absolute, b_absulute;
  wire [15:0] temp_result;

  get_absolute_value abs_inst_a(.n(a), .out(a_absolute));
  get_absolute_value abs_inst_b(.n(b), .out(b_absulute));

  multiplier mult_inst_0 (
    .a(a_absolute), .b(b_absulute), .result(temp_result)
  );

  apply_signal apply_signal_inst_0 (
    .a(a), .b(b), .temp_result(temp_result), .result(result)
  );

  sign_flag sign_flag_inst_0 (
    .result(result),
    .sign_flag(sign_flag)
  );

  zero_flag zero_flag_inst_0 (
    .result(result),
    .zero_flag(zero_flag)
  );
endmodule
  
