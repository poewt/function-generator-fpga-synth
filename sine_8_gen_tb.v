`timescale 1ns/1ps

module sine_8_gen_tb();

    // Test inputs
    reg clk;

    // Test outputs
    wire signed [7:0] sine_height;

    sine_8_gen uut(
        clk,
        sine_height
    );

    always #10 clk = ~clk;

    initial begin
        $dumpfile("sine_8_gen_tb.vcd");
        $dumpvars(0, sine_8_gen_tb);

        clk = 0;

        #500_000;

        $finish;
    end

endmodule