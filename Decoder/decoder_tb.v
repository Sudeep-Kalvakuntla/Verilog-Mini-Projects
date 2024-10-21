// Test bench for 3:8 one-hot decoder

`timescale 1ns/1ps

module one_hot_decoder_tb;
  reg A, B, C;
  wire [7:0] F;

  one_hot_decoder uut (
    .A(A),
    .B(B),
    .C(C),
    .F(F)
  );

integer i;

  initial begin
    $dumpfile("one_hot_decoder.vcd");
    $dumpvars(0, one_hot_decoder_tb);
    
    for (i = 0; i < 8; i = i + 1) begin
            {A, B, C} = i;
            #10;
        end

    $finish;
  end
endmodule
