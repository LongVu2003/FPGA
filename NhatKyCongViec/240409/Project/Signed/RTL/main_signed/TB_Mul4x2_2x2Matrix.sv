module TB_Mul4x2_2x2Matrix;
	reg signed [4:0] A0,A1,A2,A3,A4,A5,A6,A7;
	reg signed [4:0] B0,B1,B2,B3;
	wire signed [10:0] S0,S1,S2,S3,S4,S5,S6,S7;
	
	Mul4x2_2x2Matrix m1(	A0,A1,A2,A3,A4,A5,A6,A7,
							B0,B1,B2,B3,
							S0,S1,S2,S3,S4,S5,S6,S7);	
							
	initial begin
		//_____________INIT___________________
		A0  <= 0; A1  <= 0; A2  <= 0; A3  <= 0;
		A4  <= 0; A5  <= 0; A6  <= 0; A7  <= 0;
		B1  <= 0; B3  <= 0; 
		B0  <= 0; B2  <= 0; 
		//_____________TEST1___________________
		#10
		A0  <= -1; A1  <= 2; A2  <= 2; A3  <= 2;
		A4  <= 2; A5  <= 1; A6  <= 2; A7  <= 3;
		B1  <= 5; B3  <= -3;
		B0  <= 6; B2  <= 1;
		#5 display;
		
		//_____________TEST2___________________
		#10
		A0  <= -7; A1  <= 2; A2  <= 2; A3  <= 2;
		A4  <= 2; A5  <= 1; A6  <= 2; A7  <= 6;
		B1  <= 5; B3  <= -3;
		B0  <= 6; B2  <= 1;
		#5 display;
		
		end
		
		task display;
			begin
				$display("Ma tran A");
				$display("[%d %d]", A0,A1);
				$display("[%d %d]", A2,A3);
				$display("[%d %d]", A4,A5);
				$display("[%d %d]", A6,A7);
				$display("Ma tran B ");
				$display("[%d %d]", B0,B1);
				$display("[%d %d]", B2,B3);
				$display("Ma tran ket qua");
				$display("[%d %d]", S0,S1);
				$display("[%d %d]", S2,S3);
				$display("[%d %d]", S4,S5);
				$display("[%d %d]", S6,S7);
			end
		endtask
endmodule
