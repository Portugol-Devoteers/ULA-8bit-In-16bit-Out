module shifter (
    input [7:0] in,             // Entrada a ser deslocada (divisor)
    input [2:0] shift_amount,   // Quantidade de deslocamentos
    output [7:0] out            // Saída deslocada
);
    assign out = in << shift_amount; // Deslocamento lógico à esquerda
endmodule

// nao funciona, me virei sozinho fazendo todos os códigos e ninguem ajudou e nao deu tempo de terminar o divisor apenas
module division_step (
    input [7:0] partial_dividend,  
    input [7:0] b,            // Divisor
    input [2:0] shift_amount,       // Quantidade de deslocamento
    output [7:0] rest,     // Resto parcial para a próxima etapa
    output result_bit            // Bit do quociente da etapa
);
    wire [7:0] shifted_b;     // Divisor deslocado
    wire [15:0] subtraction_result;          // Resultado da subtração
    wire gte_out;                  // Sinal do comparador
    wire [7:0] b_negative;
    wire zero_flag, sign_flag;  // Flags do comparador

    // Desloca o divisor
    shifter shift(
        .in(b),
        .shift_amount(shift_amount),
        .out(shifted_b)
    );

  
    ula_adder ula_adder_inst (
      .a(partial_dividend),
      .b(b),
      .operation(1'b1),
      .result(subtraction_result),
      .sign_flag(sign_flag),
      .zero_flag(zero_flag)
    );
 
    gte gte_inst(.zero_flag(zero_flag), .sign_flag(sign_flag), .out(gte_out));

    mux_2_eight_bits mux_rest_inst (
        .i0(partial_dividend),
        .i1(subtraction_result[7:0]),
        .selector(gte_out),
        .out(rest)
    );

    buf buf_inst_0(result_bit, gte_out);
endmodule

module divisor (
    input [7:0] a,  
    input [7:0] b, 
    output [7:0] result 
);
  wire [7:0] rest_1;
  wire [7:0] rest_2;
  wire [7:0] rest_3;
  wire [7:0] rest_4;
  wire [7:0] rest_5;
  wire [7:0] rest_6;
  wire [7:0] rest_7;
  wire [7:0] rest_8;

  buf buf_inst_0(result[0], 1'b0);
  buf buf_inst_1(result[1], 1'b0);
  buf buf_inst_2(result[2], 1'b0);
  buf buf_inst_3(result[3], 1'b0);
  buf buf_inst_4(result[4], 1'b0);
  buf buf_inst_5(result[5], 1'b0);
  buf buf_inst_6(result[6], 1'b0);
  buf buf_inst_7(result[7], 1'b0);

  division_step step_1_inst(
    .partial_dividend(a),
    .b(b),
    .shift_amount(3'b111),
    .rest(rest_1),
    .result_bit(result[7])
  );

  division_step step_2_inst(
    .partial_dividend(rest_1),
    .b(b),
    .shift_amount(3'b110),
    .rest(rest_2),
    .result_bit(result[6])
  );

  division_step step_3_inst(
    .partial_dividend(rest_2),
    .b(b),
    .shift_amount(3'b101),
    .rest(rest_3),
    .result_bit(result[5])
  );

  division_step step_4_inst(
    .partial_dividend(rest_3),
    .b(b),
    .shift_amount(3'b100),
    .rest(rest_4),
    .result_bit(result[4])
  );

  division_step step_5_inst(
    .partial_dividend(rest_4),
    .b(b),
    .shift_amount(3'b011),
    .rest(rest_5),
    .result_bit(result[3])
  );

  division_step step_6_inst(
    .partial_dividend(rest_5),
    .b(b),
    .shift_amount(3'b010),
    .rest(rest_6),
    .result_bit(result[2])
  );

  division_step step_7_inst(
    .partial_dividend(rest_6),
    .b(b),
    .shift_amount(3'b001),
    .rest(rest_7),
    .result_bit(result[1])
  );

  division_step step_8_inst(
    .partial_dividend(rest_7),
    .b(b),
    .shift_amount(3'b000),
    .rest(rest_8),
    .result_bit(result[0])
  );
endmodule

module ula_divisor(
    input wire [7:0] a, b,  
    output wire [15:0] result,
    output wire sign_flag, zero_flag 
);
  wire [7:0] a_absolute, b_absulute;
  wire [7:0] temp_result_8;
  wire [15:0] temp_result_16;

  get_absolute_value abs_inst_a(.n(a), .out(a_absolute));
  get_absolute_value abs_inst_b(.n(b), .out(b_absulute));

  divisor divisor_inst(
      .a(a_absolute),
      .b(b_absulute),
      .result(temp_result_8)
  );

  fill_out fill_out_inst_0 (
    .i0(temp_result_8),
    .out(temp_result_16)
  );

  apply_signal apply_signal_inst_0 (
    .a(a), .b(b), .temp_result(temp_result_16), .result(result)
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
