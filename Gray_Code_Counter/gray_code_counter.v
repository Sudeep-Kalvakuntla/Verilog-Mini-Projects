// 3 bit gray code counter

module gray_code_counter (
    input clk,
    input rst,
    output reg [2:0] q
);

  reg [2:0] bin;

  always @(posedge clk or posedge rst) begin

    if (rst) begin
      bin <= 3'b000;
    end else begin
      bin = bin + 1;
    end

  end

  always @(*) begin
    q[2] = bin[2];
    q[1] = bin[2] ^ bin[1];
    q[0] = bin[1] ^ bin[0];
  end

endmodule
