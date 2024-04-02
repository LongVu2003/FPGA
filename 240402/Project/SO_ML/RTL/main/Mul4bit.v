

module Mul4bit (
    input [3:0] A,
    input [3:0] B, 
    output [7:0]result   
);

	wire [3:0] m0;
	wire [4:0] m1;
	wire [5:0] m2;
	wire [6:0] m3;
	
	wire [7:0] s1,s2,s3;
	
	assign m0 = {4{A[0]}} & B[3:0];
	assign m1 = {4{A[1]}} & B[3:0];
	assign m2 = {4{A[2]}} & B[3:0];
	assign m3 = {4{A[3]}} & B[3:0];
	assign s1 = m0 + (m1<<1 );
	assign s2 = s1 + (m2<<2);
	assign s3 = s2 + (m3<<3);
	assign result = s3;
endmodule

