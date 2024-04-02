# D21_ĐoànLongVũ

# Báo Cáo Công Việc Ngày 05/03/2024

## A. Công Việc Đã Làm
- Thực hiện cài  đặt Quartus và các file devices
- Nạp chương trình vào KIT FPGA DE10 - Standard
## B. Chi tiết công việc
### 1. Thực hiện cài đặt Quartus và file devices
Phiên bản : Quartus prime lite Edition
Các bước cài đặt : 
**Bước 1** : Truy cập vào link : https://www.intel.com/content/www/us/en/software-kit/795188/intel-quartus-prime-lite-edition-design-software-version-23-1-for-windows.html

**Bước 2 : Chọn theo hình dưới :** 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/5a4a3bba-9635-4eea-81b1-ac812536bccc)

**Bước 3 : Chọn vào phần Individuals Files và cài những file sau :** 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/7418fa7f-c62e-4157-a65c-4101729cec10)
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/c0c972f9-5b9b-4e16-b949-ad7ea4c96016)

**Bước 4 : Chuyển các file Devices và file cài đặt vào cùng 1 thư mục và thực hiện cài đặt.**

### 2. Thực hiện nạp chương trình vào kit.

**Bước 1 : Tạo 1 folder để chứa project theo cấu trúc sau :** 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/93c3d2e5-45c0-4f89-8d82-831b435cdffb)
**_NOTE : RTL dùng để chứa file design và testbench._**

**Bước 2 :  Tạo project mới : New project wizard**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/92d140d9-752c-4f78-b63f-bcf67df44064)

**Bước 3 : Next**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/2a9be04a-d866-4337-b32d-317f73d0be2a)

**Bước 4 : Chọn nơi lưu project  sau đó chọn thư mục synth**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/ac0aa5f6-5904-41c6-a745-d0a9c2e0b4d7)
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/f2bb6df5-53dd-4d42-b384-815a154ce44a)

**Bước 5 Đặt tên cho project - > Next**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/3f1e7d47-6b36-442b-817c-31213d58376c)
 
**Bước 6 : Next**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/6cc24d65-ff46-4015-bda8-f1c8ab1ae1d5)

**Bước 7 Click chuột và add file Design.v từ thư mục RLT vào -> Next**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/02ce7d6d-954e-4bc9-8b63-daa3ff554dfd)

 **Bước 8 Chọn Board**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/2c5aaf80-1b88-4981-a3e1-ab8ec46f0404)

**Bước 9 : Chọn Kit FPGA đang sử dụng** 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/0d3d43ea-488c-478e-bf51-1eff6165644f)

**Bước 10 : Next** 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/174cd52b-5890-47b5-aef3-e7b96f10298f)

**Bước 11 : Finish**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/8346b265-bc44-4943-ba5f-1a86cc72fd0d)

**Bước 12 : Chọn Hyerarchy và chọn file** 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/1696a4d8-8549-4074-9960-c9c77037777c)

**Bước 13 : Click chuột phải vào file Design.v và chọn set as top-level entiny**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/fe4b19ef-95be-4665-91ca-ae28c38da3e7)

**Bước 14: Click đúp vào Compile**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/b99e627b-e9d1-4b4f-9453-a9c3e185c6a0)

**Bước 15 Complie xong**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/9e8d096e-9164-4612-8833-85581a3ab3fb)

**Bước 16 Click vafo Assignment -> Chọn Pin planner**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/aa7ab4e4-da0a-4867-8967-578fb1dc81c6)

**Bước 17 : Nhập tên chân của kit FPGA vào cột sau**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/e6b067f8-9f7d-40b0-8c48-8ebc19188f53)

**_Chân của kit nằm trong Manual của kit_**[ User_Manual](https://github.com/ptitopen-git/D21_DoanLongVu/blob/main/FPGA/240305/document/DE10_Standard_User_Manual.pdf)
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/6318bb9b-e047-419b-8644-03e38ce7937f)

_**Tiếp theo nhập chân của Led**_
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/a0b4be78-3540-4c1b-a1f7-98ecfe79ca7d)

**Bước 18 Sau khi nhập xong ta có kết quả như sau :** 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/0f1e1eac-1278-431b-bcf5-a5cd33e665a2)

 **Bước 19 : Tắt cửa sổ Pinplaner - > sau đó Complie 1 lần nữa.**

**Bước 20 : Chọn vào RTL viewer** 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/236f7174-849d-484b-9a89-3ac9fbf842dd)

**_Đã được kết nối thành công._**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/ec18b882-aaf4-4649-9122-d5ae3a5e5a4b)

**Bước 21 : Kết nối Kit với máy tính.**

**Bước 22 : Chọn Program Device**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/1b714c78-c554-49d0-b5c3-84732b8e21b9)

**Bước 23 : Chọn Auto Dectect (Nếu nó chưa hiện thì chọn vào Hardware setup, click vào No Hardware và chọn thiết bị)**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/ee21484b-0291-4e5b-90fa-3cdf9670441f)

**Bước 24 : Chọn Kit đúng đang sử dụng -> OK ->** 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/ff9a0c30-41d6-44de-a5b1-a1d67d1deb63)


**Bước 25 : Sau khi chọn xong sẽ xuất hiện như sau :** 
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/a723761b-f51b-4fb7-a2ed-6a235c0f3a42)

**Bước 26 : Click như ở dưới - > chọn vào Changes file**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/2d30f3bb-4972-44b7-b3ca-b78d59baa00c)

**Bước 27 : Chọn vào output_files -> Chọn file Projec.sof**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/b5684880-83d7-4ac4-8689-5a078c7061bc)
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/9ea2aa42-f0b6-4d6f-b3a7-cbc53248866d)

**Bước 28 : Click chọn vào như dưới đây**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/9fbe42ba-4a7e-449d-ac37-24ed78faa65d)

**Bước 29 : Click vào Start và đã nạp thành công.**
![image](https://github.com/ptitopen-git/D21_DoanLongVu/assets/128148954/c42d9d73-b148-489b-b6e1-56d0e1e618ab)

**CODE của Project** 

- DESIGN : https://github.com/ptitopen-git/D21_DoanLongVu/blob/main/FPGA/240305/Project/switches_to_led.v

- TESTBENCH : https://github.com/ptitopen-git/D21_DoanLongVu/blob/main/FPGA/240305/Project/tb_switches_to_led.sv

**KẾT QUẢ**  : https://www.youtube.com/shorts/BQ7hodd1cuc

## B. Khó khăn đang gặp

## C. Công việc tiếp theo.
 + Mong thầy giao việc cho em ạ
## D. Linh kiện đang giữ.
- 3 module mic INMP441










