`timescale 1ns/1ps
module TB_Mul4x2_2x2Matrix;
	reg signed [15:0] A0,A1,A2,A3,A4,A5,A6,A7;
	reg signed [15:0] B0,B1,B2,B3;
	wire signed [15:0] S0,S1,S2,S3,S4,S5,S6,S7;
	
	Mul4x2_2x2Matrix m1(	A0,A1,A2,A3,A4,A5,A6,A7,
							B0,B1,B2,B3,
							S0,S1,S2,S3,S4,S5,S6,S7);	
							
	initial begin
		//_____________INIT___________________
		A0  <= 0; A1  <= 0; A2  <= 0; A3  <= 0;
		A4  <= 0; A5  <= 0; A6  <= 0; A7  <= 0;

		B1  <= 0; B3  <= 0;
		B0  <= 0; B2  <= 0; 
		#5
		//_____________TEST1___________________
		/*
			 0.5	 1.5			
			 0.5	-3.5	 x   -3.5	-3.5
			-1.5	 1.5		  -3.5	-3.5
			-3.5	-3.5	 				

		*/
		A0  <= 16'h0080; A1  <= 16'h0180;
		A2  <= 16'h0080; A3  <= 16'hfc80; 
		A4  <= 16'hfe80; A5  <= 16'h0180;
		A6  <= 16'hfc80; A7 <= 16'hfc80; 
		B1  <= 16'hfc80; B3  <= 16'hfc80; 
		B0  <= 16'hfc80; B2  <= 16'hfc80; 
		
		#5 display;
		
		//_____________TEST2___________________
		/*
			 0.5	 1.5					
			 0.5	-3.5	    x    -1	 -1 
			-1.5	 1.5			    1	 -2
			-3.5	-3.5	 				 

		*/
		A0  <= 16'h0080; A1  <= 16'h0180; 
		A2  <= 16'h0080; A3  <= 16'hfc80; 
		A4  <= 16'hfe80; A5  <= 16'h0180; 
		A6  <= 16'hfc80; A7  <= 16'hfc80; 
		B1  <= 16'hff00; B3  <= 16'hfe00; 
		B0  <= 16'hff00; B2  <= 16'h0100; 
		
		#5 display;
		
		
		//_____________TEST3___________________
		/*
			 0.5	 1.5					
			 0.5	-3.5	    x    -1	 -1 
			-1.5	 1.5				 1	 -2 
			-3.5	-3.5					 

		*/
		A0  <= 16'h0080; A1  <= 16'h0180; 
		A2  <= 16'h0080; A3  <= 16'hfc80; 
		A4  <= 16'hfe80; A5  <= 16'h0180; 
		A6  <= 16'hfc80; A7  <= 16'hfc80; 
		B1  <= 16'hff00; B3  <= 16'hfe00;
		B0  <= 16'hff00; B2  <= 16'h0100;
		
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
