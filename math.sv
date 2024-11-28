module get_absolute_value(input wire [7:0] n, output wire [7:0] out);
  wire [7:0] inverted_n, absolute_value;
  
  not_eight_bits not_inst_0 (
    .i0(n),
    .out(inverted_n)
  );

  rca_eight_bits rca_8_inst_1 (
    .a(inverted_n),
    .b(8'b00000001),
    .carry_in(1'b0), 
    .result(absolute_value)
  ); // Adiciona 1 
  
  // se [7] == 1, 
  // então a é negativo, 
  // então retorna o valor absoluto que é o valor invertido de a + 1 
  mux_2_eight_bits mux_2_8_inst_0(.i0(n), .i1(absolute_value), .selector(n[7]), .out(out)); 
endmodule

module to_two_complement(
  input wire [15:0] n,   
  output wire [15:0] out     
);
  wire [15:0] inverted;     

  not_sixteen_bits not_16_inst_0 (
    .i0(n),
    .out(inverted)
  );

  // Adicionar 1 ao valor invertido usando um Ripple Carry Adder e isso resulta no numero em complemento de dois
  rca_sixteen_bits rca_16_inst_0 (
    .a(inverted),
    .b(16'b0000000000000001),
    .carry_in(1'b0),
    .result(out),
    .carry_out()
  );
endmodule

module apply_signal (
  input wire [7:0] a, b, 
  input wire [15:0] temp_result, 
  output wire [15:0] result
);
  wire result_signal;
  xor xorSignal(result_signal, a[7], b[7]);

  wire [15:0] negative_result;
  to_two_complement to_two_c_inst_0(.n(temp_result), .out(negative_result));

  mux_2_sixteen_bits mux_2_16_inst_0(
    .i0(temp_result), 
    .i1(negative_result), 
    .selector(result_signal), 
    .out(result)
  );
endmodule
