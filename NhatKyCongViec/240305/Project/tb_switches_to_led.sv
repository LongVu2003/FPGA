`timescale 1us/1ns
module tb_switches_to_led();

	parameter N = 4;
	reg [N-1:0] i_switch;
	wire [N-1:0] o_led;

	switches_to_led DUT(i_switch,o_led);

	initial begin
	 #1; i_switch = 4'b0000; //
	$monitor ($time, " i_switch = %b, o_led = %b", i_switch, o_led);
	  
	 #1; i_switch = 4'b0100;
	 #1; i_switch = 4'b1010;
	 #1; i_switch = 4'b0101;
	 #1; i_switch = 4'b1010;
	 #10; $stop;
	end

endmodule
	
