`timescale 1us/1ns
module tb_rom();

	localparam WIDTH = 5;
	localparam COLL = 8;
	localparam DEPTH = 37;
	localparam DEPTH_LOG = $clog2(DEPTH);
	localparam WIDTH_LOG = $clog2(WIDTH);
	localparam COLL_LOG = $clog2(COLL);

	
	reg clk = 0;
	reg [DEPTH_LOG-1: 0] row;
	reg [COLL_LOG-1: 0] collum;
	wire signed [WIDTH-1 : 0] data_rd;
	
	integer i;
	integer j;
	
	rom #(.WIDTH(WIDTH),
		.DEPTH(DEPTH)
		) ROM0
		(.clk(clk), .row(row),.collum(collum),
		.data_out(data_rd)
		);
		
	always begin #0.5 clk = ~clk; end

	initial begin#1;
		$display(" ROM content:");
		for(i=0; i<DEPTH; i++) begin
			for(j = 0 ;  j < COLL ; j++) begin
				read_data(i,j);
			end
		end
		#40 $stop;
	end
	
	task read_data(input [DEPTH_LOG-1:-0] ROW,input [COLL_LOG-1 : 0] COL);
		begin	
			@(posedge clk);
			row = ROW;
			collum = COL;
			@(posedge clk);
			#0.1;
			$display(" row = %2d, collum = %2d, data_rd = %4b", row,collum,data_rd);
		end
	endtask
endmodule