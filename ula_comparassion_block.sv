module to_boolean(
  input wire result,
  output wire [15:0] out
);
  buf buf_inst(out[0], result);

  wire zero = 1'b0;

  buf buf_inst_0(out[1], zero);
  buf buf_inst_1(out[2], zero);
  buf buf_inst_2(out[3], zero);
  buf buf_inst_3(out[4], zero);
  buf buf_inst_4(out[5], zero);
  buf buf_inst_5(out[6], zero);
  buf buf_inst_6(out[7], zero);
  buf buf_inst_7(out[8], zero);
  buf buf_inst_8(out[9], zero);
  buf buf_inst_9(out[10], zero);
  buf buf_inst_10(out[11], zero);
  buf buf_inst_11(out[12], zero);
  buf buf_inst_12(out[13], zero);
  buf buf_inst_13(out[14], zero);
  buf buf_inst_14(out[15], zero);
endmodule

module ula_eq(input zero_flag, output wire [15:0] out);
  to_boolean to_boolean_inst_0 (
    .result(zero_flag),
    .out(out)
  );
endmodule

module gte(input zero_flag, sign_flag, output wire out);
  wire not_out;
   not not_inst_0 (
    not_out,
    sign_flag
  );
  or or_inst_0 (
    out,
    zero_flag,
    not_out
  );
endmodule

module ula_gte(input zero_flag, sign_flag, output wire [15:0] out);
  wire result;

  gte gte_inst_0 (
    .zero_flag(zero_flag),
    .sign_flag(sign_flag),
    .out(result)
  );

  to_boolean to_boolean_inst_0 (
    .result(result),
    .out(out)
  );
endmodule

module ula_lte(input zero_flag, sign_flag, output wire [15:0] out);
  wire result;

  or or_inst_0 (
    result,
    zero_flag,
    sign_flag
  );

  to_boolean to_boolean_inst_0 (
    .result(result),
    .out(out)
  );
endmodule