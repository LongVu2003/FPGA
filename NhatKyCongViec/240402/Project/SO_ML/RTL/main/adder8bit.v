module adder_2bit(Cout,s,A,B,c);
	input [1:0] A,B;
	input c;
	output reg [1:0] s;
	output reg Cout;
	
	always @(*)
		begin
			{Cout,s} = A+B+c;
		end
endmodule

module adder8bit(s,X,Y,Cin);

	input [7:0] X;
	input [7:0] Y;
	input Cin;
	output reg [8:0] s;
	 
	reg cout;
	
	wire c1,c2,c3,cout_tmp;
	wire [7:0] s_temp;
	
	adder_2bit adder1(c1,s_temp[1:0],X[1:0],Y[1:0],Cin);
	adder_2bit adder2(c2,s_temp[3:2],X[3:2],Y[3:2],c1);
	adder_2bit adder3(c3,s_temp[5:4],X[5:4],Y[5:4],c2);
	adder_2bit adder4(cout_tmp,s_temp[7:6],X[7:6],Y[7:6],c3);


	always @(*)
		begin
			cout <= cout_tmp;
			s <= {cout,s_temp};
		end
		
endmodule