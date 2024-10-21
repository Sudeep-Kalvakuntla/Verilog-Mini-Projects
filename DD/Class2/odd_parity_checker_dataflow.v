module odd_parity_checker(
  input a0,
  input a1,
  input a2,
  input a3,
  output y
);

wire n1, n2;

n1 = a0 ^ a1;
n2 = a2 ^ a3;
y = n1 ^ n2;

endmodule
