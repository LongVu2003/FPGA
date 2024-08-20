`timescale 1us/1ns
module tb_MatrixH();

	localparam WIDTH = 16;
	localparam COLL = 16;
	localparam DEPTH = 2;
	localparam DEPTH_LOG = $clog2(DEPTH);
	localparam WIDTH_LOG = $clog2(WIDTH);
	localparam COLL_LOG = $clog2(COLL);

	
	reg clk = 0,rst;
	reg  [3:0] addr;
	wire signed [15:0] Mat_H_real;
	wire signed [15:0] Mat_H_im;
	reg signed [15:0] matrixH_real[3:0][3:0],matrixH_im[3:0][3:0];
	
	integer i;
	integer j;
	Matrix_H MatrixH_real(.clk(clk),.row(0),.collum(addr),.data_out(Mat_H_real));
	Matrix_H MatrixH_im(.clk(clk),.row(1),.collum(addr),.data_out(Mat_H_im));
		
	always begin #0.5 clk = ~clk; end

	always @(posedge clk) begin
		if(rst) begin
			addr <= 0;
		end
		else begin
			if(addr < 15) begin
				addr <= addr + 1;
			end
			else begin
				addr <= addr;
			end
			
			matrixH_real[addr/4][addr-(addr/4)*4] <= Mat_H_real ;  
         matrixH_im[addr/4][addr-(addr/4)*4] <= Mat_H_im ;
			
			$display("Matrix H_real[%0d][%0d] = %h", addr/4, addr-(addr/4)*4, matrixH_real[addr/4][addr-(addr/4)*4]);
         $display("Matrix H_im[%0d][%0d] = %h", addr/4, addr-(addr/4)*4,  matrixH_im[addr/4][addr-(addr/4)*4]);
				
		end
	end
endmodule
