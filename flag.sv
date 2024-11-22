module zero_flag (
  input wire [15:0] result,
  output wire zero_flag
);
  wire or_out;
  
  or or_inst_0 (
    or_out,
    result[0],
    result[1],
    result[2],
    result[3],
    result[4],
    result[5],
    result[6],
    result[7],
    result[8],
    result[9],
    result[10],
    result[11],
    result[12],
    result[13],
    result[14],
    result[15]
  );

  not not_inst_0 (
    zero_flag,
    or_out
  );
endmodule

module sign_flag (
  input wire [15:0] result,
  output wire sign_flag
);  
  assign sign_flag = result[15];
endmodule