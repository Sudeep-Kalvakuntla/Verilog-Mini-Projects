`timescale 1ns / 1ps

module ripple_carry_adder_tb ();

  reg [3:0] A, B;
  wire [3:0] Sum;
  wire Cout;

  ripple_carry_adder uut (
      Sum,
      Cout,
      A,
      B
  );

  initial begin
    $dumpfile("ripple_carry_adder.vcd");
    $dumpvars(0, ripple_carry_adder_tb);

    A = 4'b0;
    B = 4'b0;
    #10;

    // 5 + 3
    A = 4'b0101;
    B = 4'b0011;
    #10;

    // 15 + 15
    A = 4'b1111;
    B = 4'b1111;
    #10;

    $finish;

  end

endmodule

