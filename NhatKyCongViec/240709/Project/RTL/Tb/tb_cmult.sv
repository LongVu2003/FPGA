module tb_cmult;	
	reg clk;
	reg signed [15:0] ar, ai;
	reg signed [15:0] br, bi;
	wire signed [32:0] pr, pi;
	
	cmult #(16,16) c0(.clk(clk),.ar(ar),.ai(ai),.br(br),.bi(bi),.pr(pr),.pi(pi));

	initial begin
	clk = 0;
	forever #5 clk = !clk;
	end

	initial begin
		clk = 0;
		ar = 0; 
		ai = 0;
		br = 0; 
		bi = 0;
		#10
		ar = 5; 
		ai = 0;
		br = 1; 
		bi = 0;
		#10
		ar = 2; 
		ai = 0;
		br = 2; 
		bi = 0;
		#10
		ar = 3; 
		ai = 0;
		br = 3; 
		bi = 0;
		#10
		ar = 4; 
		ai = 0;
		br = 4; 
		bi = 0;
		#10
		ar = 5; 
		ai = 0;
		br = 5; 
		bi = 0;
		
		#5000 $stop;
	end
endmodule

		