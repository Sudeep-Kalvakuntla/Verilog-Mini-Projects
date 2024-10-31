`timescale 1ns / 1ps

module asynchronous_counter_tb ();
  reg clk, rst;
  wire [3:0] q;

  asynchronous_counter uut (
      clk,
      rst,
      q
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("asynchronous_counter.vcd");
    $dumpvars(0, asynchronous_counter_tb);

    rst = 1;
    #10;
    rst = 0;

    #65;
    rst = 1;
    #5;
    rst = 0;
    #100;
    $finish;
  end

endmodule
