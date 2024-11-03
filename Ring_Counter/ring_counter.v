// N bit ring counter
module ring_counter #(
    parameter N = 4
) (
    input clk,
    input rst,
    output reg [N-1:0] q
);

  always @(posedge clk or posedge rst) begin

    if (rst) begin
      q <= {{N - 1{1'b0}}, 1'b1};  // At least one 1 has to be there for the ring counter to work
    end else begin
      q <= {q[0], q[N-1:1]};
    end

  end

endmodule
