module sine_gen(
    input clk, rst,
    output reg [7:0] sine_out
);
    // Initialize 16-bit phase accumulator
    reg [15:0] phase_acc = 0;

    // Phase increment (controls frequency)
    parameter PHASE_INC = 500;

    // Sine Lookup Table (LUT)
    reg [7:0] sine_table [0:255];

    // Load precomputed sine values
    initial begin
      $readmemh("sine_lut.hex", sine_table);
    end

    always @ (posedge clk or posedge rst) begin
        if (rst)
            // Reset phase accumulator to 0 on rst
            phase_acc <= 0;
        else
            // Incrememnt phase accumulator on every posedge
            phase_acc <= phase_acc + PHASE_INC;
    end

    // Set sine_out value every time phase accumulator changes
    // Last 8 bits are used to fetch sine value
    always @ (*) begin
        sine_out = sine_table[phase_acc[15:8]];
    end

endmodule