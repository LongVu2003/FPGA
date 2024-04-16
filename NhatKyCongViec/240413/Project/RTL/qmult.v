`timescale 1ns / 1ps


module qmult #(
	//Parameterized values
	parameter Q = 8,
	parameter N = 16
	)
	(
	 input			[N-1:0]	i_multiplicand,
	 input			[N-1:0]	i_multiplier,
	 output			[N-1:0]	o_result,
	 output	reg				ovr
	 );
	 
	
	reg [2*N-1:0]	r_result;		//	Multiplication by 2 values of N bits requires a 
	 //		register that is N+N = 2N deep...
	reg [N-1:0]		r_RetVal;

	reg [N-1:0]     temp_multiplicand, temp_meltiplier, temp_RetVal;
	reg is_signed;

	//--------------------------------------------------------------------------------
	assign o_result = r_RetVal;	//	Only handing back the same number of bits as we received...
		//		with fixed point in same location...

	//---------------------------------------------------------------------------------
	always @(i_multiplicand, i_multiplier)	begin						//	Do the multiply any time the inputs change
		// Make unsigned value
		// Since (signed) * (signed) does not give proper value
		temp_multiplicand = i_multiplicand[N-1] ? -i_multiplicand : i_multiplicand;
		temp_meltiplier = i_multiplier[N-1] ? -i_multiplier : i_multiplier;
		r_result = temp_meltiplier * temp_multiplicand;
	end

	always @(r_result) begin													//	Any time the result changes, we need to recompute the sign bit,
		is_signed = i_multiplicand[N-1] ^ i_multiplier[N-1];	// Check if the result is signed value
		temp_RetVal[N-2:0] = r_result[N-2+Q:Q];					// r_result >> Q
		temp_RetVal[N-1] = 0;									// Since it is unsigned value
		r_RetVal = is_signed ? -temp_RetVal : temp_RetVal;
		
		ovr = |r_result[2*N-2:N-1+Q];		// If there is anything left on r_result => overflow
	end

endmodule