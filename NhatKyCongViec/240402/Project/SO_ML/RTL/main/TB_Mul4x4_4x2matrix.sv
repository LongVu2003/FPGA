module TB_Mul4x4_4x2matrix;
	reg [3:0] A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15;
	reg [3:0] B0,B1,B2,B3,B4,B5,B6,B7;
	wire [9:0] S0,S1,S2,S3,S4,S5,S6,S7;
	
	Mul4x4_4x2matrix m1(	A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,
							B0,B1,B2,B3,B4,B5,B6,B7,
							S0,S1,S2,S3,S4,S5,S6,S7);	
							
	initial begin
		//_____________INIT___________________
		A0  <= 0; A1  <= 0; A2  <= 0; A3  <= 0;
		A4  <= 0; A5  <= 0; A6  <= 0; A7  <= 0;
		A8  <= 0; A9  <= 0; A10 <= 0; A11 <= 0;
		A12 <= 0; A13 <= 0; A14 <= 0; A15 <= 0;
		B1  <= 0; B3  <= 0; B5  <= 0; B7  <= 0;
		B0  <= 0; B2  <= 0; B4  <= 0; B6  <= 0;
		//_____________TEST1___________________
		#10
		A0  <= 1; A1  <= 2; A2  <= 2; A3  <= 2;
		A4  <= 2; A5  <= 1; A6  <= 2; A7  <= 3;
		A8  <= 3; A9  <= 1; A10 <= 1; A11 <= 2;
		A12 <= 4; A13 <= 2; A14 <= 1; A15 <= 1;
		B1  <= 5; B3  <= 3; B5  <= 2; B7  <= 3;
		B0  <= 6; B2  <= 1; B4  <= 3; B6  <= 7;
		#10 display;
		
		//_____________TEST2___________________
		#10
		A0  <= 7; A1  <= 2; A2  <= 2; A3  <= 2;
		A4  <= 2; A5  <= 1; A6  <= 2; A7  <= 6;
		A8  <= 3; A9  <= 9; A10 <= 1; A11 <= 2;
		A12 <= 4; A13 <= 2; A14 <= 1; A15 <= 1;
		B1  <= 5; B3  <= 3; B5  <= 2; B7  <= 3;
		B0  <= 6; B2  <= 1; B4  <= 5; B6  <= 7;
		#10 display;
		
		end
		
		task display;
			begin
				$display("Ma tran A");
				$display("[%d %d %d %d]", A0,A1,A2,A3);
				$display("[%d %d %d %d]", A4,A5,A6,A7);
				$display("[%d %d %d %d]", A8,A9,A10,A11);
				$display("[%d %d %d %d]", A12,A13,A14,A15);
				$display("Ma tran B ");
				$display("[%d %d]", B0,B1);
				$display("[%d %d]", B2,B3);
				$display("[%d %d]", B4,B5);
				$display("[%d %d]", B6,B7);
				$display("Ma tran ket qua");
				$display("[%d %d]", S0,S1);
				$display("[%d %d]", S2,S3);
				$display("[%d %d]", S4,S5);
				$display("[%d %d]", S6,S7);
			end
		endtask
endmodule
					
		