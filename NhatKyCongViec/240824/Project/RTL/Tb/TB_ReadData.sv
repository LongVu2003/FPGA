module TB_ReadData();
	reg clk,rst,load_h;
	wire done_h;
	wire add_colS;
	wire [2:0] cnt_8;
	wire [3:0] add_s;
	wire [1:0] add_h;
	wire [1:0] out;
	wire tx_en;
	
	// instance
	Read_data dut(clk,rst,load_h,done_h,add_colS, cnt_8,add_s,add_h,out,tx_en);
	
	//stimulus
	initial begin
	clk = 0;
	forever #5 clk = ~clk;
	end
	
	// rst 
	initial begin
	rst = 0;
	#5;
	rst = 1;
	#10;
	rst = 0;
	end
	
	// load_h
	initial begin
	load_h = 0;
	#15;
	load_h = 1;
	#10;
	load_h = 0;
	end
	// stop
	initial begin
	#1500
	$stop;
	end
	
endmodule 
