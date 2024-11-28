module half_adder(
  input wire a, b,
  output wire result, carry_out
);
  xor xor_inst_1(result, a, b);
  and and_inst_1(carry_out, a, b);
endmodule

module full_adder (
  input wire a,
  input wire b,
  input wire carry_in,
  output wire result,
  output wire carry_out
);
  wire result_ha1;
  wire [1:0] carries;

  half_adder ha_inst_1 (
    .a(a),
    .b(b),
    .result(result_ha1),
    .carry_out(carries[0])
  );

  half_adder ha_inst_2 (
    .a(result_ha1),
    .b(carry_in),
    .result(result),
    .carry_out(carries[1])
  );

  or or_inst_1 (
    carry_out,
    carries[0],
    carries[1]
  );
endmodule

module rca_eight_bits(
    input wire [7:0] a, b,
    input wire carry_in,
    output wire [7:0] result,
    output wire carry_out
);
  wire [6:0] carries;

    full_adder fa_inst_0 (
        .a(a[0]),
        .b(b[0]),
        .carry_in(carry_in), 
        .result(result[0]),
        .carry_out(carries[0])
    );

    full_adder fa_inst_1 (
        .a(a[1]),
        .b(b[1]),
        .carry_in(carries[0]), 
        .result(result[1]),
        .carry_out(carries[1])
    );

    full_adder fa_inst_2 (
        .a(a[2]),
        .b(b[2]),
        .carry_in(carries[1]), 
        .result(result[2]),
        .carry_out(carries[2])
    );

    full_adder fa_inst_3 (
        .a(a[3]),
        .b(b[3]),
        .carry_in(carries[2]), 
        .result(result[3]),
        .carry_out(carries[3])
    );

    full_adder fa_inst_4 (
        .a(a[4]),
        .b(b[4]),
        .carry_in(carries[3]), 
        .result(result[4]),
        .carry_out(carries[4])
    );

    full_adder fa_inst_5 (
        .a(a[5]),
        .b(b[5]),
        .carry_in(carries[4]), 
        .result(result[5]),
        .carry_out(carries[5])
    );

    full_adder fa_inst_6 (
        .a(a[6]),
        .b(b[6]),
        .carry_in(carries[5]), 
        .result(result[6]),
        .carry_out(carries[6])
    );

    full_adder fa_inst_7 (
        .a(a[7]),
        .b(b[7]),
        .carry_in(carries[6]), 
        .result(result[7]),
        .carry_out(carry_out)
    );   
endmodule

 module rca_ten_bits(
  input wire [9:0] a, b,       
  output wire [10:0] result    
);
  wire carries[1:0];

  rca_eight_bits rca_8_inst_0 (
    .a(a[7:0]),
    .b(b[7:0]),
    .carry_in(1'b0),
    .result(result[7:0]),
    .carry_out(carries[0])
  );

  full_adder fa_inst_0 (
    .a(a[8]),
    .b(b[8]),
    .carry_in(carries[0]),
    .result(result[8]),
    .carry_out(carries[1])
  );

  full_adder fa_inst_1 (
    .a(a[9]),
    .b(b[9]),
    .carry_in(carries[1]),
    .result(result[9]),
    .carry_out(result[10])
  );
endmodule

module rca_sixteen_bits(
  input wire [15:0] a, b,
  input wire carry_in,
  output wire [15:0] result,
  output wire carry_out
);
  wire carry_out_0;

  rca_eight_bits rca_8_inst_0 (
    .a(a[7:0]),
    .b(b[7:0]),
    .carry_in(carry_in),
    .result(result[7:0]),
    .carry_out(carry_out_0)
  );

  rca_eight_bits rca_8_inst_1 (
    .a(a[15:8]),
    .b(b[15:8]),
    .carry_in(carry_out_0),
    .result(result[15:8]),
    .carry_out(carry_out)
  );
endmodule

module extend_8_to_16(
  input wire [7:0] n,
  output wire [15:0] result
);
  buf buf_inst_0(result[0], n[0]);
  buf buf_inst_1(result[1], n[1]);
  buf buf_inst_2(result[2], n[2]);
  buf buf_inst_3(result[3], n[3]);
  buf buf_inst_4(result[4], n[4]);
  buf buf_inst_5(result[5], n[5]);
  buf buf_inst_6(result[6], n[6]);
  buf buf_inst_7(result[7], n[7]);
  buf buf_inst_8(result[8], n[7]);
  buf buf_inst_9(result[9], n[7]);
  buf buf_inst_10(result[10], n[7]);
  buf buf_inst_11(result[11], n[7]);
  buf buf_inst_12(result[12], n[7]);
  buf buf_inst_13(result[13], n[7]);
  buf buf_inst_14(result[14], n[7]);
  buf buf_inst_15(result[15], n[7]);
endmodule 

module handle_b_by_operation (
  input wire [7:0] b,
  input wire operation,
  output wire [7:0] out
);
  wire [7:0] not_b, inverted_b;

  not_eight_bits not_inst_0 (
    .i0(b),
    .out(not_b)
  );

  rca_eight_bits rca_8_inst_0 (
    .a(not_b),
    .b(8'b00000001),
    .carry_in(1'b0),
    .result(inverted_b)
  );

  mux_2_eight_bits mux_2_8_inst_0 (
    .i0(b),
    .i1(inverted_b),
    .selector(operation),
    .out(out)
  );
endmodule

module ula_adder(
  input wire [7:0] a, b,
  input operation,
  output wire [15:0] result,
  output wire sign_flag, zero_flag 
);
    wire [15:0] a_extend, b_extend;
    wire [1:0] carries;
    wire [7:0] b_by_operation; 

    handle_b_by_operation handle_b_by_operation_inst_0 (
      .b(b),
      .operation(operation),
      .out(b_by_operation)
    );

    extend_8_to_16 ext_8_16_inst_0 (
      .n(a),
      .result(a_extend)
    );
    extend_8_to_16 ext_8_16_inst_1 (
      .n(b_by_operation),
      .result(b_extend)
    );
  
    rca_sixteen_bits rca_16_inst_0 (
      .a(a_extend),
      .b(b_extend),
      .carry_in(1'b0),
      .result(result),
      .carry_out(carries[0])
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
