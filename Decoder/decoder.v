//3:8 one hot decoder

module one_hot_decoder (output wire [7:0] F,
                        input wire A, B, C);
  assign F[7] = ~A & ~B & ~C;
  assign F[6] = ~A & ~B & C;
  assign F[5] = ~A & B & ~C;
  assign F[4] = ~A & B & C;
  assign F[3] = A & ~B & ~C;
  assign F[2] = A & ~B & C;
  assign F[1] = A & B & ~C;
  assign F[0] = A & B & C;

endmodule
