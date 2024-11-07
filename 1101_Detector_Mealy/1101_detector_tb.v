`timescale 1ns / 1ps

module detector_1101_tb ();
  reg clk, rst, in;
  wire out;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  detector_1101 uut (
      clk,
      rst,
      in,
      out
  );

  initial begin
    $dumpfile("detector_1101.vcd");
    $dumpvars(0, detector_1101_tb);
    rst = 1;
    #5;
    rst = 0;

    #5;
    in = 1;
    #20;
    in = 0;
    #10;
    in = 1;

    #10;
    in = 0;
    #10;
    in = 1;
    #30;
    in = 0;
    #10;
    in = 1;

    #20;
    $finish;

  end

endmodule
