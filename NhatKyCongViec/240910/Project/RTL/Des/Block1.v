module Block1(
	input clk,rst,
	output  [15:0] data_real,
	output  [15:0] data_im,
	output  [15:0] Dh,
	output        [3:0] addr_out,
	output        [3:0] addr_s_out,
	output        [2:0] address_out,
	output [15:0]       MathReal,
	output [15:0]       MathIm,
	output [15:0]       MatSReal,
	output [15:0]       MatSIm,
	output 					done_data

);
	reg data_done;
	initial data_done = 1'b1;
	wire  [15:0] Mat_H_real,MatS_real;
	wire  [15:0] Mat_H_im,MatS_im;
	
	reg  [15:0] matreal,matim,matsreal,matsim;
	reg [3:0] addr,addr_d,addr_dd,addr_s,addr_sd,addr_sdd;
	reg [2:0] address;
	reg  [15:0] data_real_tmp;
	reg  [15:0] data_im_tmp;
	
	reg  [15:0] matrixH_real[3:0][3:0],matrixH_im[3:0][3:0],matrixS_real[3:0][1:0],matrixS_im[3:0][1:0];
	
	wire  [15:0] tmp1[3:0][1:0],tmp2[3:0][1:0],tmp3[3:0][1:0],tmp4[3:0][1:0],tmp5[3:0][1:0],tmp6[3:0][1:0],tmp7[3:0][1:0]; 
	wire  [15:0] tp1[3:0][1:0],tp2[3:0][1:0],tp3[3:0][1:0],tp4[3:0][1:0],tp5[3:0][1:0],tp6[3:0][1:0],tp7[3:0][1:0];

	
	// Matrix_H
	Matrix_H MatrixH_real(.clk(clk),.row(0),.collum(addr),.data_out(Mat_H_real));
	Matrix_H MatrixH_im(.clk(clk),.row(1),.collum(addr),.data_out(Mat_H_im));
	
	// Matrix_S
	LUT_S LUT_S1(.clk(clk),.row(3),.collum(addr_s),.data_out(MatS_real));
	LUT_S LUT_S2(.clk(clk),.row(4),.collum(addr_s),.data_out(MatS_im));
	
	initial begin
			$monitor("Matrix H_real[%0d][%0d] = %h", addr_dd/4, addr_dd-(addr_dd/4)*4, matreal);
         //$monitor("Matrix H_im[%0d][%0d] = %h", addr/4, addr-(addr/4)*4,  matim);
			$monitor("Matrix S_real[%0d][%0d] = %h", addr_sdd/2, addr_sdd-(addr_sdd/2)*2, MatS_real);
	end
	
	// lay ma tran H dong bo theo clk, moi 1 clk thi lay dc 1 gia tri cua ma tran H
	always @(posedge clk) begin
		if(rst) begin
			addr <= 0;
		end
		else begin
			if(addr < 15) begin
				addr <= addr + 1;
				data_done <= 0;
			end
			else begin
				addr <= addr;
				data_done <= 1;
			end
			matrixH_real[addr_dd/4][addr_dd-(addr_dd/4)*4] <= Mat_H_real ; 
			matreal <= Mat_H_real;
			matim <= Mat_H_im;
         matrixH_im[addr_dd/4][addr_dd-(addr_dd/4)*4] <= Mat_H_im ;
	
		end
	end
	
	always @(posedge clk) begin
		addr_d <= addr;
		addr_dd <= addr_d;
		addr_sd <= addr_s;
		addr_sdd <= addr_sd;
	end
	
	
	// lay ma tran S dong bo theo clk, moi 1 clk thi lay dc 1 gia tri cua ma tran S
	always @(posedge clk) begin
		if(rst) begin
			addr_s <= 0;
		end
		else begin
			if(addr_s < 7) begin
				addr_s <= addr_s + 1;
			end
			else begin
				addr_s <= addr_s;
			end
			
			matrixS_real[addr_sdd/2][addr_sdd-(addr_sdd/2)*2] <= MatS_real ;  
			matsreal <= MatS_real;
			matsim <= MatS_im;
         matrixS_im[addr_sdd/2][addr_sdd-(addr_sdd/2)*2] <= MatS_im;
		end
	end
	
	// nhan 2 ma tran thuc giua H va Sq
	genvar i,j,k;  
   generate  
      for(i=0;i<4;i=i+1) begin:gen1  
			for(j=0;j<2;j=j+1) begin:gen2    
			  // cmult 
			  // fixed point multiplication  
           cmult #(16,16) mult_u1(.clk(clk),.ar(matrixH_real[i][0]),.ai(matrixH_im[i][0]),.br(matrixS_real[0][j]),.bi(matrixS_im[0][j]),.pr(tmp1[i][j]),.pi(tp1[i][j]));  
           cmult #(16,16) mult_u2(.clk(clk),.ar(matrixH_real[i][1]),.ai(matrixH_im[i][1]),.br(matrixS_real[1][j]),.bi(matrixS_im[1][j]),.pr(tmp2[i][j]),.pi(tp2[i][j])); 
           cmult #(16,16) mult_u3(.clk(clk),.ar(matrixH_real[i][2]),.ai(matrixH_im[i][2]),.br(matrixS_real[2][j]),.bi(matrixS_im[2][j]),.pr(tmp3[i][j]),.pi(tp3[i][j]));  
           cmult #(16,16) mult_u4(.clk(clk),.ar(matrixH_real[i][3]),.ai(matrixH_im[i][3]),.br(matrixS_real[3][j]),.bi(matrixS_im[3][j]),.pr(tmp4[i][j]),.pi(tp4[i][j]));  
           // fixed point addition  
           vadd #(8,16) Add_u1(.a(tmp1[i][j]),.b(tmp2[i][j]),.c(tmp5[i][j]));  
           vadd #(8,16) Add_u2(.a(tmp3[i][j]),.b(tmp4[i][j]),.c(tmp6[i][j]));  
           vadd #(8,16) Add_u3(.a(tmp5[i][j]),.b(tmp6[i][j]),.c(tmp7[i][j]));  
           //assign matrix_output[i][j]= tmp7[i][j];  
			  // fixed point addition  
           vadd #(8,16) Add_u4(.a(tp1[i][j]),.b(tp2[i][j]),.c(tp5[i][j]));  
           vadd #(8,16) Add_u5(.a(tp3[i][j]),.b(tp4[i][j]),.c(tp6[i][j]));  
           vadd #(8,16) Add_u6(.a(tp5[i][j]),.b(tp6[i][j]),.c(tp7[i][j])); 
			  
			end  
      end 
    endgenerate 

	 
	 // lay gia tri thuc va ao
	 always @(posedge clk or posedge rst)  
      begin  
           if(rst) begin  
                address <= 0;   
           end  
           else begin  
			       address <= address + 1;  
                if(address<8) begin  
                     data_real_tmp <= tmp7[address/2][address-(address/2)*2];
							data_im_tmp <= tp7[address/2][address-(address/2)*2];	
					 end   
           end  
      end
		
		assign data_real = data_real_tmp;
		assign data_im = data_im_tmp;
		assign addr_out = addr_dd;
		assign addr_s_out = addr_sdd;
		assign address_out = address;
		assign MathReal = matreal;
		assign MathIm = matim;
		assign MatSReal = matsreal;
		assign MatSIm = matsim;
		assign done_data = data_done;

endmodule
