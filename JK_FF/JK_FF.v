module JK_FF (
    input  wire clk,
    input  wire J,
    input  wire K,
    input  wire rst,
    input  wire pst,
    output reg  Q,
    output wire Q_bar
);
  assign Q_bar = ~Q;

  always @(posedge clk or posedge rst or posedge pst) begin
    if (rst) begin
      Q <= 0;
    end else if (pst) begin
      Q <= 1;
    end else begin

      case ({
        J, K
      })
        2'b00: Q <= Q;  // No change
        2'b10: Q <= 1;  // J = 1, K = 0 -> Set
        2'b01: Q <= Q;  // J  = 0, K = 1 -> Reset
        2'b11: Q <= ~Q;  // Toggle

      endcase

    end

  end

endmodule
