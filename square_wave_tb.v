`timescale 1ns/1ps

module square_wave_tb();

    // test inputs
    reg clk;
    
    // test output
    wire [7:0] square_out;

    square_wave uut(
        clk,
        square_out
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("square_wave_tb.vcd");
        $dumpvars(0, square_wave_tb);

        clk = 0;
        #10

        #500_000

        $finish;
    end

endmodule