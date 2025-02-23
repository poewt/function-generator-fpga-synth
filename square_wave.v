module square_wave(
    input clk,
    output reg signed [7:0] square_out
);

parameter INCREMENT = 1;
parameter WIDTH = 10;
parameter HEIGHT = 8'sd1;

reg [7:0] counter = 0;
reg flip = 0;

always @(posedge clk) begin
    if (counter >= WIDTH) begin
        counter <= 0;
        flip = ~flip;
    end else begin
        counter <= counter + INCREMENT;
    end

    square_out <= flip ? -HEIGHT : HEIGHT;
end
endmodule