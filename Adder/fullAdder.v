module fullAdder(
input A,
input B,
input Cin,
output S,
output Cout
);

wire and1Out;
wire and2Out;
wire and3Out;

xor (S, A, B, Cin);
and (and1Out, A, Cin);
and (and2Out, A, B);
and (and3Out, B, Cin);
or (Cout, and1Out, and2Out, and3Out);

endmodule
