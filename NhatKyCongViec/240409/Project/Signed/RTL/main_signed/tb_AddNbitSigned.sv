module tb_AddNbitSigned;
  localparam DATA_WIDTH = 9;
  
  reg signed [DATA_WIDTH:0] a;
  reg signed [DATA_WIDTH:0] b;
  wire  signed [DATA_WIDTH+1:0] sum;
  
  AddNbitSigned #(.DATA_WIDTH(DATA_WIDTH)) add1(.A(a),.B(b),.sum(sum));
  
  initial begin
  	 a = 0; b = 0;	
    #1 $display("a = %d , b = %d, sum = %d",a,b,sum);
      #5
       a = 1; b = 3;	
      // 1 + 3
    #1 $display("a = %d , b = %d, sum = %d",a,b,sum);	
        #5
       a = -1; b = 3;	
      // -1 + 3
    #1 $display("a = %d , b = %d, sum = %d",a,b,sum);	
        #1
       a = -255; b = -256;	
      // 1 - 3
    #1 $display("a = %d , b = %d, sum = %d",a,b,sum);	
       #5
       a = -9; b = -19;
      // -1 - 2
    #1 $display("a = %d , b = %d, sum = %d",a,b,sum);
  end
  
endmodule
