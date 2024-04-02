module tb_adder8bit;
	reg[7:0] A;
	reg [7:0] B;
	wire [8:0] sum;
	reg cin;
	
	adder8bit a1(sum,A,B,cin);
	
	initial begin
		A = 0; B = 0; cin = 0;
		#5
		A <= 8'b11111111;
		B <= 8'b11111111;
		cin <= 1'b0;
		$display("A: %b, B:%b , sum : %b",A,B,sum);
		#5
		A <= 8'b01111001;
		B <= 8'b01101001;
		cin <= 1'b0;
		$display("A: %b, B:%b , sum : %b",A,B,sum);
		#5
		A <= 8'b01111001;
		B <= 8'b01101011;
		cin <= 1'b0;
		$display("A: %b, B:%b , sum : %b",A,B,sum);
		#30 $stop;
	end
endmodule
	