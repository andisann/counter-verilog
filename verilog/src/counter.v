/**
 * counter.v
 *
 * A simple 8-bit counter module. The counter increments on each rising edge of the clock and resets to zero when the reset signal is low.
 * This is a try for a simple counter module for the SkyWater 130nm process.
*/
module counter (
    input wire clk_i;
    input wire rst_n_i;
    output wire [7:0] count_o
);

    reg [7:0] count;

    always @(posedge clk_i or negedge rst_n_i) begin
        if (!rst_n_i) begin
            count <= 8'b0;
        end else begin
            count <= count + 1;
        end
    end

    assign count_o = count;
  

endmodule // counter