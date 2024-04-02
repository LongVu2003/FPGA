module tb_mul2vector;
	reg [3:0] A0,A1,B0,B1;
	wire [8:0] C;
	
	Mul2vector m1(.A0(A0),.A1(A1),.B0(B0),.B1(B1),.C(C));
	
	initial begin
		A0 = 0; A1 = 0 ; B0 = 0; B1 = 0;
		
		//______________TEST1______________
		
		#10
		A0 = 1; A1 = 3; 
		B0 = 2; B1 = 4;
		#10
		display;
		
		//____________TEST2________________
		
		#10
		A0 = 1; A1 = 2; 
		B0 = 4; B1 = 3;
		#10
		display;
		
		#100 $stop;
		
		
    end
	 
	 task display;
		begin
		// hien ma tran A
		$display("MA TRAN A:");
		$display("[%d%d]",A0,A1);
		// hien ma tran B
		$display("MA TRAN B:");
		$display("[%d]",B0);
		$display("[%d]",B1);
		// hien ma tran ket qua 
		$display("MA TRAN KET QUA:");
		$display("[%d]",C);
		end
	endtask
endmodule
		
