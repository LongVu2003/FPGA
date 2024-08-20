module Mul2vector(A0,A1,B0,B1,C);
	input  [15:0] A0;
	input  [15:0] A1;
	input  [15:0] B0;
	input  [15:0] B1;
	output wire  [15:0] C;
	
	// Outputs
	wire  [15:0] out_tmp1;
	wire  [15:0] out_tmp2;
	wire [15:0] sum_temp;
	wire o_overflow1,o_overflow2;

	// Instantiate the Unit Under Test (UUT)
	qmult #(8,16) uut1 (
		.i_multiplicand(A0), 
		.i_multiplier(B0), 
		.o_result(out_tmp1), 
		.ovr(o_overflow1)
	);
	qmult #(8,16) uut2 (
		.i_multiplicand(A1), 
		.i_multiplier(B1), 
		.o_result(out_tmp2), 
		.ovr(o_overflow2)
	);

	vadd #(8,16) Add_u(.a(out_tmp1),.b(out_tmp2),.c(sum_temp)); 
	
	//assign C1 = out_tmp1;
	//assign C2 = out_tmp2;
	assign C = sum_temp;
	
endmodule
