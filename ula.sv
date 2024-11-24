 module ula(
  input wire [7:0] a, b, 
  input wire [3:0] selectors, 
  output wire [15:0] result, 
  output wire zero_flag, sign_flag
);
  wire [15:0] adder_out, multiplier_out, and_out, or_out, nand_out, xor_out, nor_out, eq_out, gte_out, lte_out;
  wire adder_zero_flag, adder_sign_flag, multiplier_zero_flag, multiplier_sign_flag, and_zero_flag, or_zero_flag, nand_zero_flag, xor_zero_flag, nor_zero_flag;
   
  wire adder_operation = selectors[0];

  ula_adder adder_inst(.a(a), .b(b), .operation(adder_operation), .result(adder_out), .zero_flag(adder_zero_flag), .sign_flag(adder_sign_flag));
  ula_multiplier multiplier_inst(.a(a), .b(b), .result(multiplier_out), .zero_flag(multiplier_zero_flag), .sign_flag(multiplier_sign_flag));
  ula_and and_inst(.a(a), .b(b), .out(and_out), .zero_flag(and_zero_flag));
  ula_or or_inst(.a(a), .b(b), .out(or_out), .zero_flag(or_zero_flag));
  ula_nand nand_inst(.a(a), .b(b), .out(nand_out), .zero_flag(nand_zero_flag));
  ula_xor xor_inst(.a(a), .b(b), .out(xor_out), .zero_flag(xor_zero_flag));
  ula_nor nor_inst(.a(a), .b(b), .out(nor_out), .zero_flag(nor_zero_flag));
  ula_eq eq_inst(.zero_flag(zero_flag), .out(eq_out));
  ula_gte gte_inst(.zero_flag(zero_flag), .sign_flag(sign_flag), .out(gte_out));
  ula_lte lte_inst(.zero_flag(zero_flag), .sign_flag(sign_flag), .out(lte_out));

  // mux for result
  mux_16_sixteen_bits mux_16_16_inst_0(
    .i0(adder_out), 
    .i1(adder_out), 
    .i2(multiplier_out), 
    .i3(and_out), 
    .i4(or_out), 
    .i5(nand_out), 
    .i6(xor_out), 
    .i7(nor_out), 
    .i8(eq_out), 
    .i9(gte_out), 
    .i10(lte_out), 
    .selectors(selectors), 
    .out(result));
  // mux for zero flag
  mux_8_sixteen_bits mux_8_16_inst_0(
    .i0(adder_zero_flag), 
    .i1(adder_zero_flag), 
    .i2(multiplier_zero_flag), 
    .i3(and_zero_flag), 
    .i4(or_zero_flag), 
    .i5(nand_zero_flag), 
    .i6(xor_zero_flag), 
    .i7(nor_zero_flag), 
    .selectors(selectors), 
    .out(zero_flag));
  // mux for sign flag
  mux_4 mux_4_inst_1(
    .i0(adder_sign_flag), 
    .i1(adder_sign_flag), 
    .i2(multiplier_sign_flag), 
    .selectors(selectors[1:0]), 
    .out(sign_flag)); 
endmodule