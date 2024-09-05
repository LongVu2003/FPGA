module Matrix_H
	#(parameter WIDTH = 16,
	parameter DEPTH = 2,
	parameter COLL = 16,
	parameter DEPTH_LOG = $clog2(DEPTH),
	parameter WIDTH_LOG = $clog2(WIDTH),
	parameter COLL_LOG = $clog2(COLL))
	(input clk,
	input [DEPTH_LOG - 1 : 0] row,
	input [COLL_LOG - 1 : 0] collum,
	output reg [WIDTH-1:0] data_out
	);
	
	reg [WIDTH-1 : 0] rom [0: DEPTH - 1][0:COLL-1];
	
	initial begin
		 // H_real
    rom[0][0] = 16'h0080;// 00
    rom[0][1] = 16'h0180;// 01
    rom[0][2] = 16'hfe80;// 02
    rom[0][3] = 16'hfe80;// 03
    rom[0][4] = 16'h0080;// 10
    rom[0][5] = 16'hfc80;// 11
    rom[0][6] = 16'hfe80;// 12
    rom[0][7] = 16'hfe80;// 13
	 rom[0][8] = 16'hfe80;// 20
    rom[0][9] = 16'h0180;// 21
    rom[0][10] = 16'hfc80;//22
    rom[0][11] = 16'h0180;//23
    rom[0][12] = 16'hfc80;//30
    rom[0][13] = 16'hfc80;//31
    rom[0][14] = 16'h0080;//32
    rom[0][15] = 16'hfc80;//33

    // H_im
    rom[1][0] = 16'h0080;// 00
    rom[1][1] = 16'h0180;// 01
    rom[1][2] = 16'hfe80;// 02
    rom[1][3] = 16'hfe80;// 03
    rom[1][4] = 16'h0080;// 10
    rom[1][5] = 16'hfc80;// 11
    rom[1][6] = 16'hfe80;// 12
    rom[1][7] = 16'hfe80;// 13
	 rom[1][8] = 16'hfe80;// 20
    rom[1][9] = 16'h0180;// 21
    rom[1][10] = 16'hfc80;//22
    rom[1][11] = 16'h0180;//23
    rom[1][12] = 16'hfc80;//30
    rom[1][13] = 16'hfc80;//31
    rom[1][14] = 16'h0080;//32
    rom[1][15] = 16'hfc80;//33

	end
	
	always @(posedge clk) begin
		//if(rst) data_out <= 0;
		//else 
		data_out <= rom[row][collum];
	end
endmodule


