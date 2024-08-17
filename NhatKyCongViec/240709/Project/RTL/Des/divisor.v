module divisor(clk_in,rst_n,div,clk_out);
input 	clk_in;
input 	rst_n;
input [15:0] div;
output	clk_out;
reg 		clk_out;
reg [15:0]  counter;
wire equal;

assign equal = (counter[15:0] == div[15:0])?1'b1:1'b0;

// counter
always @(posedge clk_in or negedge rst_n) begin
	if(!rst_n) counter[15:0] <= 16'd0;
	else if(equal) counter[15:0] <= 16'd0;
	else counter[15:0] <= counter[15:0] + 1'b1;
end

//generate clk_out;
always @(posedge clk_in or negedge rst_n) begin
	if(!rst_n ) clk_out <= 1'b0;
	else if(equal) clk_out <= ~clk_out;
end
endmodule
