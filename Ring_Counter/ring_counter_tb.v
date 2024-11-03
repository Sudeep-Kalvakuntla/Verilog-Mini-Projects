`timescale 1ns / 1ps

module ring_counter_tb ();
  parameter N = 4;

  reg clk, rst;
  wire [N-1:0] q;

  ring_counter #(
      .N(N)
  ) uut (
      clk,
      rst,
      q
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("ring_counter.vcd");
    $dumpvars(0, ring_counter_tb);
    rst = 1;
    #5;
    rst = 0;

    repeat (2 * N) @(posedge clk);  // Wait for 2 cycles of full rotation

    $finish;
  end

endmodule
