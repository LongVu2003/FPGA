
module Mul4bit (
  input signed [4:0] A,
  input signed [4:0] B, 
  output signed [9:0]result   
);
	assign result = A*B;
endmodule

