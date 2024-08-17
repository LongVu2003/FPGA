# D21_ĐoànLongVũ
# Báo Cáo Công Việc Ngày 11/08/2024
## A. Công Việc Đã Làm
- Vẽ sơ đồ khối cho Block 1
- Mô tả chi tiết hoạt động, chức năng của từng khối
## B. Chi tiết công việc
### 1. Vẽ sơ đồ khối cho Block 1 
**Sơ đồ tổng quan tín hiệu**
![image](https://github.com/user-attachments/assets/3c4ff4c9-02ca-4191-b9e4-6ac59b3468d0)
->  Block 1 có chức năng nhân ma trận H với ma trận S và tính toán giá trị Dh
- Input : gồm : Tín hiệu clk, tín hiệu load_H, tín hiệu rst, 4 hàng của ma trận H (gồm 4 giá trị thực và 4 giá trị ảo)
- Output : Gồm tín hiệu 
        - done_H : Khi nhân xong 2 ma trận H và Si
        - done_Dh : Khi tính toán xong giá trị Dh
        - out_Hq_r , out_Hq_i : Giá trị thực và ảo của các thành phần trong ma trận kết quả.
- Mô tả chức năng chung
 Chia làm 2 phần : Phần đọc dữ liệu và tính toán.
+ Phần đọc dữ liệu :

![image](https://github.com/user-attachments/assets/f9bb3076-0cbf-4b04-8d1b-dcc7d0aec4c2)


 - Phần đọc dữ liệu lấy ma trận H từ input và mà trận S từ Look-up-table. 
 -  Khi có tín hiệu load_H thì sẽ bắt đầu nạp dữ liệu của ma trận H vào.
 -  Sau khi nạp ma trận H vào thì cứ mỗi clk thì đầu ra sẽ lần lượt như sau : H[0][S0] ; H[0]S[1] ; H[1]S[0] ; H[1]S[1] ; H[2]S[0] ; H[2]S[1] ; H[3]S[0] ; H[3]S[1]. (H[0] - H[3] lần lượt là các hàng của ma trận H, S[0] - S[1] lần lượt là các cột của ma trận S])

- Sơ đồ khối bên trong khối reg_H_r : 
![image](https://github.com/user-attachments/assets/159b7eee-838a-4b65-a60a-f7adcbd458c0)

 - Wave form của phần đọc dữ liệu : 
 
![image](https://github.com/user-attachments/assets/39512030-9396-496f-b23c-74bc79147726)

-> Mô tả tín hiệu
        - load_H : Load dữ liệu của ma trận H vào bộ nhớ mỗi khi tín hiệu lên mức 1.
        - addr_colS : Địa chỉ dùng để truy cập vào LUT S để gọi ra cột của ma trận S
        - addr_ s : Địa chỉ dùng để truy cập vào LUT S để gọi ra ma trân S (S1- S16)
        - addr_h : Địa chỉ dùng để truy cập vào bộ nhớ chứa ma trận H để gọi ra hàng của ma trận H
        



 + Phần tính toán
![image](https://github.com/user-attachments/assets/08755d60-6e50-4edb-9c3e-7a26f3959180)

 - Phần tính toán sẽ chia thành 4 stage : 
     - Stage 1 : Nhân hàng của ma trận H và cột của ma trận S
     - Stage 2 : Bình phương giá trị thực và giá trị ảo sau khi nhân hàng và cột
     - Stage 3 : Cộng 2 giá trị lại sau khi bình phương
     - Stage 4 : Thực hiện cộng tích lũy các kết quả nhận được từ stage 3.
     - Stage 5 : Ghi lại kết quả D_h cuối cùng
  
## B. Khó khăn đang gặp

## C. Công việc tiếp theo.
 + Mô tả Block 2
## D. Linh kiện đang giữ.











