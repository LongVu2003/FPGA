# Báo cáo công việc ngày 12/3/2024
### A. Công việc đang làm
- Tìm hiểu xây dựng thuật toán "**Bộ giải mã  SO-SD cho hệ thống MIMO SM-OSTBC 4x4 (nT=4,nR=4) sử dụng điều chế 16-QAM**", trên FPGA.
![image](https://github.com/ptitopen-git/D21_NguyenSyToan/assets/128148954/1e311e82-1f1a-4e3f-85d0-975ba0acb94e)

- Tham gia tìm hiểu D21-Nguyễn Sỹ Toản, D21- Đoàn Long Vũ.
- Tài liệu cách xây dựng thuật toán:
https://github.com/ptitopen-git/D21_NguyenSyToan/blob/main/NhatKycongviec/240312/Thuat%20toan%20SO-SD_ver2.pdf
#### Mô tả các bước triển khai trên FPGA :
- Bước 1: Sử dụng lookup table để lưu trữ các ma trận:
![image](https://github.com/ptitopen-git/D21_NguyenSyToan/assets/128148954/7ef22b8e-8f04-40de-b3f4-fc5eb669cf1c)
![image](https://github.com/ptitopen-git/D21_NguyenSyToan/assets/128148954/665753d8-fd44-4b43-81ad-e60f7d9a62c3)
![image](https://github.com/ptitopen-git/D21_NguyenSyToan/assets/128148954/5476749e-d9d6-487e-8e6e-1bdb75640dc2)

- Bước 2: Thực thi thuật toán.
 ### B. Công việc đã làm 
- Xây dựng look up table.
### C. Thực hiện
- **1 link code**
    https://github.com/ptitopen-git/D21_NguyenSyToan/blob/main/NhatKycongviec/240312/Look_up.v
- **Giải thích code** 
      - **input** 
               * clk : xung tín hiệu điều khiển.
               * index :  tín hiệu chọn ma trận.
               * index1 : tín hiệu chọn ma trận ánh xạ tạo mã Alamouti. 
               * index2 : tín hiệu chọn ma trận từ mã SC . 
       - **ouput** look_up với với 64 bit.
  
- Lưu trữ ma trận v={-3 -1 1 3} có 64 bit với 16 bit cuối lưu giá trị.
```verilog
case(index)
      3'b000: look_up <= 64'h31EC;//64'b0011000111101100;
```
 - Lưu trữ ma trận ánh xạ tạo mã Alamouti có 64 bit có 8 bit cuối lưu dữ liệu.
 ``` verilog
3'b001: begin 
                 case(index1)
                       2'b00: look_up <= 64'b01000001;
                       2'b01: look_up <= 64'b00011100;
                       2'b10: look_up <= 64'b01000011;
                       2'b11: look_up <= 64'b00010100;
                       default look_up <= 64'b00010100;
                  endcase
              end
```
- Lưu trữ ma trận từ mã SC 64 bit với 32 bit lưu dữ liệu. Trong 32 bit dữ liệu có 16 bit lưu ma trận thực và 16 bit lưu ma trận ảo
```verilog
3'b010: begin 
                 case(index2)
                     4'b0000: look_up <= 64'b01011101010111010000000000000000;
                     4'b0001: look_up <= 64'b01011101010000010000000000010100;
                     4'b0010: look_up <= 64'b01011101011101010000000000000000;
                     4'b0011: look_up <= 64'b01011101010000010000000000111100;
                     4'b0100: look_up <= 64'b01011101110111110000000000000000;
                     4'b0101: look_up <= 64'b01011101110000110000000000010100;
                     4'b0110: look_up <= 64'b01011101111101110000000000000000;
                     4'b0111: look_up <= 64'b01011101110000110000000000111100;
                     4'b1000: look_up <= 64'b01011101000111000000000001000001;
                     4'b1001: look_up <= 64'b01011101000000000000000011111111;
                     4'b1010: look_up <= 64'b01011101001101000000000001000001;
                     4'b1011: look_up <= 64'b01011101000000000000000001111101;
                     4'b1100: look_up <= 64'b01011101000111000000000011000011;
                     4'b1101: look_up <= 64'b01011101010100000000000011010111;
                     4'b1110: look_up <= 64'b01011101001101000000000011000011;
                     4'b1111: look_up <= 64'b01011101000000000000000011111111;
                     default  look_up <= 64'b00000000000000000000000000000000;
                 endcase
               end
```
- Lưu trữ các chuỗi bít dùng để ánh xạ từ bit sang các ký hiệu 16-QAM Bv,Bs
```verilog
3'b011: look_up <= 64'b00011110; 
3'b100: look_up <= 64'h123456789ABCDEF;
```
### D Khó khăn và phương hướng công việc
- Thầy cho bọn em cách viết lookup table, như phần code trên có đáp ứng đủ yêu cầu không ạ.  Và bọn em thắc mắc bảng lookup table  sẽ lưu tới giá trị cụ thể của từng phần tử trong ma trận, hay chỉ lưu mỗi ma trận là 1 mã hex như cách code ở trên ạ.
- Nên lưu trữ ma trận số phức như nào cho hợp lý ạ . Ví dụ như ma trận dưới đây có cả phần thực, phần ảo và phần hệ số kiểu float
![image](https://github.com/ptitopen-git/D21_NguyenSyToan/assets/125733848/f0749853-2ee2-48be-be66-f940eee340d5)
- Và thầy cho em xin phương hướng sau khi xậy dựng lookup table xong thì nên làm gì tiếp theo ạ.
