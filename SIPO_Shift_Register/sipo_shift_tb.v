`timescale 1ns / 1ps

module sipo_shift_tb ();

  reg clk, rst, serial_in;
  wire [3:0] q;

  sipo_shift uut (
      clk,
      rst,
      serial_in,
      q
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("sipo_shift.vcd");
    $dumpvars(0, sipo_shift_tb);
    serial_in = 0;
    rst = 1;
    #5;
    rst = 0;

    #5;
    serial_in = 1;
    #10;
    serial_in = 0;
    #10;
    serial_in = 0;
    #10;
    serial_in = 1;
    #30;
    rst = 1;
    #5;
    rst = 0;

    #5;
    $finish;

  end

endmodule
