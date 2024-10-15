/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  ram_tile_ground
(
		input [8:0] read_address,
		output logic [23:0] output_color
);

// mem has width of 4 bits and a total of 400 addresses
logic [3:0] mem [0:399];

logic [23:0] pal [8:0];
assign pal[0] = 24'hE75A10;
assign pal[1] = 24'h270700;
assign pal[2] = 24'h0C0B09;
assign pal[3] = 24'hF8E2C5;
assign pal[4] = 24'HE65A11;
assign pal[5] = 24'h371303;
assign pal[6] = 24'h78614F;
assign pal[7] = 24'h020100;

assign output_color = pal[mem[read_address]];

initial
begin
	 $readmemh("C:/ece385/final_project/ECE385-HelperTools-master/PNG To Hex/On-Chip Memory/sprite_bytes/zB.txt", mem);
end

endmodule
