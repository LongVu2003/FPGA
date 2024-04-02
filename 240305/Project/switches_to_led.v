module switches_to_led
	#(parameter N = 4)

	(input [N-1:0] i_switch ,
	output [N-1:0] o_led);

	assign o_led = i_switch;
endmodule
