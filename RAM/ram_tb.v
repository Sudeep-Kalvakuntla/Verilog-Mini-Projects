`timescale 1ns / 1ps

module ram_tb ();

  parameter Width = 8;
  parameter Depth = 16;
  parameter AddrWidth = $clog2(Depth);

  reg clk;
  reg wrEn;
  reg [AddrWidth-1:0] wrAddr;
  reg [Width-1:0] wrData;
  reg [AddrWidth-1:0] rdAddr;
  wire [Width-1:0] rdData;

  always #5 clk = ~clk;

  ram #(Width, Depth) uut (
      clk,
      wrEn,
      wrAddr,
      wrData,
      rdAddr,
      rdData
  );


  initial begin
    $dumpfile("ram.vcd");
    $dumpvars(0, ram_tb);

    clk = 0;
    wrEn = 0;
    wrAddr = 0;
    wrData = 0;
    rdAddr = 0;

    #10;

    //Writing data to the RAM
    for (integer i = 0; i < 10; i = i + 1) begin
      wrEn   = 1;
      wrAddr = i;
      wrData = i * 2;  // Example data: 0, 2, 4, ..., 18
      #10;
    end

    // Disable write
    wrEn = 0;
    #10;

    // Read back the data from RAM
    for (integer i = 0; i < 10; i = i + 1) begin
      rdAddr = i;
      #10;
    end

    $finish;
  end

endmodule
