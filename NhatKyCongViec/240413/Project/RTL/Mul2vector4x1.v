module Mul2vector4x1(
	input  [15:0] A0,A1,A2,A3,B0,B1,B2,B3,
	output [15:0] OUT

);
	wire [15:0] out_tmp1,out_tmp2;
	wire [15:0] out_tmp3;
	//wire sign;

	Mul2vector m1(.A0(A0),.A1(A1),.B0(B0),.B1(B1),.C(out_tmp1));
	Mul2vector m2(.A0(A2),.A1(A3),.B0(B2),.B1(B3),.C(out_tmp2));
	
	vadd #(8,16) Add_u(.a(out_tmp1),.b(out_tmp2),.c(out_tmp3)); 
	//assign OUT1 = out_tmp1;
	//assign OUT2 = out_tmp2;
	assign OUT = out_tmp3;
	
endmodule 