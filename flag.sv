module zero_flag_eight_bits (
  input wire [7:0] result,
  output wire zero_flag
);  
  nor nor_inst_0 (
    zero_flag,
    result[0],
    result[1],
    result[2],
    result[3],
    result[4],
    result[5],
    result[6],
    result[7]
  );
endmodule

module zero_flag (
  input wire [15:0] result,
  output wire zero_flag
);
  wire result_0, result_1;
  zero_flag_eight_bits zero_flag_eight_bits_inst_0 (
    .result(result[7:0]),
    .zero_flag(result_0)
  );

  zero_flag_eight_bits zero_flag_eight_bits_inst_1 (
    .result(result[15:8]),
    .zero_flag(result_1)
  );

  and and_inst_0 (
    zero_flag,
    result_0,
    result_1
  );
endmodule

module sign_flag (
  input wire [15:0] result,
  output wire sign_flag
);  
  buf buf_inst_0 (
    sign_flag,
    result[15]
  );
endmodule