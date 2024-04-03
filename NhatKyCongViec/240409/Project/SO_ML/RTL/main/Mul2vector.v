module Mul2vector(A0,A1,B0,B1,C);
	input [3:0] A0;
	input [3:0] A1;
	input [3:0] B0;
	input [3:0] B1;
	output wire [8:0] C;
	
	wire [7:0] mulA;
	wire [7:0] mulB;
	
	
	Mul4bit m1(.A(A0),.B(B0),.result(mulA));
	Mul4bit m2(.A(A1),.B(B1),.result(mulB));
	
	reg cin = 1'b0;
	
	wire [8:0] add_total;
	
	adder8bit a(.s(add_total),.X(mulA),.Y(mulB),.Cin(cin));
	
	assign C = add_total;
	
endmodule