# Báo cáo công việc ngày 2/4/2024
## A. Công việc đã làm
- Xây dựng LUT
- Thực hiện tính hàng nhân cột (hàng có 2 phần tử, cột có 2 phần tử)
- Thực hiện tính hàng nhân cột (hàng có 4 phần tử, cột có 4 phần tử)
- Thực hiện nhân ma trân [4x2] và [2x2]
- Thực hiện nhân ma trận [4x4] và [4x2]
## B. Chi tiết
#### 1. Xây dựng LookUpTable
1. CODE phần design : [Design.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/rom.v)

2. CODE phần testbench : [TB.sv](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/tb_rom.sv) 

3. Mô phỏng trên ModelSim
- Phần transcript : 

![image](https://github.com/LongVu2003/FPGA/assets/128148954/d40d9c0a-ae0b-4b98-bc84-73ebfb3f0f8c)

- Wave : 

![image](https://github.com/LongVu2003/FPGA/assets/128148954/bb9c7c47-9f3e-4d1d-9fa7-8b5f03896e3e)

#### 2. Thực hiện tính hàng nhân cột ( Hàng 2 phần tử, cột 2 phần tử)
1.  CODE Design : [Design.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul2vector.v) 

2. CODE testbench : [Testbench.sv](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/tb_mul2vector.v)

4. Mô phỏng trên ModelSim
- Phần Transcript : 

![image](https://github.com/LongVu2003/FPGA/assets/128148954/173c6ef3-af36-4bd1-9b29-63c21f9faf14)

- Phần Wave : 

![image](https://github.com/LongVu2003/FPGA/assets/128148954/9a9a85fd-1b4c-4a84-bba8-969ea4bdea3e)

#### 3. Thực hiện tính hàng nhân cột (Hàng 4 phần tử, cột 4 phần tử)
1. CODE Design : [Design.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul2vector4x1.v)

#### 4. Thực hiện nhân ma trận [4x2] x [2x2]
1. CODE Design : [Design.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul4x2_2x2Matrix.v)

2. CODE Testbench : [Testbench.sv](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/TB_Mul4x2_2x2Matrix.sv) 

3. Mô phỏng trên ModelSim
- Phần Transcript

![image](https://github.com/LongVu2003/FPGA/assets/128148954/7d2fcdd8-0e3a-4dcd-83ec-f0d7186106ad)

![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/11285b88-2df1-444e-94ad-44e2575435c2)

- Phần Wave : 

![image](https://github.com/LongVu2003/FPGA/assets/128148954/0f9a9abe-087a-4c28-a493-e15ed33b399c)

4. Hierachy (Quartus)

![image](https://github.com/LongVu2003/FPGA/assets/128148954/a3212c0d-5e51-4f99-a7c6-3dda14cb9b95)

![image](https://github.com/LongVu2003/FPGA/assets/128148954/0f1f1195-a4f9-43a9-8ada-8aca7845df2e)

![image](https://github.com/LongVu2003/FPGA/assets/128148954/2bcafd6e-25b8-4a56-bdae-fdbb7c603d4b)

Trong đó : 
- Mul4x2_2x2Matrix : Thực hiện nhân 2 ma trận [4x2] và [2x2]. [CODE](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/TB_Mul4x2_2x2Matrix.sv)
- Mul2vector : Thực hiện nhân hàng 2 phần tử với cột 2 phần tử. [CODE](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul2vector.v)
- adder8bit : Thực hiện cộng 2 số có 8 bit. [CODE](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/adder8bit.v)
- Adder_2bit: Thực hiện cộng 2 số có 2 bit.
- Mul4bit : Thực hiện nhân 2 số có 4 bit. [CODE](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul4bit.v)

#### 5. Thực hiện nhân ma trận [4x4] và [4x2]
1. CODE Design : [Design.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul4x4_4x2matrix.v)

2. CODE Testbench : [Testbench.sv](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/TB_Mul4x4_4x2matrix.sv) 

3. Mô phỏng trên ModelSim

- Phần Transcript

![image](https://github.com/LongVu2003/FPGA/assets/128148954/f6b0f74e-4d76-4298-8709-6abe031c6f0e)


- Phần Wave : 

![image](https://github.com/LongVu2003/FPGA/assets/128148954/879ca971-78a6-4c81-b193-01582b6e97a4)

![image](https://github.com/LongVu2003/FPGA/assets/128148954/61a5983a-029f-40b5-abf1-eb8386cbd9bb)

4. Hierachy (Quartus)

![image](https://github.com/LongVu2003/FPGA/assets/128148954/afb38ad3-2d0e-4d4d-931e-af14fee13376)

![image](https://github.com/LongVu2003/FPGA/assets/128148954/14d7b44c-fe2a-47b4-b2a4-852169b0568a)

![image](https://github.com/LongVu2003/FPGA/assets/128148954/1d621180-113b-4c70-a8bb-e30c2dff9689)

![image](https://github.com/LongVu2003/FPGA/assets/128148954/0c39c260-19de-462e-8ba3-bdc009dc2b1c)

Trong đó : 
- Mul4x4_4x2Matrix : Thực hiện nhân 2 ma trận [4x4] và [4x2]. [CODE](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul4x4_4x2matrix.v)
- Mul2vector : Thực hiện nhân hàng 2 phần tử với cột 2 phần tử. [CODE](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul2vector.v)
- adder8bit : Thực hiện cộng 2 số có 8 bit [CODE](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/adder8bit.v )
- Adder_2bit: Thực hiện cộng 2 số có 2 bit.
- Mul4bit : Thực hiện nhân 2 số có 4 bit. [CODE](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul4bit.v)
### C Công việc tiếp theo.
- Các phép tính nhân ma trận đang thực hiện với các số không dấu. Chuyển sang số có dấu.
- Thực hiện tiếp các phép tính trong file hướng dẫn thuật toán của thầy.

### D Khó khăn đang gặp phải
- Mong thầy cho em thêm hướng dẫn ạ.
