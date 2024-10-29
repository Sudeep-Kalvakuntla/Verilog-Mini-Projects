module twoBitAdder (
input [1:0] A,
input [1:0] B,
output [2:0] C
);

wire cout;

halfAdder hA( // named instantiation
.A(A[0]),
.B(B[0]),
.S(S[0]),
.C(cout)
);

fullAdder fA(
.A(A[1]),
.B(B[1]),
.Cin(Cout),
.S(S[1]),
.Cout(S[2])
);

/* positional instantiation
halfAdder hA (
A[0], B[0], S[0], cout
);
*/



endmodule
