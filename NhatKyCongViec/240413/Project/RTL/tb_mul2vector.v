`timescale 1ns/1ps
module tb_mul2vector;
	
	reg [15:0] A0,A1,B0,B1;
	wire [15:0] C;
	
	
	Mul2vector m1(.A0(A0),.A1(A1),.B0(B0),.B1(B1),.C(C));
	
	
	
	initial begin
		A0 = 0; A1 = 0 ; B0 = 0; B1 = 0;
		#5
		A0 = 15'b0000000011101011; //0.9171875 
		B0 = 15'b0000001011101011; //2.9171875
		A1 = 15'b0000000011101011; //0.9171875 
		B1 = 15'b0000001011101011; //2.9171875
		#5;
		display;
		
		#5
		A0  <= 16'hfe80; A1  <= 16'hfe80;
		B0  <= 16'h0080; B1  <= 16'hfc80;
		#5;
		display;
    end
	 task display;
		begin
		// hien ma tran A
		$display("MA TRAN A:");
		$display("[%b %b]",A0,A1);
		// hien ma tran B
		$display("MA TRAN B:");
		$display("[%b]",B0);
		$display("[%b]",B1);
		// hien ma tran ket qua 
		$display("MA TRAN KET QUA:");
		$display("[%b]",C);
		end
	endtask
endmodule
		
