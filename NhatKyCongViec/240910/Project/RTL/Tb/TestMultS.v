`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:01:19 01/02/2014
// Design Name:   qmults
// Module Name:   F:/FixedPoint/TestMultS.v
// Project Name:  FixedPoint
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: qmults
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestMultS;

	// Inputs
	reg [15:0] i_multiplicand;
	reg [15:0] i_multiplier;
	reg i_start;
	reg i_clk;

	// Outputs
	wire [15:0] o_result_out;
	wire o_complete;
	wire o_overflow;

	// Instantiate the Unit Under Test (UUT)
	qmults uut (
		.i_multiplicand(i_multiplicand), 
		.i_multiplier(i_multiplier), 
		.i_start(i_start), 
		.i_clk(i_clk), 
		.o_result_out(o_result_out), 
		.o_complete(o_complete), 
		.o_overflow(o_overflow)
	);


	always #5 i_clk = ~i_clk;
	initial begin
		// Initialize Inputs
		i_multiplicand = 0;
		i_multiplier = 0;
		i_start = 0;
		i_clk = 0;
        
		#5
		i_start = 1;
		i_multiplicand = 16'h0080; 
		i_multiplier = 16'h0080;
		
		
		
		#300 $stop;
		
		end
        

		
			
	always @(posedge o_complete)
		$display ("%b,%b,%b,%b", i_multiplicand, i_multiplier, o_result_out, o_overflow);		//	Monitor the stuff we care about


     
endmodule

