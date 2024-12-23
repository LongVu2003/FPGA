module TB_Mul2vector4x1;
	reg signed [4:0] A0,A1,A2,A3,B0,B1,B2,B3;
	wire signed[11:0] OUT;
	
	Mul2vector4x1 uut(A0,A1,A2,A3,B0,B1,B2,B3,OUT);
	
	initial begin
	A0 = 0; A1 = 0; A2 = 0; A3 = 0; 
	B0 = 0; B1 = 0; B2 = 0; B3 = 0;
		
		//______________TEST1______________
		
		#10
		A0 = 1; A1 = 3; A2 = -1; A3 = -5; 
		B0 = 2; B1 = -2; B2 = 2; B3 = -5;
		#10
		display;
		
		//____________TEST2________________
		
		#10
		A0 = 1; A1 = 3; A2 = 5; A3 = 5; 
		B0 = 2; B1 = 4; B2 = 2; B3 = 4;
		#10
		display;
		
		#100 $stop;
		
		
    end
	 
	 task display;
		begin
		// hien ma tran A
		$display("MA TRAN A:");
		$display("[%d%d%d%d]",A0,A1,A2,A3);
		// hien ma tran B
		$display("MA TRAN B:");
		$display("[%d]",B0);
		$display("[%d]",B1);
		$display("[%d]",B2);
		$display("[%d]",B3);
		// hien ma tran ket qua 
		$display("MA TRAN KET QUA:");
		$display("[%d]",OUT);
		end
	endtask
endmodule
	