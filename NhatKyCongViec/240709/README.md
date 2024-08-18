# D21_ĐoànLongVũ
# Báo Cáo Công Việc Ngày 11/08/2024
## A. Công Việc Đã Làm
- 1. Vẽ sơ đồ khối cho Block 1
- 2. Mô tả chi tiết hoạt động, chức năng của từng khối 
## B. Chi tiết công việc
### 1. Vẽ sơ đồ khối cho Block 1 
**Sơ đồ tổng quan tín hiệu**
![image](https://github.com/user-attachments/assets/e07a5a38-ebb8-4ef1-b6ed-73c8bc741809)

> Block 1 có chức năng nhân ma trận H với ma trận S và tính toán giá trị Dh
> - Input : gồm : Tín hiệu clk, tín hiệu load_H, tín hiệu rst, 4 hàng của ma trận H (gồm 4 giá trị thực và 4 giá trị ảo)
> - Output : Gồm tín hiệu
> 	- done_H : Khi nhân xong 2 ma trận H và Si
> 	- done_Dh : Khi tính toán xong giá trị Dh
> 	- out_Hq_r , out_Hq_i : Giá trị thực và ảo của các thành phần trong ma trận kết quả

.
        
### 2. Mô tả chi tiết hoạt động, chức năng của từng khối 

**2.1 Chia làm 2 phần :** 

> Phần đọc dữ liệu và tính toán.

**+ Phần đọc dữ liệu :**

![image](https://github.com/user-attachments/assets/f9bb3076-0cbf-4b04-8d1b-dcc7d0aec4c2)


>  - Phần đọc dữ liệu lấy ma trận H từ input và mà trận S từ Look-up-table. 
>  -  Khi có tín hiệu load_H thì sẽ bắt đầu nạp dữ liệu của ma trận H vào.
>  -  Sau khi nạp ma trận H vào thì cứ mỗi clk thì đầu ra sẽ lần lượt như sau : H[0][S0] ; H[0]S[1] ; H[1]S[0] ; H[1]S[1] ; H[2]S[0] ; H[2]S[1] ; H[3]S[0] ; H[3]S[1]. (H[0] - H[3] lần lượt là các hàng của ma trận H, S[0] - S[1] lần lượt là các cột của ma trận S])
> 

**- Sơ đồ khối bên trong khối reg_H_r :** 

 ![image](https://github.com/user-attachments/assets/159b7eee-838a-4b65-a60a-f7adcbd458c0)

 - Wave form của phần đọc dữ liệu : 
 
![image](https://github.com/user-attachments/assets/39512030-9396-496f-b23c-74bc79147726)
![image](https://github.com/user-attachments/assets/dc760cc5-2daa-4736-addc-cd7fa2dd3266)
> -> Mô tả tín hiệu
>         - load_H : Load dữ liệu của ma trận H vào bộ nhớ mỗi khi tín hiệu lên mức 1.
>         - addr_colS : Địa chỉ dùng để truy cập vào LUT S để gọi ra cột của ma trận S
>         - addr_ s : Địa chỉ dùng để truy cập vào LUT S để gọi ra ma trân S (S1- S16)
>         - addr_h : Địa chỉ dùng để truy cập vào bộ nhớ chứa ma trận H để gọi ra hàng của ma trận H
>         



 **+ Phần tính toán**
![image](https://github.com/user-attachments/assets/08755d60-6e50-4edb-9c3e-7a26f3959180)

>  - Phần tính toán sẽ chia thành 5 stage : 
>      - Stage 1 : Nhân hàng của ma trận H và cột của ma trận S
>      - Stage 2 : Bình phương giá trị thực và giá trị ảo sau khi nhân hàng và cột
>      - Stage 3 : Cộng 2 giá trị lại sau khi bình phương
>      - Stage 4 : Thực hiện cộng tích lũy các kết quả nhận được từ stage 3.
>      - Stage 5 : Ghi lại kết quả D_h cuối cùng

 ### 2.1 Mô tả sơ đồ khối nhân 2 số phức có dạng số fixed-point (Các khối Mul1 - Mul4)
**1. Background**

> Thực hiện nhân 2 số phức có dạng : (Xr+jXi) và (Yr+jYi) được định nghĩa như sau : 
> - Zr = XrYr - XiYi 
> - Zi = XrYi + YrXi
>Trong đó Zr là phần thực của kết quả và Zi là phần ảo. Nếu thức hiện theo cách tính trực tiếp, ta sẽ cần sử dụng 4 bộ nhân và 2 bộ cộng. Tuy nhiên sẽ biến đổi biểu thức trên để chỉ cần sử dụng 3 bộ nhân như sau : 
> - Zr  =  Xr . ( Yr - Yi )  + Yi . (Xr - Xi),
> - Zi  =   Xi . ( Yr + Yi ) + Yi . (Xr - Xi).
> Ta có thể thấy 2 phép tính trên có cùng 1 biểu thức chung đó là Yi . (Xr - Xi).
> Do đó ta chỉ cần thực hiện tính 1 lần đối với biểu thức này. Như vậy ta sẽ sử dụng 3 bộ nhân và 5 bộ cộng cho nên sẽ giảm được diện tích bởi vì bộ nhân yêu cầu nhiều diện tích hơn bộ cộng

**2. Cách triển khai một bộ nhân số phức sử dụng ba bộ nhân và năm bộ cộng :**

![image](https://github.com/user-attachments/assets/ffac39f3-b57d-4a3e-84f6-09ca5e5899c9)

**- Sơ đồ khối thực hiện:**

![image](https://github.com/user-attachments/assets/2c7fe0cf-2fa2-4d4f-872b-b9d946081ce0)

Hình trên thể hiện sơ đồ của bộ nhân số phức được đề xuất để đạt thông lượng tối đa. 

> - Bộ nhân số phức này cần ba khối DSP và 8 khối bổ sung để cân bằng các đường dẫn pipeline. Mất 5clk để tính toán xong được 1 giá trị đầu tiên sau đó cứ mỗi clk sẽ cho ra 1 giá trị mới. 
> - Khối DSP UPPER tính toán hạng tử  Yi⋅(Xr−Xi) 
> - Vì hạng tử Yi⋅(Xr−Xi) được chia sẻ giữa phần thực và phần ảo, nên kết quả tạm thời này cần được cung cấp cho hai khối DSP khác. 
> - Khối DSP MIDDLE tính toán biểu thức Xr⋅(Yr−Yi) trong bộ cộng đầu tiên kết hợ với bộ nhân. Bộ cộng cuối cùng cộng biểu thức này với kết quả từ khối DSP UPPER, tạo ra phần thực của phép nhân số phức. 
> - Tương tự, trong khối DSP LOWER, hạng tử  Xi⋅(Yr−Yi) được tính toán và sau đó được cộng với kết quả từ khối DSP UPPER, tạo ra phần ảo của phép nhân số phức.
> Để đạt được tần số xung nhịp tối đa, kết quả từ khối DSP UPPER cần được ghi lại, cả ở đầu ra của khối DSP UPPER và ở đầu vào của hai khối DSP khác. Nếu không, tần số xung nhịp tối đa có thể đạt được sẽ bị giảm do độ trễ do sự kết nối giữa các khối DSP gây ra.
> Để tính toán phép nhân số phức chính xác, các khối DSP MIDDLE và LOWER cần kết quả từ khối DSP UPPER sau ba chu kỳ xung nhịp kể từ khi dữ liệu được đưa vào các khối DSP này. Kết quả của khối DSP UPPER được chuyển đến bộ cộng thứ hai trong các khối DSP MIDDLE và LOWER sau năm chu kỳ xung nhịp kể từ khi dữ liệu đầu vào được chuyển đến khối DSP UPPER, tức là bốn chu kỳ xung nhịp từ độ trễ của khối DSP UPPER cộng thêm một chu kỳ từ thanh ghi đầu vào trong đường dẫn C đến P của các khối DSP MIDDLE và LOWER."

 ### 2. Mô tả sơ đồ khối nhân 2 số phức có dạng số fixed-point (Các khối Mul1 - Mul4)
**- 1.  Khối ADD.**
![image](https://github.com/user-attachments/assets/74559dc4-20ad-47e7-82a4-81a992465af1)

>      -  Khối ADD là một mạch tổ hợp có 4 input và 1 output.
>      - 4 input là : 4 số thực biểu diễn theo dấu phẩy tĩnh.
>      - output là : số thực biểu diễn theo dấu phẩy tĩnh.
>      - Trong khối ADD gồm 3 bộ cộng half adder để thực hiện 3 phép cộng cho 4 số.

**- 2. Khối bình phương.**
![image](https://github.com/user-attachments/assets/4f018745-40ce-4811-acd7-df59602dca53)

>      - nguồn link tham khảo: [https://www.edaboard.com/threads/verilog-code-for-square-of-a-number-without-using-operator.173075/](url)
>      -  Bộ bình phương có 2 input là A(giá trị cần bình phương) và clock, output là giá trị bình phương.
>      -  Nguyên lý : dựa trên thuật toán đơn giản của phép bình phương.

   
      | Header | Header |
      |--------|--------|
      | 2^2 | 2+2 |
      | 3^2 | 3+3+3 |
      | 4^2 | 4+4+4+4 |
      | 5^2 | 5+5+5+5+5 | 

>      - Trong khối bình phương có sử dụng 1 bộ cộng adder và các thanh ghi điều khiển
.
- 3. Khối cộng tích lũy.
![image](https://github.com/user-attachments/assets/262e2f87-9480-43bf-821d-4209c7887629)
     - Khối  cộng tích lũy có 3 input A, rst, Clk và 1 output kết quả.
     - A : data dữ liệu.
     - rst có chức năng làm mới thanh ghi và đưa giá trị B về giá trị 0.
     - Clk là clock tín hiệu.
- 4. Khối qmul.
![image](https://github.com/user-attachments/assets/5d360bc2-c847-4bb1-8584-7ff06ad0847e)
## B. Khó khăn đang gặp

## C. Công việc tiếp theo.
 + Mô tả Block 2
## D. Tài liệu tham khảo : 
1. [Thuat toan SO-ML_ver3.docx](https://github.com/user-attachments/files/16647141/Thuat.toan.SO-ML_ver3.docx)
2. [Efficient_Implementation_of_Complex_Multipliers_on_FPGAs_Using_DSP_Slices.pdf](https://github.com/user-attachments/files/16647143/Efficient_Implementation_of_Complex_Multipliers_on_FPGAs_Using_DSP_Slices.pdf)












