// Testbench for 8:3 encoder

`timescale 1ns/1ps

module encoder_tb (
  
);
  reg [7:0] inputs;
  wire [2:0] outputs;

  encoder uut (
    .in(inputs),
    .out(outputs)
  );

  integer i;

  initial begin
    $dumpfile("encoder.vcd");
    $dumpvars(0, encoder_tb);

    for (i = 0; i < 8; i++) begin
      inputs = 8'b00000001 << i;
      #10;
    end

    $finish;
  end

endmodule
