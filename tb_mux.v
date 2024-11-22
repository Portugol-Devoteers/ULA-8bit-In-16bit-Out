`timescale 1ns/1ps

module tb_mux();

    // Variáveis para o MUX de 2 entradas
    reg i0, i1, selector;
    wire out;

    // Variáveis para o MUX de 8 bits
    reg [7:0] i0_8, i1_8;
    wire [7:0] out_8;

    // Variáveis para o MUX de 16 bits
    reg [15:0] i0_16, i1_16;
    wire [15:0] out_16;

    // Variáveis para o MUX de 4x16
    reg [15:0] i0_4, i1_4, i2_4, i3_4;
    reg [1:0] selectors_4;
    wire [15:0] out_4;

    // Variáveis para o MUX de 8x16
    reg [15:0] i0_8x16, i1_8x16, i2_8x16, i3_8x16, i4_8x16, i5_8x16, i6_8x16, i7_8x16;
    reg [2:0] selectors_8;
    wire [15:0] out_8x16;

    // Variáveis para o MUX de 16x16
    reg [15:0] i0_16x16, i1_16x16, i2_16x16, i3_16x16, i4_16x16, i5_16x16, i6_16x16, i7_16x16;
    reg [15:0] i8_16x16, i9_16x16, i10_16x16, i11_16x16, i12_16x16, i13_16x16, i14_16x16, i15_16x16;
    reg [3:0] selectors_16;
    wire [15:0] out_16x16;

    // Instanciação dos DUTs (Design Under Test)
    mux_2 mux_2_dut (.i0(i0), .i1(i1), .selector(selector), .out(out));
    mux_2_eight_bits mux_2_8_dut (.i0(i0_8), .i1(i1_8), .selector(selector), .out(out_8));
    mux_2_sixteen_bits mux_2_16_dut (.i0(i0_16), .i1(i1_16), .selector(selector), .out(out_16));
    mux_4_sixteen_bits mux_4_16_dut (.i0(i0_4), .i1(i1_4), .i2(i2_4), .i3(i3_4), .selectors(selectors_4), .out(out_4));
    mux_8_sixteen_bits mux_8_16_dut (
        .i0(i0_8x16), .i1(i1_8x16), .i2(i2_8x16), .i3(i3_8x16),
        .i4(i4_8x16), .i5(i5_8x16), .i6(i6_8x16), .i7(i7_8x16),
        .selectors(selectors_8), .out(out_8x16)
    );
    mux_16_sixteen_bits mux_16_16_dut (
        .i0(i0_16x16), .i1(i1_16x16), .i2(i2_16x16), .i3(i3_16x16),
        .i4(i4_16x16), .i5(i5_16x16), .i6(i6_16x16), .i7(i7_16x16),
        .i8(i8_16x16), .i9(i9_16x16), .i10(i10_16x16), .i11(i11_16x16),
        .i12(i12_16x16), .i13(i13_16x16), .i14(i14_16x16), .i15(i15_16x16),
        .selectors(selectors_16), .out(out_16x16)
    );

    // Estímulos e Testes
    initial begin
        $display("Testing mux_2...");
        // Testando mux_2 (Tabela Verdade)
        i0 = 0; i1 = 0; selector = 0; #10;
        $display("i0=%b, i1=%b, selector=%b -> out=%b", i0, i1, selector, out);
        i0 = 1; i1 = 0; selector = 0; #10;
        i0 = 0; i1 = 1; selector = 1; #10;

        // Testando mux_2_eight_bits
        $display("\nTesting mux_2_eight_bits...");
        i0_8 = 8'b10101010; i1_8 = 8'b01010101; selector = 0; #10;
        $display("i0=%b, i1=%b, selector=%b -> out=%b", i0_8, i1_8, selector, out_8);
        selector = 1; #10;

        // Testando mux_2_sixteen_bits
        $display("\nTesting mux_2_sixteen_bits...");
        i0_16 = 16'b1010101010101010; i1_16 = 16'b0101010101010101; selector = 0; #10;
        selector = 1; #10;

        // Testando mux_4_sixteen_bits
        $display("\nTesting mux_4_sixteen_bits...");
        i0_4 = 16'hAAAA; i1_4 = 16'h5555; i2_4 = 16'hFFFF; i3_4 = 16'h0000;
        selectors_4 = 2'b00; #10;
        selectors_4 = 2'b01; #10;

        // Testando mux_8_sixteen_bits
        $display("\nTesting mux_8_sixteen_bits...");
        i0_8x16 = 16'hAAAA; i1_8x16 = 16'h5555; i2_8x16 = 16'hFFFF; i3_8x16 = 16'h0000;
        i4_8x16 = 16'hF0F0; i5_8x16 = 16'h0F0F; i6_8x16 = 16'hAAAA; i7_8x16 = 16'h5555;
        selectors_8 = 3'b000; #10;
        selectors_8 = 3'b011; #10;

        // Testando mux_16_sixteen_bits
        $display("\nTesting mux_16_sixteen_bits...");
        i0_16x16 = 16'hAAAA; i1_16x16 = 16'h5555; i2_16x16 = 16'hFFFF; i3_16x16 = 16'h0000;
        i4_16x16 = 16'hF0F0; i5_16x16 = 16'h0F0F; i6_16x16 = 16'hAAAA; i7_16x16 = 16'h5555;
        i8_16x16 = 16'h1234; i9_16x16 = 16'h5678; i10_16x16 = 16'h9ABC; i11_16x16 = 16'hDEF0;
        i12_16x16 = 16'h1357; i13_16x16 = 16'h2468; i14_16x16 = 16'hACE0; i15_16x16 = 16'hFACE;
        selectors_16 = 4'b0000; #10;
        selectors_16 = 4'b1111; #10;

        $display("All tests completed.");
        $finish;
    end

endmodule