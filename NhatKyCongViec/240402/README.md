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
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/e3d55c70-595d-4f6e-b7c6-fee6b2f14c46)
- Wave : 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/3385a011-2382-458b-8d80-f7f3e596deb3)

#### 2. Thực hiện tính hàng nhân cột ( Hàng 2 phần tử, cột 2 phần tử)
1.  CODE Design : [Design.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul2vector.v) 

2. CODE testbench : [Testbench.sv](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/tb_mul2vector.v)

4. Mô phỏng trên ModelSim
- Phần Transcript : 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/1148bc0b-93aa-43d7-adc0-dee3558c88bd)
- Phần Wave : 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/1696f791-1843-45b5-8cbd-67c54311647c)

#### 3. Thực hiện tính hàng nhân cột (Hàng 4 phần tử, cột 4 phần tử)
1. CODE Design : [Design.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul2vector4x1.v)

#### 4. Thực hiện nhân ma trận [4x2] x [2x2]
1. CODE Design : [Design.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul4x2_2x2Matrix.v)

2. CODE Testbench : [Testbench.sv](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/TB_Mul4x2_2x2Matrix.sv) 

3. Mô phỏng trên ModelSim
- Phần Transcript
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/78516c2c-d368-4b26-9cf2-0b2bd5eb21e2)
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/11285b88-2df1-444e-94ad-44e2575435c2)

- Phần Wave : 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/f41fbdd1-3834-4bed-b470-b7a7b51eb2ca)

4. Hierachy (Quartus)
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/6b2c4e5a-7a4a-4922-b92f-896e5095bc84)

![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/6e95907c-7dc6-47fa-b47f-efc775ef6851)

![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/dee17576-f21b-4958-a8e9-1fb135c1511e)

Trong đó : 
- Mul4x2_2x2Matrix : Thực hiện nhân 2 ma trận [4x2] và [2x2]. [CODE](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/TB_Mul4x2_2x2Matrix.sv)
- Mul2vector : Thực hiện nhân hàng 2 phần tử với cột 2 phần tử. [CODE](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul2vector.v
- adder8bit : Thực hiện cộng 2 số có 8 bit. [CODE](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/adder8bit.v)
- Adder_2bit: Thực hiện cộng 2 số có 2 bit.
- Mul4bit : Thực hiện nhân 2 số có 4 bit. [CODE](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul4bit.v)

#### 5. Thực hiện nhân ma trận [4x4] và [4x2]
1. CODE Design : [Design.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/Mul4x4_4x2matrix.v)

2. CODE Testbench : [Testbench.sv](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240402/Project/SO_ML/RTL/main/TB_Mul4x4_4x2matrix.sv) 

3. Mô phỏng trên ModelSim
- Phần Transcript
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/fbc7daa7-0b56-4178-882b-72d6fd7fb4c1)
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/be7e7038-af8f-41fa-8b59-5e889e6012ee)

- Phần Wave : 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/a861595a-15bd-4a22-941c-0d9148169ca0)
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/03355669-4195-4800-8946-72ed93eef7c4)

4. Hierachy (Quartus)
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/1802868e-f66e-48f3-a3a2-09006c19e845)
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/d9b466d3-5058-4927-b942-55edd88a7a24)
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/bcde4c61-0391-4c73-8b26-e83b237f8d92)
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/8d21da39-49a7-4c25-ba73-94b8d1669453)

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
