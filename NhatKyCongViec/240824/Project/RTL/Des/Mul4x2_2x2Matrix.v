module Mul4x2_2x2Matrix(
	input signed [15:0] A0,A1,A2,A3,A4,A5,A6,A7,
	input signed [15:0] B0,B1,B2,B3,
	output signed [15:0] S0,S1,S2,S3,S4,S5,S6,S7
);

	Mul2vector m1(.A0(A0),.A1(A1),.B0(B0),.B1(B2),.C(S0));
	Mul2vector m2(.A0(A0),.A1(A1),.B0(B1),.B1(B3),.C(S1));
	
	Mul2vector m3(.A0(A2),.A1(A3),.B0(B0),.B1(B2),.C(S2));
	Mul2vector m4(.A0(A2),.A1(A3),.B0(B1),.B1(B3),.C(S3));
	
	Mul2vector m5(.A0(A4),.A1(A5),.B0(B0),.B1(B2),.C(S4));
	Mul2vector m6(.A0(A4),.A1(A5),.B0(B1),.B1(B3),.C(S5));
	
	Mul2vector m7(.A0(A6),.A1(A7),.B0(B0),.B1(B2),.C(S6));
	Mul2vector m8(.A0(A6),.A1(A7),.B0(B1),.B1(B3),.C(S7));
	
endmodule 