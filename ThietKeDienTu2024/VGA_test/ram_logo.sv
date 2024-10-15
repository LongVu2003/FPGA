/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  ram_logo
(
		input [15:0] read_address,
		output logic [11:0] output_color
);

// mem has width of 4 bits and a total of 400 addresses
//logic [3:0] mem [0:61951];
//
//logic [11:0] pal [2:0];
//assign pal[0] = 12'h000;
//assign pal[1] = 12'heac;
//assign pal[2] = 12'h940;

logic [3:0] mem [0:61951];

logic [23:0] pal [4:0];
assign pal[0] = 12'h808;
assign pal[1] = 12'h000;
assign pal[2] = 12'hFCC;
assign pal[3] = 12'h940;
assign pal[4] = 12'h0AE;

assign output_color = pal[mem[read_address]];

initial
begin
	 $readmemh("mario_logo.txt", mem);
end

endmodule
