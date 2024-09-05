module Mul2vector(A0,A1,B0,B1,C);
	input signed [4:0] A0;
	input signed [4:0] A1;
	input signed [4:0] B0;
	input signed [4:0] B1;
	output wire signed [10:0] C;
	
	
	wire signed [9:0] mulA;
	wire signed [9:0] mulB;
	
	
	Mul4bit m1(.A(A0),.B(B0),.result(mulA));
	Mul4bit m2(.A(A1),.B(B1),.result(mulB));
	
	
	wire [10:0] add_total;
	

	AddNbitSigned #(.DATA_WIDTH(9)) add1(.A(mulA),.B(mulB),.sum(add_total));
	
	assign C = add_total;
	
endmodule