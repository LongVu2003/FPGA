module AddNbitSigned
  #(
  parameter DATA_WIDTH = 9
  )
    (input [ DATA_WIDTH:0 ] A, 
  	input [ DATA_WIDTH:0 ] B,
     output [ DATA_WIDTH+1:0 ] sum );
  assign sum = {  A[ DATA_WIDTH ] , A } + { B[ DATA_WIDTH ], B };

endmodule