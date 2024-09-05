`timescale 1ns/1ps
module TB_Mul2vector4x1;
	reg signed [15:0] A0,A1,A2,A3,B0,B1,B2,B3;
	wire signed [15:0] OUT;
	
	Mul2vector4x1 uut(.A0(A0),.A1(A1),.A2(A2),.A3(A3),.B0(B0),.B1(B1),.B2(B2),.B3(B3),.OUT(OUT));
	
	initial begin
	A0 = 0; A1 = 0; A2 = 0; A3 = 0; 
	B0 = 0; B1 = 0; B2 = 0; B3 = 0;
	//______________TEST1______________
		#5
		A0 = 16'hff80; A1 = 16'hff00; A2 = 16'h0100; A3 = 16'hff00; 
		B0 = 16'hff00; B1 = 16'hff80; B2 = 16'hff80; B3 = 16'h0100;
		#5
		display;
		#5
		A0 = 15'b0000000011101011; //0.9171875 
		B0 = 15'b0000001011101011; //2.9171875
		A1 = 15'b0000000011101011; //0.9171875 
		B1 = 15'b0000001011101011; //2.9171875
		
		A2 = 15'b0000000011101011; //0.9171875 
		B2 = 15'b0000001011101011; //2.9171875
		A3 = 15'b0000000011101011; //0.9171875 
		B3 = 15'b0000001011101011; //2.9171875
		#5
		display;
		
		#5
		A0  <= 16'h0080; A1  <= 16'h0180; A2  <= 16'hfe80; A3  <= 16'hfe80;
		
		B0  <= 16'hfc80; B1  <= 16'hfc80; B2  <= 16'h0080; B3  <= 16'hfc80;
		#5
		display;

	
	end
	 
	 task display;
		begin
		// hien ma tran A
		$display("MA TRAN A:");
		$display("[%h %h %h %h]",A0,A1,A2,A3);
		// hien ma tran B
		$display("MA TRAN B:");
		$display("[%h]",B0);
		$display("[%h]",B1);
		$display("[%h]",B2);
		$display("[%h]",B3);
		// hien ma tran ket qua 
		$display("MA TRAN KET QUA:");
		$display("[%h]",OUT);
		end
	endtask
endmodule
	