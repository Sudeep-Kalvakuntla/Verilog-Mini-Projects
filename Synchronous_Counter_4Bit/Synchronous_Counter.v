module Synchronous_Counter (
    input wire clk,
    input wire reset,
    output reg [3:0] q
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      q <= 4'b0000;
    end else begin
      q <= q + 1;
    end
  end

endmodule
