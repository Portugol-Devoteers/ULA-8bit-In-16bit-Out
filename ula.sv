 module ula(
  input wire [7:0] a, b, 
  input wire [3:0] selectors, 
  output wire [15:0] result, 
  output wire zero_flag, sign_flag
);
  wire [15:0] adder_out, multiplier_out;
  wire adder_zero_flag, adder_sign_flag, multiplier_zero_flag, multiplier_sign_flag;
   
  wire adder_operation = selectors[0];

  ula_adder adder_inst(.a(a), .b(b), .operation(adder_operation), .result(adder_out), .zero_flag(adder_zero_flag), .sign_flag(adder_sign_flag));
  ula_multiplier multiplier_inst(.a(a), .b(b), .result(multiplier_out), .zero_flag(multiplier_zero_flag), .sign_flag(multiplier_sign_flag));

  // mux for result
  mux_16_sixteen_bits mux_16_16_inst_0(.i0(adder_out), .i1(adder_out), .i2(multiplier_out), .selectors(selectors), .out(result));
  // mux for zero flag
  mux_4 mux_4_inst_0(.i0(adder_zero_flag), .i1(adder_zero_flag), .i2(multiplier_zero_flag), .i3(multiplier_zero_flag), .selectors(selectors[1:0]), .out(zero_flag));
  // mux for sign flag
  mux_4 mux_4_inst_1(.i0(adder_sign_flag), .i1(adder_sign_flag), .i2(multiplier_sign_flag), .i3(multiplier_sign_flag), .selectors(selectors[1:0]), .out(sign_flag)); 
endmodule