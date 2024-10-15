module colseq( 
	input logic [3:0] kpr,
	input logic clk,
	input logic reset_n,
	output logic [3:0] kpc
);
	logic [3:0] column_hold; // Temp hold for column bits
	logic [3:0] row_hold; // Temp hold for row bits
	logic hold; // 1 - hold, 0 - scan (mode)
	
	// Initialize kpc bit sequence
	
	initial begin
	kpc = 4'b0111;
	end
	
	// Controller
	always@(posedge clk) begin // Controller holds shift sequence if row is activated
		if(reset_n)begin
			if(kpr < 15) hold = 1;
			else hold = 0;
		end
	end
	// Datapath Registers
	// Datapath scans keypad columns and outputs to kpc
	
	always@(posedge clk) begin // In hold mode kpc and kpr are output, else scans
		if(hold)begin
			column_hold = kpc;
			row_hold = kpr;
		end
			// Settings outputs for kpc and kpr if in hold mode
		else begin //kpc = column_hold;
			if(kpc == 4'b1110) kpc = 4'b0111; // Set to col 3 if col 0 selected
			else if (!reset_n) kpc = 4'b0111;
			else kpc = (kpc >> 1) + 8; // Scanning col by bit shifting
		end
	end
endmodule
