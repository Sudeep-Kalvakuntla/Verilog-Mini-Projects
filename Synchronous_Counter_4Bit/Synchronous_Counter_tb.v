`timescale 1ns / 1ps

module Synchronous_Counter_tb ();

  reg clk, reset;
  wire [3:0] q;

  initial begin
    clk = 0;
    forever begin
      #5 clk = ~clk;
    end
  end

  Synchronous_Counter uut (
      clk,
      reset,
      q
  );

  initial begin
    $dumpfile("Synchronous_Counter.vcd");
    $dumpvars(0, Synchronous_Counter_tb);

    reset = 1;
    #10;

    reset = 0;  // Deasserting reset
    #100;

    #2;
    reset = 1;  //Testing asynchronous behaviour of reset
    #10;

    reset = 0;
    #50;

    $finish;


  end

endmodule
