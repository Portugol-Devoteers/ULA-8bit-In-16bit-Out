module fill_out(input wire [7:0] i0, output [15:0] out);
  buf buf_inst_0(out[0], i0[0]);
  buf buf_inst_1(out[1], i0[1]);
  buf buf_inst_2(out[2], i0[2]);
  buf buf_inst_3(out[3], i0[3]);
  buf buf_inst_4(out[4], i0[4]);
  buf buf_inst_5(out[5], i0[5]);
  buf buf_inst_6(out[6], i0[6]);
  buf buf_inst_7(out[7], i0[7]);
  buf buf_inst_8(out[8], 1'b0);
  buf buf_inst_9(out[9], 1'b0);
  buf buf_inst_10(out[10], 1'b0);
  buf buf_inst_11(out[11], 1'b0);
  buf buf_inst_12(out[12], 1'b0);
  buf buf_inst_13(out[13], 1'b0);
  buf buf_inst_14(out[14], 1'b0);
  buf buf_inst_15(out[15], 1'b0);
endmodule

module and_eight_bits (input wire [7:0] a, b, output wire [7:0] out); 
  and and_inst_0(out[0], a[0], b[0]);
  and and_inst_1(out[1], a[1], b[1]);
  and and_inst_2(out[2], a[2], b[2]);
  and and_inst_3(out[3], a[3], b[3]);
  and and_inst_4(out[4], a[4], b[4]);
  and and_inst_5(out[5], a[5], b[5]);
  and and_inst_6(out[6], a[6], b[6]);
  and and_inst_7(out[7], a[7], b[7]);
endmodule

module ula_and (input wire [7:0] a, b, output wire [15:0] out, output wire zero_flag); 
  wire [7:0] and_8_out;
  and_eight_bits and_8_inst(.a(a), .b(b), .out(and_8_out));
  
  fill_out fill_out_inst(.i0(and_8_out), .out(out));
  zero_flag zero_flag_inst(.result(out), .zero_flag(zero_flag));
endmodule

module or_eight_bits(input wire [7:0] a, b, output wire [7:0] out); 
  or or_inst_0(out[0], a[0], b[0]);
  or or_inst_1(out[1], a[1], b[1]);
  or or_inst_2(out[2], a[2], b[2]);
  or or_inst_3(out[3], a[3], b[3]);
  or or_inst_4(out[4], a[4], b[4]);
  or or_inst_5(out[5], a[5], b[5]);
  or or_inst_6(out[6], a[6], b[6]);
  or or_inst_7(out[7], a[7], b[7]);
endmodule

module ula_or (input wire [7:0] a, b, output wire [15:0] out, output wire zero_flag); 
  wire [7:0] or_8_out;

  or_eight_bits or_8_inst(.a(a), .b(b), .out(or_8_out));

  fill_out fill_out_inst(.i0(or_8_out), .out(out));
  zero_flag zero_flag_inst(.result(out), .zero_flag(zero_flag));
endmodule

module nand_eight_bits (input wire [7:0] a, b, output wire [7:0] out); 
  nand nand_inst_0(out[0], a[0], b[0]);
  nand nand_inst_1(out[1], a[1], b[1]);
  nand nand_inst_2(out[2], a[2], b[2]);
  nand nand_inst_3(out[3], a[3], b[3]);
  nand nand_inst_4(out[4], a[4], b[4]);
  nand nand_inst_5(out[5], a[5], b[5]);
  nand nand_inst_6(out[6], a[6], b[6]);
  nand nand_inst_7(out[7], a[7], b[7]);
endmodule

module ula_nand (input wire [7:0] a, b, output wire [15:0] out, output wire zero_flag); 
  wire [7:0] nand_8_out;
  nand_eight_bits nand_8_inst(.a(a), .b(b), .out(nand_8_out));

  fill_out fill_out_inst(.i0(nand_8_out), .out(out));
  zero_flag zero_flag_inst(out, zero_flag);
endmodule

module xor_eight_bits (input wire [7:0] a, b, output wire [7:0] out); 
  xor xor_inst_0(out[0], a[0], b[0]);
  xor xor_inst_1(out[1], a[1], b[1]);
  xor xor_inst_2(out[2], a[2], b[2]);
  xor xor_inst_3(out[3], a[3], b[3]);
  xor xor_inst_4(out[4], a[4], b[4]);
  xor xor_inst_5(out[5], a[5], b[5]);
  xor xor_inst_6(out[6], a[6], b[6]);
  xor xor_inst_7(out[7], a[7], b[7]);
endmodule

module ula_xor (input wire [7:0] a, b, output wire [15:0] out, output wire zero_flag); 
  wire [7:0] xor_8_out;
  xor_eight_bits xor_8_inst(.a(a), .b(b), .out(xor_8_out));

  fill_out fill_out_inst(.i0(xor_8_out), .out(out));
  zero_flag zero_flag_inst(out, zero_flag);
endmodule

module nor_eight_bits (input wire [7:0] a, b, output wire [7:0] out); 
  nor nor_inst_0(out[0], a[0], b[0]);
  nor nor_inst_1(out[1], a[1], b[1]);
  nor nor_inst_2(out[2], a[2], b[2]);
  nor nor_inst_3(out[3], a[3], b[3]);
  nor nor_inst_4(out[4], a[4], b[4]);
  nor nor_inst_5(out[5], a[5], b[5]);
  nor nor_inst_6(out[6], a[6], b[6]);
  nor nor_inst_7(out[7], a[7], b[7]);
endmodule

module ula_nor (input wire [7:0] a, b, output wire [15:0] out, output wire zero_flag); 
  wire [7:0] nor_8_out;
  nor_eight_bits nor_8_inst(.a(a), .b(b), .out(nor_8_out));

  fill_out fill_out_inst(.i0(nor_8_out), .out(out));
  zero_flag zero_flag_inst(out, zero_flag);
endmodule

module not_eight_bits (input wire [7:0] i0, output wire [7:0] out); 
  not not_inst_0(out[0], i0[0]);
  not not_inst_1(out[1], i0[1]);
  not not_inst_2(out[2], i0[2]);
  not not_inst_3(out[3], i0[3]);
  not not_inst_4(out[4], i0[4]);
  not not_inst_5(out[5], i0[5]);
  not not_inst_6(out[6], i0[6]);
  not not_inst_7(out[7], i0[7]);
endmodule

module not_sixteen_bits (input wire [15:0] i0, output wire [15:0] out); 
  wire [7:0] out_0, out_1;
  not_eight_bits not_eight_bits_inst_0 (.i0(i0[7:0]), .out(out_0));
  not_eight_bits not_eight_bits_inst_1 (.i0(i0[15:8]), .out(out_1));
  buf buf_inst_0_0(out[0], out_0[0]);
  buf buf_inst_0_1(out[1], out_0[1]);
  buf buf_inst_0_2(out[2], out_0[2]);
  buf buf_inst_0_3(out[3], out_0[3]);
  buf buf_inst_0_4(out[4], out_0[4]);
  buf buf_inst_0_5(out[5], out_0[5]);
  buf buf_inst_0_6(out[6], out_0[6]);
  buf buf_inst_0_7(out[7], out_0[7]);

  buf buf_inst_1_0(out[8], out_1[0]);
  buf buf_inst_1_1(out[9], out_1[1]);
  buf buf_inst_1_2(out[10], out_1[2]);
  buf buf_inst_1_3(out[11], out_1[3]);
  buf buf_inst_1_4(out[12], out_1[4]);
  buf buf_inst_1_5(out[13], out_1[5]);
  buf buf_inst_1_6(out[14], out_1[6]);
  buf buf_inst_1_7(out[15], out_1[7]);
endmodule