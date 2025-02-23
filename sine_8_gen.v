module sine_8_gen(
    input clk,
    output reg signed [7:0] sine_height
);
    reg [3:0] slice_counter = 0;

    // ==== 8 slices ====
    wire [3:0] n = 4'd8;
    reg signed [7:0] computed_values [7:0];
    initial begin
        computed_values[0] = 8'h00;
        computed_values[1] = 8'h5A;
        computed_values[2] = 8'h7F;
        computed_values[3] = 8'h5A;
        computed_values[4] = 8'h00;
        computed_values[5] = 8'hA6;
        computed_values[6] = 8'h81;
        computed_values[7] = 8'hA6;
    end


    always @(posedge clk) begin
        // When it reaches the before last one, it will update
        // and use that n-1 value as the last 
        if (slice_counter < n-1)
            slice_counter <= slice_counter + 1;
        else
            slice_counter <= 0;

        sine_height <= computed_values[slice_counter];
    end

endmodule