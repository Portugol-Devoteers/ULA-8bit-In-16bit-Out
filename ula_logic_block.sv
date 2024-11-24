module ula_and (input wire [7:0] a, b, output wire [15:0] out, output wire zero_flag); 
  and and_inst(out, a, b);
  zero_flag zero_flag_inst(.result(out), .zero_flag(zero_flag));
endmodule

module ula_or (input wire [7:0] a, b, output wire [15:0] out, output wire zero_flag); 
  or or_inst(out, a, b);
  zero_flag zero_flag_inst(.result(out), .zero_flag(zero_flag));
endmodule

module ula_nand (input wire [7:0] a, b, output wire [15:0] out, output wire zero_flag); 
  nand nand_inst(out, a, b);
  zero_flag zero_flag_inst(out, zero_flag);
endmodule

module ula_xor (input wire [7:0] a, b, output wire [15:0] out, output wire zero_flag); 
  xor xor_inst(out, a, b);
  zero_flag zero_flag_inst(out, zero_flag);
endmodule

module ula_nor (input wire [7:0] a, b, output wire [15:0] out, output wire zero_flag); 
  nor nor_inst(out, a, b);
  zero_flag zero_flag_inst(out, zero_flag);
endmodule