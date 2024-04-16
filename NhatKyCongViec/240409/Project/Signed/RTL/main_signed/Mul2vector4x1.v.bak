module Mul2vector4x1(
	input [3:0] A0,A1,A2,A3,B0,B1,B2,B3,
	output [9:0] OUT

);
	wire [8:0] out1,out2;

	Mul2vector m1(.A0(A0),.A1(A1),.B0(B0),.B1(B1),.C(out1));
	Mul2vector m2(.A0(A2),.A1(A3),.B0(B2),.B1(B3),.C(out2));
	
	assign OUT = out1 + out2;
	
endmodule 