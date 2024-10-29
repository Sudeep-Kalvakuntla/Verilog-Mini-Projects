module odd_parity_checker(
  input A0,
  input A1,
  input A2,
  input A3,
  output Y
);

wire n1, n2;

xor(n1, A0, A1);
xor(n2, A2, A3);
xor(Y, n1, n2);

endmodule
