module Mul4x4_4x2matrix(
	input [3:0] A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,
	input [3:0] B0,B1,B2,B3,B4,B5,B6,B7,
	output [9:0] S0,S1,S2,S3,S4,S5,S6,S7
);

	Mul2vector4x1 m1(.A0(A0),.A1(A1),.A2(A2),.A3(A3),.B0(B0),.B1(B2),.B2(B4),.B3(B6),.OUT(S0));
	Mul2vector4x1 m2(.A0(A0),.A1(A1),.A2(A2),.A3(A3),.B0(B1),.B1(B3),.B2(B5),.B3(B7),.OUT(S1));
	
	Mul2vector4x1 m3(.A0(A4),.A1(A5),.A2(A6),.A3(A7),.B0(B0),.B1(B2),.B2(B4),.B3(B6),.OUT(S2));
	Mul2vector4x1 m4(.A0(A4),.A1(A5),.A2(A6),.A3(A7),.B0(B1),.B1(B3),.B2(B5),.B3(B7),.OUT(S3));
	
	Mul2vector4x1 m5(.A0(A8),.A1(A9),.A2(A10),.A3(A11),.B0(B0),.B1(B2),.B2(B4),.B3(B6),.OUT(S4));
	Mul2vector4x1 m6(.A0(A8),.A1(A9),.A2(A10),.A3(A11),.B0(B1),.B1(B3),.B2(B5),.B3(B7),.OUT(S5));
	
	Mul2vector4x1 m7(.A0(A12),.A1(A13),.A2(A14),.A3(A15),.B0(B0),.B1(B2),.B2(B4),.B3(B6),.OUT(S6));
	Mul2vector4x1 m8(.A0(A12),.A1(A13),.A2(A14),.A3(A15),.B0(B1),.B1(B3),.B2(B5),.B3(B7),.OUT(S7));
	
endmodule
	