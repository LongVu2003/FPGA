module Design(
	input [15:0] en,
	input index,
	input [2:0] index1,
	output reg [1:0] OUT
);
reg [7:0] vt;
reg [7:0] A_1t;
reg [7:0] A_2t;
reg [7:0] B_1t;
reg [7:0] B_2t;
reg [7:0] B_vt;
reg [63:0] B_st;
reg [31:0] S_1t;
reg [31:0] S_2t;
reg [31:0] S_3t;
reg [31:0] S_4t;
reg [31:0] S_5t;
reg [31:0] S_6t;
reg [31:0] S_7t;
reg [31:0] S_8t;
reg [31:0] S_9t;
reg [31:0] S_10t;
reg [31:0] S_11t;
reg [31:0] S_12t;
reg [31:0] S_13t;
reg [31:0] S_14t;
reg [31:0] S_15t;
reg [31:0] S_16t;
reg [1:0] S_real[3:0][1:0];
reg [1:0] S_im[3:0][1:0];
initial begin

	vt = 8'h77;
	A_1t = 8'h41;
	A_2t = 8'h1C;
	B_1t = 8'h43;
	B_2t = 8'h14;
	B_vt = 8'h1E;
	B_st = 64'h123456789ABCDEF;
	S_1t = 32'h44C444C4;
	S_2t = 32'h44C44114;
	S_3t = 32'h44C44C44;
	S_4t = 32'h44C44334;
	S_5t = 32'h44C4C4CC;
	S_6t = 32'h44C4C11C;
	S_7t = 32'h44C4CC4C;
	S_8t = 32'h44C4433C;
	S_9t = 32'h44C414C1;
	S_10t= 32'h44C41111;
	S_11t= 32'h44C41C41;
	S_12t= 32'h44C41331;
	S_13t= 32'h44C434C3;
	S_14t= 32'h44C43113;
	S_15t= 32'h44C43C43;
	S_16t= 32'h44C43333;
end
		
function [1:0] out_s;
	input en1;
	input [2:0] en2;
	input [31:0] S;
	begin
	{S_real[0][0],S_im[0][0],S_real[0][1],S_im[0][1],S_real[1][0],S_im[1][0],S_real[1][1],S_im[1][1],S_real[2][0],S_im[2][0],S_real[2][1],S_im[2][1],S_real[3][0],S_im[3][0],S_real[3][1],S_im[3][1]} = S;
	if(en1) begin
		case(en2)
			3'd0 : out_s = S_real[0][0];
			3'd1 : out_s = S_real[0][1];
			3'd2 : out_s = S_real[1][0];
			3'd3 : out_s = S_real[1][1];
			3'd4 : out_s = S_real[2][0];
			3'd5 : out_s = S_real[2][1];
			3'd6 : out_s = S_real[3][0];
			3'd7 : out_s = S_real[3][1];
			default : out_s = 2'bx;
		endcase
	end
	else begin
		case(en2)
			3'd0 : out_s =  S_im[0][0];
			3'd1 : out_s =  S_im[0][1];
			3'd2 : out_s =  S_im[1][0];
			3'd3 : out_s =  S_im[1][1];
			3'd4 : out_s =  S_im[2][0];
			3'd5 : out_s =  S_im[2][1];
			3'd6 : out_s =  S_im[3][0];
			3'd7 : out_s =  S_im[3][1];
			default : out_s = 2'bx;
		endcase
	end
	end
endfunction

always@* begin
	case(en)
		0 : OUT = out_s(index,index1,S_1t);
		1 : OUT = out_s(index,index1,S_2t);
		2 : OUT = out_s(index,index1,S_3t);
		3 : OUT = out_s(index,index1,S_4t);
		4 : OUT = out_s(index,index1,S_5t);
		5 : OUT = out_s(index,index1,S_6t);
		6 : OUT = out_s(index,index1,S_7t);
		7 : OUT = out_s(index,index1,S_8t);
		8 : OUT = out_s(index,index1,S_9t);
		9 : OUT = out_s(index,index1,S_10t);
		10 : OUT = out_s(index,index1,S_11t);
		11: OUT = out_s(index,index1,S_12t);
		12 : OUT = out_s(index,index1,S_13t);
		13 : OUT = out_s(index,index1,S_14t);
		14 : OUT = out_s(index,index1,S_15t);
		15 : OUT = out_s(index,index1,S_16t);
		default : OUT = 2'dx;
		
	endcase
end
endmodule
		