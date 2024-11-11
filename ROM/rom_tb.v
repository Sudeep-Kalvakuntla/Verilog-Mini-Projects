`timescale 1ns / 1ps

module rom_tb ();
  parameter Width = 16;
  parameter Depth = 1024;
  parameter Dbin = $clog2(Depth) - 1;

  reg clk;
  reg [Dbin:0] rdAddr;
  wire [Width - 1:0] rdData;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  rom uut (
      clk,
      rdAddr,
      rdData
  );

  initial begin
    $dumpfile("rom.vcd");
    $dumpvars(0, rom_tb);

    rdAddr = 0;

    #20;

    for (integer i = 0; i < 10; i++) begin

      rdAddr = i;
      #10;

    end

    $finish;
  end

  always @(posedge clk) begin
    $display("Time: %0t | Addr: %0d | Data: %0h", $time, rdAddr, rdData);
  end


endmodule
