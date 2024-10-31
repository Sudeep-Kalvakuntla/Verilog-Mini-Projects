module asynchronous_counter (
    input clk,
    input rst,
    output reg [3:0] q
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      q <= 4'b0000;
    end else begin

      q[0] <= ~q[0];  // Toggle the LSB
      q[1] <= q[0] ? ~q[1] : q[1];  // Toggle q[1] if q[0] toggles from 1 to 0
      q[2] <= (q[1] & q[0]) ? ~q[2] : q[2];  // Toggle q[2] if q[0] and q[1] toggle from 1 to 0
      q[3] <= (q[2] & q[1] & q[0]) ? ~q[3] : q[3]; // Toggle q[3] if q[2], q[1] and q[0] toggle from 1 to 0

    end
  end

endmodule
