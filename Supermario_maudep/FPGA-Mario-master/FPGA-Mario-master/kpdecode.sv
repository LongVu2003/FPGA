// kpdecode.sv - ELEX 7660 Term Project
// Navtej Heir and Andrew Ydendberg 2017-03-25
module kpdecode(
	input logic [3:0] kpc, // Keypad Column
	input logic [3:0] kpr, // Keypad Row
	output logic kphit, // Keypad Hit Bit
	output logic [9:0] num); // Value to be output to display
	
	always_comb begin
		case (kpr) // Determine Keypad Row Hit
			7:
			unique case (kpc) // Check Columns...
			7: num = '1;
			11: num = 10'b1011101110; // biinary equivalent for ASCII w
			13: num = '1;
			14: num = '1;
		endcase
		11:
			unique case (kpc)
			7: num = 10'b1011000010; // biinary equivalent for ASCII a
			11: num = 10'b1011100110; // biinary equivalent for ASCII s
			13: num = 10'b1011001000; // biinary equivalent for ASCII d
			14: num = '1;
			endcase
		13:
			unique case (kpc)
			7: num = '1;
			11: num = '1;
			13: num = '1;
			14: num = '1;
			endcase
		14:
			unique case (kpc)
			7: num ='1;
			11: num = '1;
			13: num = '1;
			14: num = '1;
			endcase
		default: num = '1; // default output "1", standby mode
		
		endcase
		
		kphit = (kpr < 15) ? 1 : 0; // output "1" if key is detected
		
	end
	
endmodule
