// Sequence generator for the sequence 0-2-4-7

module _0247_sequence (
    input clk,
    input rst,
    output reg [2:0] q
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      q <= 3'b000;
    end else begin

      case (q)
        3'b000:  q <= 3'b010;  // 0 -> 2
        3'b010:  q <= 3'b100;  // 2 -> 4
        3'b100:  q <= 3'b111;  // 4 -> 7
        3'b111:  q <= 3'b000;  // 7 -> 0
        default: q <= 3'b000;
      endcase
    end
  end

endmodule
