`timescale 1ns / 1ps
module tb_cmult;	
	localparam Q = 8;
	localparam N = 16;
	reg clk;
	reg signed  [N-1:0] ar, ai;
	reg signed  [N-1:0] br, bi;
	wire signed [N-1:0] pr, pi;
	
	cmult #(8,16) c0(.clk(clk),.ar(ar),.ai(ai),.br(br),.bi(bi),.pr(pr),.pi(pi));

	initial begin
	clk = 1;
	forever #5 clk = !clk;
	end

	initial begin
		ar = 0; 
		ai = 0;
		br = 0; 
		bi = 0;
		#10
		ar = 16'h0080; //0.5
		ai = 16'h0000;
		br = 16'h0180; //1.5
		bi = 16'h0000;
		#10
		ar = 16'hfe80; // -1.5
		ai = 16'h0000;
		br = 16'hfc80; //-3.5
		bi = 16'h0000;
		#10
		ar = 16'h0080; // 0.5
		ai = 16'h0000;
		br = 16'h0080; //0.5
		bi = 16'h0000;
		#10
		ar = 16'hfc80; // -3.5
		ai = 16'h0000;
		br = 16'hfc80; //-3.5
		bi = 16'h0000;
		#10
		ar = 16'hfe80; // -1.5
		ai = 16'h0000;
		br = 16'h0180; //1.5
		bi = 16'h0000;
		#10
		
		#5000 $stop;
	end
endmodule

		