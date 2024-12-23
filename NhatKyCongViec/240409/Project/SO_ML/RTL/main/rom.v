module rom
	#(parameter WIDTH = 5,
	parameter DEPTH = 37,
	parameter COLL = 8,
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
		 // Row 0 : v + A1
    rom[0][0] = -3;
    rom[0][1] = -1;
    rom[0][2] = 1;
    rom[0][3] = 3;
    rom[0][4] = 1;
    rom[0][5] = 0;
    rom[0][6] = 0;
    rom[0][7] = 1;

    // Row 1 : A2+B1
    rom[1][0] = 0;
    rom[1][1] = -1;
    rom[1][2] = 1;
    rom[1][3] = 0;
    rom[1][4] = 1;
    rom[1][5] = 0;
    rom[1][6] = 0;
    rom[1][7] = -1;

    // Row 2 B2 + Bv
    rom[2][0] = 0;
    rom[2][1] = 1;
    rom[2][2] = 1;
    rom[2][3] = 0;
    rom[2][4] = 0;
    rom[2][5] = 1;
    rom[2][6] = 3;
    rom[2][7] = 2;

    // Row 3 S1_real
    rom[3][0] = 1;
    rom[3][1] = 1;
    rom[3][2] = -1;
    rom[3][3] = 1;
    rom[3][4] = 1;
    rom[3][5] = 1;
    rom[3][6] = -1;
    rom[3][7] = 1;

    // Row 4 S1_im
    rom[4][0] = 0;
    rom[4][1] = 0;
    rom[4][2] = 0;
    rom[4][3] = 0;
    rom[4][4] = 0;
    rom[4][5] = 0;
    rom[4][6] = 0;
    rom[4][7] = 0;

    // Row 5 S2_real
    rom[5][0] = 1;
    rom[5][1] = 1;
    rom[5][2] = -1;
    rom[5][3] = 1;
    rom[5][4] = 1;
    rom[5][5] = 0;
    rom[5][6] = 0;
    rom[5][7] = 1;

    // Row 6 S2_im
    rom[6][0] = 0;
    rom[6][1] = 0;
    rom[6][2] = 0;
    rom[6][3] = 0;
    rom[6][4] = 0;
    rom[6][5] = 1;
    rom[6][6] = 1;
    rom[6][7] = 0;

    // Row 7 S3_real
    rom[7][0] = 1;
    rom[7][1] = 1;
    rom[7][2] = -1;
    rom[7][3] = 1;
    rom[7][4] = 1;
    rom[7][5] = -1;
    rom[7][6] = 1;
    rom[7][7] = 1;

    // Row 8 s3_im
    rom[8][0] = 0;
    rom[8][1] = 0;
    rom[8][2] = 0;
    rom[8][3] = 0;
    rom[8][4] = 0;
    rom[8][5] = 0;
    rom[8][6] = 0;
    rom[8][7] = 0;

    // Row 9  S4_real
    rom[9][0] = 1;
    rom[9][1] = 1;
    rom[9][2] = -1;
    rom[9][3] = 1;
    rom[9][4] = 1;
    rom[9][5] = 0;
    rom[9][6] = 0;
    rom[9][7] = 1;

    // Row 10 S4_im
    rom[10][0] = 0;
    rom[10][1] = 0;
    rom[10][2] = 0;
    rom[10][3] = 0;
    rom[10][4] = 0;
    rom[10][5] = -1;
    rom[10][6] = -1;
    rom[10][7] = 0;

    // Row 11 S5_real
    rom[11][0] = 1;
    rom[11][1] = 1;
    rom[11][2] = -1;
    rom[11][3] = 1;
    rom[11][4] = -1;
    rom[11][5] = 1;
    rom[11][6] = -1;
    rom[11][7] = -1;

    // Row 12 S5_im
    rom[12][0] = 0;
    rom[12][1] = 0;
    rom[12][2] = 0;
    rom[12][3] = 0;
    rom[12][4] = 0;
    rom[12][5] = 0;
    rom[12][6] = 0;
    rom[12][7] = 0;

    // Row 13 S6_real 
    rom[13][0] = 1;
    rom[13][1] = 1;
    rom[13][2] = -1;
    rom[13][3] = 1;
    rom[13][4] = -1;
    rom[13][5] = 0;
    rom[13][6] = 0;
    rom[13][7] = -1;

    // Row 14 S6_im
    rom[14][0] = 0;
    rom[14][1] = 0;
    rom[14][2] = 0;
    rom[14][3] = 0;
    rom[14][4] = 0;
    rom[14][5] = 1;
    rom[14][6] = 1;
    rom[14][7] = 0;

    // Row 15 S7_real
    rom[15][0] = 1;
    rom[15][1] = 1;
    rom[15][2] = -1;
    rom[15][3] = 1;
    rom[15][4] = -1;
    rom[15][5] = -1;
    rom[15][6] = 1;
    rom[15][7] = -1;

    // Row 16 S7_im
    rom[16][0] = 0;
    rom[16][1] = 0;
    rom[16][2] = 0;
    rom[16][3] = 0;
    rom[16][4] = 0;
    rom[16][5] = 0;
    rom[16][6] = 0;
    rom[16][7] = 0;

    // Row 17 S8_real
    rom[17][0] = 1;
    rom[17][1] = 1;
    rom[17][2] = -1;
    rom[17][3] = 1;
    rom[17][4] = -1;
    rom[17][5] = 0;
    rom[17][6] = 0;
    rom[17][7] = -1;

    // Row 18 S8_im
    rom[18][0] = 0;
    rom[18][1] = 0;
    rom[18][2] = 0;
    rom[18][3] = 0;
    rom[18][4] = 0;
    rom[18][5] = -1;
    rom[18][6] = -1;
    rom[18][7] = 0;

    // Row 19 S9_Real
    rom[19][0] = 1;
    rom[19][1] = 1;
    rom[19][2] = -1;
    rom[19][3] = 1;
    rom[19][4] = 0;
    rom[19][5] = 1;
    rom[19][6] = -1;
    rom[19][7] = 0;

    // Row 20 S9_im
    rom[20][0] = 0;
    rom[20][1] = 0;
    rom[20][2] = 0;
    rom[20][3] = 0;
    rom[20][4] = 1;
    rom[20][5] = 0;
    rom[20][6] = 0;
    rom[20][7] = 1;

    // Row 21 S10_real
    rom[21][0] = 1;
    rom[21][1] = 1;
    rom[21][2] = -1;
    rom[21][3] = 1;
    rom[21][4] = 0;
    rom[21][5] = 0;
    rom[21][6] = 0;
    rom[21][7] = 0;

    // Row 22 S10_im
    rom[22][0] = 0;
    rom[22][1] = 0;
    rom[22][2] = 0;
    rom[22][3] = 0;
    rom[22][4] = 1;
    rom[22][5] = 1;
    rom[22][6] = 1;
    rom[22][7] = 1;

    // Row 23 S11_real
    rom[23][0] = 1;
    rom[23][1] = 1;
    rom[23][2] = -1;
    rom[23][3] = 1;
    rom[23][4] = 0;
    rom[23][5] = -1;
    rom[23][6] = 1;
    rom[23][7] = 0;

    // Row 24 S11_im
    rom[24][0] = 0;
    rom[24][1] = 0;
    rom[24][2] = 0;
    rom[24][3] = 0;
    rom[24][4] = 1;
    rom[24][5] = 0;
    rom[24][6] = 0;
    rom[24][7] = 1;

    // Row 25 S12_real
    rom[25][0] = 1;
    rom[25][1] = 1;
    rom[25][2] = -1;
    rom[25][3] = 1;
    rom[25][4] = 0;
    rom[25][5] = 0;
    rom[25][6] = 0;
    rom[25][7] = 0;

    // Row 26 S12_im
    rom[26][0] = 0;
    rom[26][1] = 0;
    rom[26][2] = 0;
    rom[26][3] = 0;
    rom[26][4] = 1;
    rom[26][5] = -1;
    rom[26][6] = -1;
    rom[26][7] = 1;

    // Row 27 S13_real
    rom[27][0] = 1;
    rom[27][1] = 1;
    rom[27][2] = -1;
    rom[27][3] = 1;
    rom[27][4] = 0;
    rom[27][5] = 1;
    rom[27][6] = -1;
    rom[27][7] = 0;

    // Row 28 S13_im
    rom[28][0] = 0;
    rom[28][1] = 0;
    rom[28][2] = 0;
    rom[28][3] = 0;
    rom[28][4] = -1;
    rom[28][5] = 0;
    rom[28][6] = 0;
    rom[28][7] = -1;

    // Row 29 S14_real
    rom[29][0] = 1;
    rom[29][1] = 1;
    rom[29][2] = -1;
    rom[29][3] = 1;
    rom[29][4] = 0;
    rom[29][5] = 0;
    rom[29][6] = 0;
    rom[29][7] = 0;

    // Row 30 S14_im
    rom[30][0] = 0;
    rom[30][1] = 0;
    rom[30][2] = 0;
    rom[30][3] = 0;
    rom[30][4] = -1;
    rom[30][5] = 1;
    rom[30][6] = 1;
    rom[30][7] = -1;

    // Row 31 S15_real
    rom[31][0] = 1;
    rom[31][1] = 1;
    rom[31][2] = -1;
    rom[31][3] = 1;
    rom[31][4] = 0;
    rom[31][5] = -1;
    rom[31][6] = 1;
    rom[31][7] = 0;

    // Row 32 S15_im
    rom[32][0] = 0;
    rom[32][1] = 0;
    rom[32][2] = 0;
    rom[32][3] = 0;
    rom[32][4] = -1;
    rom[32][5] = 0;
    rom[32][6] = 0;
    rom[32][7] = -1;

    // Row 33 S16_real
    rom[33][0] = 1;
    rom[33][1] = 1;
    rom[33][2] = -1;
    rom[33][3] = 1;
    rom[33][4] = 0;
    rom[33][5] = 0;
    rom[33][6] = 0;
    rom[33][7] = 0;

    // Row 34 S16_im
    rom[34][0] = 0;
    rom[34][1] = 0;
    rom[34][2] = 0;
    rom[34][3] = 0;
    rom[34][4] = -1;
    rom[34][5] = -1;
    rom[34][6] = -1;
    rom[34][7] = -1;

    // Row 35 BS
    rom[35][0] = 0;
    rom[35][1] = 1;
    rom[35][2] = 2;
    rom[35][3] = 3;
    rom[35][4] = 4;
    rom[35][5] = 5;
    rom[35][6] = 6;
    rom[35][7] = 7;
	
	// Row 36 BS
    rom[36][0] = 8;
    rom[36][1] = 9;
    rom[36][2] = 10;
    rom[36][3] = 11;
    rom[36][4] = 12;
    rom[36][5] = 13;
    rom[36][6] = 14;
    rom[36][7] = 15;
	end
	
	always @(posedge clk) begin
		data_out <= rom[row][collum];
	end
endmodule


