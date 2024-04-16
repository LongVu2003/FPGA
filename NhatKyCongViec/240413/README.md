# Báo cáo công việc ngày 13/4/2024
## A. Công việc đã làm
- Tìm hiểu về số phẩy tĩnh
- Viết module nhân 2 số phẩy tĩnh có dấu
- Viết module cộng 2 số phẩy tĩnh có dấu
- Viết module nhân 2 mà trận sử dụng số phẩy tĩnh có dấu ((4x4) x (4x2))
## B. Chi tiết

### 1. Tìm hiểu về số phẩy tĩnh

Số phẩy tĩnh là số có số bit biểu diễn phần nguyên và phần thập phân cố định.
Chúng ta thường sử dụng Q notation để biểu diễn nó.
- UQm.n để biểu diễn số phẩy tĩnh không dấu
- Qm.n để biểu diễn số phẩy tĩnh có dấu
Mỗi dạng có 2 tham số m và n trong đó : m là số bit biểu diễn phần nguyên, n là số bit biểu diễn phần thập phân

![image](https://github.com/LongVu2003/FPGA/assets/128148954/9d3212c2-9116-4a5a-a3e9-119c24613eee)

Ví dụ chuyển số phẩy tĩnh không dấu sang kiểu số float:
![image](https://github.com/LongVu2003/FPGA/assets/128148954/73a28277-0c83-4ec6-aa3a-fccc1c88fd22)

Ví dụ chuyển số phẩy tĩnh có dấu sang kiểu số float:
![image](https://github.com/LongVu2003/FPGA/assets/128148954/35acabe6-776a-4ef1-83eb-bcfd19dc8154)

Ví dụ chuyển số kiểu float sang dạng số phẩy tĩnh không dấu:
![image](https://github.com/LongVu2003/FPGA/assets/128148954/7996b1de-4bbf-45f6-bd2a-fe6848722856)

Ví dụ chuyển số kiểu float sang dạng số phẩy tĩnh có dấu:
![image](https://github.com/LongVu2003/FPGA/assets/128148954/834c49ce-f920-4944-a6a4-caf7e14bfa95)

### 2. Viết module nhân 2 số phẩy tĩnh có dấu

![image](https://github.com/LongVu2003/FPGA/assets/128148954/3d92c9a8-b44d-4e63-a407-191b75bec945)

Em đang thực hiện với số 16 bit (8 bit mô tả phần thập phân 7 bit mô tả phân nguyên và 1 bit dấu)

_Input format:_ 

|1|<- N-Q-1 bits   ->  |<--- Q bits -- >|

|S|I I I I I I I I I I I I l I I I| FFFFFFFFFFFFFFF|

_Inputs:_

     i_multiplicand - multiplicand
	 
	 i_multiplier   - multiplier

_Output format:_

|1|<- N-Q-1 bits   ->  |<--- Q bits -- >|

|S|I I I I I I I I I I I I l I I I| FFFFFFFFFFFFFFF|

_Output:_
     o_result - result
	 ovr      - overflow flag

Code : [qmult.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240413/Project/RTL/qmult.v)

TestBench : [testMult](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240413/Project/RTL/Test_mult.v)

### 3. Viết module cộng 2 số 

![image](https://github.com/LongVu2003/FPGA/assets/128148954/a0c1d7e5-37ca-47db-882c-d926a41c13e1)

Input format: 

|1|<- N-Q-1 bits ->|<--- Q bits -->|

|S|IIIIIIIIIIIIIIII|FFFFFFFFFFFFFFF|

Inputs:

     a 
	 
     b 

Output format:

|1|<- N-Q-1 bits ->|<--- Q bits -->|

|S|IIIIIIIIIIIIIIII|FFFFFFFFFFFFFFF|

Output:

     c - result


CODE : [vadd](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240413/Project/RTL/vadd.v)

Testbench : [Test_add](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240413/Project/RTL/Test_add.v)

### 4. Viết module nhân 2 ma trận sử dụng số phẩy tĩnh có dấu

- Các bước làm
- Bước 1 : Viết module thực hiện nhân  hàng 2 phần tử với cột 2 phần tử

Code : [Mul2vector.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240413/Project/RTL/Mul2vector.v)

Testbench : [TB_mul2vector.sv](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240413/Project/RTL/tb_mul2vector.v)

- Bước 2 : Viết module thực hiện nhân hàng 4 phần tử với cột 4 phần tử (Gọi instance module Mul2vector.v)

 Code : [Mul2vector4x1.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240413/Project/RTL/Mul2vector4x1.v)
 
 Testbench : [TB_Mul2vector4x1.sv](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240413/Project/RTL/TB_Mul2vector4x1.sv)

- Bước 3 : Viết module nhân 2 ma trận 4x4 và 4x2 (Gọi instance module Mul2Vector4x1.v)

Code : [Mul4x4_4x2Matrix.v](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240413/Project/RTL/Mul4x4_4x2matrix.v)

Testbench : [Mul4x4_4x2Matrix.sv](https://github.com/LongVu2003/FPGA/blob/main/NhatKyCongViec/240413/Project/RTL/TB_Mul4x4_4x2matrix.sv)

**Kiểm tra** 

Thực hiện nhân 2 ma trận sau :

![image](https://github.com/LongVu2003/FPGA/assets/128148954/e00afe79-a66a-4c62-9ce9-2ad38cafee20)

 -> Kết quả chạy mô phỏng trên ModelSim:

- Thực hiện chuyển radix sang dạng Fixed point number

<img width="710" alt="image" src="https://github.com/LongVu2003/FPGA/assets/128148954/0f5b1c74-513f-487f-8f7f-583c465880e4">

<img width="660" alt="image" src="https://github.com/LongVu2003/FPGA/assets/128148954/253ecff0-dc38-4f3f-8496-89a24f615597">

- > Kết quả tính toán được : 

![image](https://github.com/LongVu2003/FPGA/assets/128148954/1486230c-495f-4277-84ea-76220308b516)

![image](https://github.com/LongVu2003/FPGA/assets/128148954/b10ee216-4567-4dbb-942e-1ea80c811f45)

![image](https://github.com/LongVu2003/FPGA/assets/128148954/23b76027-a47c-4be8-aee8-c7bbabd0b900)

- 
-> So sánh kết quả thấy chính xác.
![image](https://github.com/LongVu2003/FPGA/assets/128148954/d8f6ed2b-1d33-4155-8eb1-ae4f211bef7d)


### C Công việc tiếp theo.
### D Khó khăn đang gặp phải
- Mong thầy cho em nhận xét và thêm hướng dẫn ạ.
