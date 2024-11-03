module sipo_shift (
    input clk,
    input rst,
    input serial_in,
    output reg [3:0] q
);

  always @(posedge clk or posedge rst) begin

    if (rst) begin
      q <= 4'b0000;
    end else begin
      q <= {serial_in, q[3:1]};
    end

  end

endmodule
