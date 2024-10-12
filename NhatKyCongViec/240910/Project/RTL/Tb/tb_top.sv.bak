`timescale 10ns / 1ps  
 module tb_top;  // fpga4student.com FPGA projects, Verilog projects, VHDL projects 
      // Inputs  
      reg clk;  
      reg reset;  
      integer i;  
      wire [15:0] data_out;  
      reg [15:0] matrix_out[15:0];  
      integer fd;   
      parameter INFILE = "result.dat";  
      // Instantiate the Unit Under Test (UUT)  
      matrix_multiplication uut (  
           .clk(clk),   
           .reset(reset),  
           .data_out(data_out)  
      );  
      initial begin  
           // Initialize Inputs  
           reset = 1;  
           clk <= 0;  
           // Wait 100 ns for global reset to finish  
           #100;  
           reset = 0;   
           for(i=0;i<32;i=i+1)  
           begin  
                #100 clk = ~clk;  
           end  
           #10000  
           reset = 1;  
           #1000  
           reset = 0;  
           for(i=0;i<32;i=i+1)  
           begin  
                #100 clk = ~clk;  
           end  
           for(i=0;i<64;i=i+1)  
           begin  
                #100 clk = ~clk;  
           end  
           clk = 0;  
           for(i=0;i<32;i=i+1)  
           begin  
                 #100 clk = ~clk;  
                 matrix_out[i/2] = data_out;  
           end                 
           #100;  
             for(i=0; i<16; i=i+1) begin  
                  $fwrite(fd, "%d", matrix_out[i][15:8]);  
                  $fwrite(fd, "%d", matrix_out[i][7:0]);  
                  #200;  
                end  
           end  
 // fpga4student.com FPGA projects, Verilog projects, VHDL projects
 // Writing the output result to result.dat file
    initial begin  
                fd = $fopen(INFILE, "wb+");  
           end  
 endmodule 