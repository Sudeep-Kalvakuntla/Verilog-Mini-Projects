`timescale 1ns / 1ps

module gray_code_counter_tb ();

  reg clk;
  reg rst;
  wire [2:0] q;

  gray_code_counter uut (
      clk,
      rst,
      q
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("gray_code_counter.vcd");
    $dumpvars(0, gray_code_counter_tb);

    rst = 1;
    #5;
    rst = 0;

    #125;
    rst = 1;
    #2;
    rst = 0;

    #40;
    $finish;

  end

endmodule
