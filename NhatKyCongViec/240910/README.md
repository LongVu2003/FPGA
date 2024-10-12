# D21_ĐoànLongVũ
# Báo Cáo Công Việc Ngày 20/08/2024
## A. Công Việc Đã Làm
- Vẽ sơ đồ khối cho Block 2
- Mô tả chi tiết các khối nằm trong Block 2
## B. Chi tiết công việc
### 1. Vẽ sơ đồ khối cho Block 2
#### a. Sơ đồ tín hiệu vào ra : 

![image](https://github.com/user-attachments/assets/a49f7e1d-858e-47ba-abb2-348f948b1dbe)
**- Mô tả :**
> Block 2 có chức năng nhân ma trận Hq (kết quả từ Block1) với lần lượt các ma trận A1,A2,B1,B2 lấy từ LUT

+ Đầu vào gồm tín hiệu : 

> - clk : Tín hiệu clk.
> - rst : Tín hiệu reset
> - ena_Hq : Tín hiệu cho phép nạp giá trị mới của ma trận Hq vào bộ nhớ
> - row0_Hr - row3_Hr : Lần lượt là các hàng giá trị thực của ma trận Hq.
> - row0_Hi - row3_Hi : Lần lượt là các hàng giá trị ảo của ma trận Hq.

+ Đầu ra gồm tín hiệu : 

> - done_G : tín hiệu thông báo đã tính toán xong 1 phần tử của của các ma trận Ga_1, Ga_2, G_b1, G_b2.
> - out_Ga1_r[15:0] .... out_Gb2_i[15:0] : Lần lượt là các giá trị thực và ảo của ma trận Ga_1, Ga_2, G_b1, G_b2.

#### b. Sơ đồ khối chi tiết cho Block2.

![image](https://github.com/user-attachments/assets/fd11a804-5d1a-45fa-a233-d8c6c7bfb23c)

**-Mô tả :**
**1. Khối Counter :** 

![image](https://github.com/user-attachments/assets/c7f02226-739c-4801-8ad9-abbaf83ce6b8)

> Khối counter có chức năng là tạo ra các tín hiệu địa chỉ giúp truy cập giá trị được lưu trong LUT và thanh ghi lưu trữ ma trận Hq.

 Input :
> - CLK : Tín hiệu clock
> - RST : Tín hiệu reset
> - Load_Hq : Tín hiệu cho phép đếm, khi có tín hiệu load_Hq = 1 tất cả các thanh ghi reset = 0 sau đó bắt đầu đếm.

Output :
> - addr_col : Tín hiệu địa chỉ dùng để truy cập cột của các ma trận A1, A2, B1, B2. Giá trị của addr_col là 0 và 1.
> - addr_rowH : Tín hiệu địa chỉ dùng để truy cập và hàng của ma trận Hq. Giá trị của addr_rowH là 0, 1, 2 và 3.
> - done_Hq : Tín hiệu thông báo đã truyền hết 1 ma trận Hq (gồm 8 giá trị phức) 

**2. Khối H_q_control :** 

![image](https://github.com/user-attachments/assets/dfea95a7-f6fd-42c2-9208-e064cb2a9cf0)

> Khối H_q_control có chức năng là cập nhật giá trị mới của ma trận Hq và cung cấp từng hàng của giá trị Hq vào Khối MUL MATRIX để nhân ma trận

 Input : 
> - Load_Hq : Khi Tín hiệu Load_Hq lên 1 thì các giá trị mới của ma trận Hq sẽ được nạp vào bộ lưu trữ dữ liệu.
> - addr_Hq : Tín hiệu địa chỉ dùng để truy cập vào từng hàng của ma trận Hq.
> - row0_Hr ... row3_Hi : Giá trị các hàng của ma trận Hq, gồm cả giá trị thực và ảo.

 Output : 
> - H_real [31:0] : 1 Hàng giá trị thực của ma trận Hq
> - H_im [31:0] : 1 Hàng giá trị ảo của ma trận Hq.

**3.  Khối LUT :** 

![image](https://github.com/user-attachments/assets/3d9f2993-7fac-46e7-9402-c6abcdeb1666)

> Mô tả : Khối LUT được sử dụng để lưu trữ các ma trận A1, A2, B1, B2.

Input : 
> -  addr_col : Tín hiệu địa chỉ dùng để truy cập vào cột

Output : 
> - A1_real, A2_real, B1_real, B2_real, A1_im, A2_im, B1_im, B2_im : Các cột thực và ảo của các ma trận A1,A2,B1,B2. Mỗi giá trị có 32 bit


**4. Khối MUL MATRIX :** 

![image](https://github.com/user-attachments/assets/36564ee9-9306-4341-9e95-b159b2837441)

>  Mô tả : Khối MUL MATRIX thực hiện nhân các ma trận sau : Hq x A1 ; Hq x A2 ; Hq x B1 ; Hq x B2. 
> Có 4 khối nhỏ, mỗi khối có khả năng nhân 1 hàng và 1 cột.
> - Khối Hq_A1 thực hiện nhân hàng và cột của 2 ma trận Hq và A1. - > Giá trị đầu tiên của ma trận Ga1
> - Khối Hq_A2 thực hiện nhân hàng và cột của 2 ma trận Hq và A2. - > Giá trị đầu tiên của ma trận Ga2
> - Khối Hq_B1 thực hiện nhân hàng và cột của 2 ma trận Hq và B1. - > Giá trị đầu tiên của ma trận Gb1
> - Khối Hq_B2 thực hiện nhân hàng và cột của 2 ma trận Hq và B2. - > Giá trị đầu tiên của ma trận Gb2
> Để có thể tính được giá trị đầu tiên thì có thể sẽ tốn 6 clock và sau đó cứ mỗi clock thì sẽ cho ra được các kết quả mới. 
> Như vậy ước tính khối MUL MATRIX có thể sẽ cần 13 clock.

Input : Các cột của ma trận A1,A2,B1,B2 và các hàng của ma trận Hq

Output : Lần lượt là các giá trị thực và ảo của ma trận Ga_1, Ga_2, G_b1, G_b2.


## B. Khó khăn đang gặp
- Mong thầy cho em nhận xét ạ
## C. Công việc tiếp theo.
 + Mô tả Block 3
## D. Linh kiện đang giữ.