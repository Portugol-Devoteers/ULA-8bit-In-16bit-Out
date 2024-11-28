module mux_2(input i0, i1, selector, output out);
  wire i0_out, i1_out, not_selector;

  not not_inst(not_selector, selector);
  and and_inst_0(i0_out, i0, not_selector);
  and and_inst_1(i1_out, i1, selector);
  or or_inst_0(out, i0_out, i1_out);
endmodule

module mux_4(input i0, i1, i2, i3, input [1:0] selectors, output out);
  wire mux_1_out, mux_2_out;

  mux_2 mux_2_inst_1(.i0(i0), .i1(i1), .selector(selectors[0]), .out(mux_1_out));
  mux_2 mux_2_inst_2(.i0(i2), .i1(i3), .selector(selectors[0]), .out(mux_2_out));
  mux_2 mux_2_inst_3(.i0(mux_1_out), .i1(mux_2_out), .selector(selectors[1]), .out(out));
endmodule  

module mux_8(input i0, i1, i2, i3, i4, i5, i6, i7, input [2:0] selectors, output out);
  wire mux_1_out, mux_2_out;

  mux_4 mux_4_inst_1(.i0(i0), .i1(i1), .i2(i2), .i3(i3), .selectors(selectors[1:0]), .out(mux_1_out));
  mux_4 mux_4_inst_2(.i0(i4), .i1(i5), .i2(i6), .i3(i7), .selectors(selectors[1:0]), .out(mux_2_out));
  mux_2 mux_2_inst_1(.i0(mux_1_out), .i1(mux_2_out), .selector(selectors[2]), .out(out));
endmodule

module mux_16(input i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, input [3:0] selectors, output out);
  wire mux_1_out, mux_2_out;

  mux_8 mux_8_inst_1(.i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7), .selectors(selectors[2:0]), .out(mux_1_out));
  mux_8 mux_8_inst_2(.i0(i8), .i1(i9), .i2(i10), .i3(i11), .i4(i12), .i5(i13), .i6(i14), .i7(i15), .selectors(selectors[2:0]), .out(mux_2_out));
  mux_2 mux_2_inst_1(.i0(mux_1_out), .i1(mux_2_out), .selector(selectors[3]), .out(out));
endmodule

module mux_2_eight_bits(input wire [7:0] i0, i1 , input selector, output wire [7:0] out);	
  mux_2 mux_2_inst_0(.i0(i0[0]), .i1(i1[0]), .selector(selector), .out(out[0]));
  mux_2 mux_2_inst_1(.i0(i0[1]), .i1(i1[1]), .selector(selector), .out(out[1]));
  mux_2 mux_2_inst_2(.i0(i0[2]), .i1(i1[2]), .selector(selector), .out(out[2]));
  mux_2 mux_2_inst_3(.i0(i0[3]), .i1(i1[3]), .selector(selector), .out(out[3]));
  mux_2 mux_2_inst_4(.i0(i0[4]), .i1(i1[4]), .selector(selector), .out(out[4]));
  mux_2 mux_2_inst_5(.i0(i0[5]), .i1(i1[5]), .selector(selector), .out(out[5]));
  mux_2 mux_2_inst_6(.i0(i0[6]), .i1(i1[6]), .selector(selector), .out(out[6]));
  mux_2 mux_2_inst_7(.i0(i0[7]), .i1(i1[7]), .selector(selector), .out(out[7]));
endmodule

module mux_2_sixteen_bits(input wire [15:0] i0, i1 , input selector, output wire [15:0] out);
  mux_2_eight_bits mux_2_8_inst_0 (.i0(i0[7:0]), .i1(i1[7:0]), .selector(selector), .out(out[7:0]));
  mux_2_eight_bits mux_2_8_inst_1 (.i0(i0[15:8]), .i1(i1[15:8]), .selector(selector), .out(out[15:8]));
endmodule

 module mux_4_sixteen_bits(
  input wire [15:0] i0, i1, i2, i3,
  input wire [1:0] selectors,
  output wire [15:0] out
);
  wire [15:0] mux_1_out;
  wire [15:0] mux_2_out;

  mux_2_sixteen_bits mux_2_16_inst_1(.i0(i0), .i1(i1), .selector(selectors[0]), .out(mux_1_out));
  mux_2_sixteen_bits mux_2_16_inst_2(.i0(i2), .i1(i3), .selector(selectors[0]), .out(mux_2_out));
  mux_2_sixteen_bits mux_2_16_inst_3(.i0(mux_1_out), .i1(mux_2_out), .selector(selectors[1]), .out(out));
endmodule  
    
module mux_8_sixteen_bits(
  input wire [15:0] i0, i1, i2, i3, i4, i5, i6, i7,
  input wire [2:0] selectors,
  output wire [15:0] out
);
  wire [15:0] mux_1_out;
  wire [15:0] mux_2_out;

  mux_4_sixteen_bits mux_4_16_inst_1(.i0(i0), .i1(i1), .i2(i2), .i3(i3), .selectors(selectors[1:0]), .out(mux_1_out));
  mux_4_sixteen_bits mux_4_16_inst_2(.i0(i4), .i1(i5), .i2(i6), .i3(i7), .selectors(selectors[1:0]), .out(mux_2_out));
  mux_2_sixteen_bits mux_2_16_inst_1(.i0(mux_1_out), .i1(mux_2_out), .selector(selectors[2]), .out(out));
endmodule 
    
module mux_16_sixteen_bits(
  input wire [15:0] i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15,
  input wire [3:0] selectors,
  output wire [15:0] out
);
  wire [15:0] mux_1_out;
  wire [15:0] mux_2_out;

  mux_8_sixteen_bits mux_8_16_inst_1(.i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7), .selectors(selectors[2:0]), .out(mux_1_out));
  mux_8_sixteen_bits mux_8_16_inst_2(.i0(i8), .i1(i9), .i2(i10), .i3(i11), .i4(i12), .i5(i13), .i6(i14), .i7(i15), .selectors(selectors[2:0]), .out(mux_2_out));
  mux_2_sixteen_bits mux_2_16_inst_1(.i0(mux_1_out), .i1(mux_2_out), .selector(selectors[3]), .out(out));
endmodule

