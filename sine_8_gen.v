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

    // ==== 16 slices ====
    // wire [3:0] n = 4'd16;
    // reg [7:0] computed_values [15:0];
    // initial begin
    //     computed_values[ 0] = 8'h00;  //  0°  ->  sin(0°) * 127 = 0
    //     computed_values[ 1] = 8'h38;  // 22.5° ->  sin(22.5°) * 127 = 49
    //     computed_values[ 2] = 8'h5A;  // 45°  ->  sin(45°) * 127 = 89
    //     computed_values[ 3] = 8'h73;  // 67.5° ->  sin(67.5°) * 127 = 115
    //     computed_values[ 4] = 8'h7F;  // 90°  ->  sin(90°) * 127 = 127
    //     computed_values[ 5] = 8'h73;  // 112.5° -> sin(112.5°) * 127 = 115
    //     computed_values[ 6] = 8'h5A;  // 135° -> sin(135°) * 127 = 89
    //     computed_values[ 7] = 8'h38;  // 157.5° -> sin(157.5°) * 127 = 49
    //     computed_values[ 8] = 8'h00;  // 180° -> sin(180°) * 127 = 0
    //     computed_values[ 9] = 8'hC8;  // 202.5° -> sin(202.5°) * 127 = -49
    //     computed_values[10] = 8'hA6;  // 225° -> sin(225°) * 127 = -89
    //     computed_values[11] = 8'h8D;  // 247.5° -> sin(247.5°) * 127 = -115
    //     computed_values[12] = 8'h81;  // 270° -> sin(270°) * 127 = -127
    //     computed_values[13] = 8'h8D;  // 292.5° -> sin(292.5°) * 127 = -115
    //     computed_values[14] = 8'hA6;  // 315° -> sin(315°) * 127 = -89
    //     computed_values[15] = 8'hC8;  // 337.5° -> sin(337.5°) * 127 = -49
    // end


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