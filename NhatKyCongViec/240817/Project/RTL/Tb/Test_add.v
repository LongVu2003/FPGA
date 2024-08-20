`timescale 1ns / 1ps



module Test_add;

	// Inputs
	reg  [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [7:0] c;

	// Instantiate the Unit Under Test (UUT)
	vadd #(4,8) uut (
		.a(a), 
		.b(b), 
		.c(c)
	);



	
	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		
		#5 
		a = 2; b = 1;
		#5 
		display;
		
		#5 
		a = 1; b = 3;
		#5 
		display;
		
		#5 
		a = 8'hff; // -1
		b = 8'hf0; // 
		#5 
		display;
		
		#5 
		a = 8'hff; // -1
		b = 8'h02; // 
		#5 
		display;


	

	end
	task display;
		begin
		$display("a:%b b:%b, c:%b",a,b,c);
		end
	endtask
      
endmodule

