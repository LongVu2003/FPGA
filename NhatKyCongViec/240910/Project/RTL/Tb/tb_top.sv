`timescale 10ns / 1ps  
 module tb_top;  
   reg clk;  
   reg rst;  
   wire [15:0] data_real,data_im; 
	wire Dh; 
	wire  [3:0] out_addr,addr_s_out;
	wire  [2:0] address_out;
	wire [15:0] mathreal,matsreal;
	wire [15:0] mathim,matsim;
	wire data_done;
	
	Block1 uut (  
           .clk(clk),   
           .rst(rst),  
           .data_real(data_real),
			  .data_im(data_im),
			  .Dh(Dh),
			  .addr_out(out_addr),
			  .addr_s_out(addr_s_out),
			  .address_out(address_out),
			  .MathReal(mathreal),
			  .MathIm(mathim),
			  .MatSReal(matsreal),
			  .MatSIm(matsim),
			  .done_data(data_done)
     );  
	always #5 begin
		clk = ~clk;
	end
	
	initial begin
		clk = 0 ;rst = 1;
		#10 rst = 0;
		//#270 $stop;
	end 
 
 endmodule