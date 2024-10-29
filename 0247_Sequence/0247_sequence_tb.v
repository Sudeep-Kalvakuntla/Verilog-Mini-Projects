`timescale 1ns / 1ps

module _0247_sequence_tb ();

  reg clk, rst;
  wire [2:0] q;

  _0247_sequence uut (
      clk,
      rst,
      q
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("0247_sequence.vcd");
    $dumpvars(0, _0247_sequence_tb);

    #6;
    rst = 1;
    #4;
    rst = 0;

    #55;
    rst = 1;
    #5;
    rst = 0;

    #15;
    $finish;

  end

endmodule
