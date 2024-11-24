module ula_eq(input zero_flag, output wire [15:0] out);
  assign out[15] = zero_flag;
endmodule

module ula_gte(input zero_flag, sign_flag, output wire [15:0] out);
  or or_inst_0 (
    out[15],
    zero_flag,
    sign_flag
  );
endmodule

module ula_lte(input zero_flag, sign_flag, output wire [15:0] out);
  wire is_positve;
  not not_inst_0 (
    is_positve,
    sign_flag
  );
  or or_inst_0 (
    out[15],
    zero_flag,
    is_positve
  );
endmodule