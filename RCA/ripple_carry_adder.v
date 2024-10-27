module ripple_carry_adder (
    output wire [3:0] Sum,
    output wire Cout,
    input wire [3:0] A,
    B
);

  wire C1, C2, C3;

  full_adder U1 (
      Sum[0],
      C1,
      A[0],
      B[0],
      1'b0
  );

  full_adder U2 (
      Sum[1],
      C2,
      A[1],
      B[1],
      C1
  );

  full_adder U3 (
      Sum[2],
      C3,
      A[2],
      B[2],
      C2
  );

  full_adder U4 (
      Sum[3],
      Cout,
      A[3],
      B[3],
      C3
  );
endmodule
