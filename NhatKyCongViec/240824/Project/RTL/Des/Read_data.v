module Read_data(
	input clk,rst,load_h,
	output done_h,
	output  out_addr_colS,
	output  [2:0] out_cnt_8,
	output  [3:0] out_addr_Si,
	output  [1:0] out_addr_rowH,
	output  [1:0] HMatrix,
	output reg tx_en
	
); 
	reg addr_colS;
	reg [2:0] cnt_8;
	reg [3:0] addr_Si;
	reg [1:0] addr_rowH;
	
	wire done_16s;
	wire load_h_ena;
	
	assign load_h_ena = load_h | done_16s;
	
	assign enaRowH=(addr_colS)?1:0;
	assign enaSi=(cnt_8==7)?1:0;
	
	
	assign done_16s = (addr_Si == 15 & enaSi)? 1 :0;
	
	assign done_h = load_h_ena;
	
	assign out_addr_colS = addr_colS;
	assign  out_cnt_8 = cnt_8;
	assign out_addr_Si = addr_Si;
	assign  out_addr_rowH = addr_rowH;
	
	
	reg [1:0] ram [3:0];
	
	always @ (posedge clk) begin
	if(rst) begin
		ram[0] <= 0;
		ram[1] <= 0;
		ram[2] <= 0;
		ram[3] <= 0;
		end
	else if(load_h_ena) begin
		ram[0] <= 3;
		ram[1] <= 1;
		ram[2] <= 2;
		ram[3] <= 0;
		end
	
	end
	
//	//tx_en
	always @(posedge clk) begin
		if(rst) tx_en <= 0;
		else if(load_h) tx_en <= 1;
		else if(done_16s) tx_en <= 0;
	end
	
	always @(posedge clk) begin
		if(rst) addr_colS<=0;
		else if(load_h_ena) addr_colS <= 0;
		else  if(tx_en)addr_colS<=~addr_colS;
	end
	
	always @(posedge clk) begin
		if(rst) cnt_8<=0;
		else if(load_h_ena) cnt_8 <= 0;
		else if(tx_en) cnt_8<=cnt_8+1;
	end
	
	always @(posedge clk) begin
		if(rst) addr_Si<= 0;
		else if(load_h_ena) addr_Si <= 0;
		else if(enaSi & tx_en) addr_Si<=addr_Si+1;
	end
	
	always @(posedge clk) begin
		if(rst) addr_rowH <=0;
		else if(load_h_ena) addr_rowH <= 0;
		else if(enaRowH & tx_en) addr_rowH <= addr_rowH+1;
	end
	// out
	
//	always @(posedge clk) begin
//	if(rst) HMatrix <= 0;
//	else HMatrix<= ram[addr_rowH];
//	end
	assign HMatrix = ram[addr_rowH];
	
endmodule 