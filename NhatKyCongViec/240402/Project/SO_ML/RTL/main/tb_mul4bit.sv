
module TB_Mul;
	reg [3:0] A;
	reg [3:0] B;
	wire [7:0] result;
	
Matrix_Mul MM(A,B,result);
	initial begin
	A <= 0; B <= 0;
	#10
	A <= 4'd5;
	B <= 4'd2;
	$display("Matrix A : %d, Matrix B : %d \n Result : %d", A, B,result);
	#10
	A <= 4'd2;
	B <= 4'd3;
	$display("Matrix A : %d, Matrix B : %d \n Result : %d", A, B,result);
	#10
	A <= 4'd5;
	B <= 4'd7;
	$display("Matrix A : %d, Matrix B : %d \n Result : %d", A, B,result);

	#50 $stop;
	end
	
endmodule