module full_adder (
    output S,
    Cout,
    input  A,
    B,
    Cin
);

  assign {Cout, S} = A + B + Cin;

endmodule
