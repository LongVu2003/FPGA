`timescale 1ns / 1ps
module Test_mult;
	// Inputs
	reg [15:0] i_multiplicand;
	reg [15:0] i_multiplier;

	// Outputs
	wire [15:0] o_result;
	wire			ovr;
	
	// Instantiate the Unit Under Test (UUT)
	qmult #(8,16) uut (
		.i_multiplicand(i_multiplicand), 
		.i_multiplier(i_multiplier), 
		.o_result(o_result),
		.ovr(ovr)
	);

	initial begin
		i_multiplicand = 0;											
		i_multiplier = 0;	
	
		#5
 		i_multiplicand = 16'b0000000011101011;	//-1.5										
		i_multiplier = 16'b0000001011101011;	//0.5	
		#5 $display ("%h,%h,%h,%h", i_multiplicand, i_multiplier, o_result, ovr);//	Monitor the stuff we care about	
		
		#5
		i_multiplicand  = 16'hfe80; 
		i_multiplier  = 16'h0080; 
		#5 $display ("%h,%h,%h,%h", i_multiplicand, i_multiplier, o_result, ovr);
		
		#5
		i_multiplicand  = 16'hfe80;
		i_multiplier  = 16'hfc80;
		#5 $display ("%h,%h,%h,%h", i_multiplicand, i_multiplier, o_result, ovr);
  	end



endmodule

