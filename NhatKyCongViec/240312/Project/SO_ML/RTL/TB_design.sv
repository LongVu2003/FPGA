module TB_design;
reg [15:0] en;
reg index;
reg [2:0] index1;
wire [1:0] OUT;

Design DUT(en,index,index1,OUT);

initial begin
	$display("OUT : %2b",OUT);
	#10 en = 0; index = 1; index1 = 0;
	$display("OUT : %2b",OUT);
	#10 en = 0; index = 1; index1 = 1;
	$display("OUT : %2b",OUT);
	#10 en = 0; index = 1; index1 = 2;
	$display("OUT : %2b",OUT);
	#10 en = 0; index = 1; index1 = 3;
	$display("OUT : %2b",OUT);
	#100 $stop;
end
endmodule