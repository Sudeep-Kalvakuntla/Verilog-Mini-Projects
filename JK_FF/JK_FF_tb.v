`timescale 1ns / 1ps

module JK_FF_tb ();

  reg clk, rst, pst, J, K;
  wire Q, Q_bar;

  JK_FF uut (
      clk,
      J,
      K,
      rst,
      pst,
      Q,
      Q_bar
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("JK_FF.vcd");
    $dumpvars(0, JK_FF_tb);

    rst = 0;
    pst = 0;
    J   = 0;
    K   = 0;
    #10;

    //Testing asynchronous reset
    #2 rst = 1;
    #10;
    rst = 0;

    //Testing asynchronous preset
    #2 pst = 1;
    #10;
    pst = 0;

    //Testing FF set
    J   = 1;
    K   = 0;
    #10;

    // Testing "no change" state
    J = 0;
    K = 0;
    #10;

    // Testing FF reset
    J = 0;
    K = 1;
    #10;

    // Testing FF toggle
    J = 1;
    K = 1;
    #10;

    $finish;

  end

endmodule
