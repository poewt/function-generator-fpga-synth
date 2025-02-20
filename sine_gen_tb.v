`timescale 1ns/1ps

module sine_gen_tb();
    // Test inputs
    reg clk;
    reg rst;

    // Test outputs
    wire [7:0] sine_out;

    sine_gen uut (
        clk,
        rst,
        sine_out
    );

    // Clock gen
    always #10 clk = ~clk; // 20 ns period -> 50 MHz

    initial begin
        $dumpfile("sine_gen_tb.vcd");
        $dumpvars(0, sine_gen_tb);

        // Init signals
        clk = 0;
        rst = 1;
        #50 rst = 0;// release reset after 50 ns

        #500_000 // run for 500,000 ns (0.5 ms)

        $finish;

    end
endmodule