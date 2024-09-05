# D21_ĐoànLongVũ
# Hướng dẫn cài đặt và thiết kế chương trình trên phần mềm Quartus. 
## A. Thực hiện cài  đặt Quartus và các file devices

**Bước 1** : Truy cập vào link : 

[Link download](https://www.intel.com/content/www/us/en/software-kit/669444/intel-quartus-prime-lite-edition-design-software-version-17-1-for-windows.html)

**Bước 2 : Chọn phiên bản theo hình dưới :**
 
![image](https://github.com/user-attachments/assets/9f40d2a6-496b-4d5d-86c4-bfb8e59ba7d8)

**Bước 3 : Chọn vào phần Individuals Files và cài những file sau :** 

![image](https://github.com/user-attachments/assets/e7cc63c8-1732-4c39-b5f1-55ef69211512)

![image](https://github.com/user-attachments/assets/b6c4a4ee-acc5-47dd-a062-4c26280a05f3)

![image](https://github.com/user-attachments/assets/46a45205-fc4c-421e-8d25-dfb1a2a37579)

**Bước 4 : Cài đặt**  

> Di chuyển tất cả các file vừa tải vào cùng 1 thự mục sau đó tiến hành cài đặt 2 file :

> - ModelSim-Intel® FPGA Edition (includes Starter Edition)
> - Intel® Quartus® Prime (includes Nios® II EDS)

## B. Viết chương trình thiết kế và mô phỏng.

**Bước 1 :  Mở Quartus và  tạo project mới**

> Chọn vào new project wizard :

![image](https://github.com/user-attachments/assets/6de605b8-5a20-49cf-a774-1ffbeea6a1be)

> Chọn next :

![image](https://github.com/user-attachments/assets/d8bfd746-9bd5-4151-b74a-3f43518959cd)


>  Chọn nơi lưu project , đặt tên cho project rồi bấm next:

![image](https://github.com/user-attachments/assets/8b0551b2-1c9e-49d9-ab31-b786acdf17bc)

 > Chọn Empty project -> Chọn Next

![image](https://github.com/user-attachments/assets/71f5c6e0-9e34-4d66-bcfe-cd4e5e86ee60)

> Chọn Next

![image](https://github.com/user-attachments/assets/c61b8e43-ad7a-4e5d-bcd1-3a47986865c9)

> Chọn Board và Divice tương ứng 
> Tùy theo từng Board ta sẽ chọn Family và Board khác nhau. Ở đây lấy ví dụ cho Board DE10-Lite
> Nếu chưa nạp vào Board mà chỉ dùng để mô phỏng thì ta có thể chọn bất kỳ.

![image](https://github.com/user-attachments/assets/1990ee81-1cca-4939-b8f5-5bb3a1ebc586)

> Chọn EDA Tool
> Ở mục Simulation chọn ModelSim-Altera

![image](https://github.com/user-attachments/assets/b8c8276a-c816-4e81-907e-609332a87e3e)

> Chọn Finish

![image](https://github.com/user-attachments/assets/d5418fd6-96f4-4b4b-9077-87e9ee6d88ae)

> Giao diện sau khi hoàn thành : 

![image](https://github.com/user-attachments/assets/0f13581a-a03e-4820-9023-8d359b16486f)

**Bước 2 : Tạo file RTL** 

- Cách 1 : Tạo file mới : 

> Tổ hợp phím Ctrl + N  -> Sau đó chọn định dạng file là Verilog rồi code.

![image](https://github.com/user-attachments/assets/02fc0be7-33db-401b-a5db-1d196d0667d6)

> Từ đây chúng ta thực hiện quá trình viết code cho project.
> Ví dụ Code phần design cho Mạch AND 2 lối vào : 
```Verilog
module and2gate(
input a,
input b,
output c
);

assign c = a & b;

endmodule
```

> Lưu file -> Chọn vào Hierarchy -> Chọn file -> Chuột phải vào file -> Set as top-level entity.
> Lưu ý đặt tên file trùng với tên của module.

![image](https://github.com/user-attachments/assets/a30443fa-a95f-4aea-9ab7-f99cc41d9ab7)
![image](https://github.com/user-attachments/assets/6ffce318-1fef-44f7-9163-8ee8207fccb8)

- Cách 2 : Add file có sẵn : 

> Chuột phải vào file : 

![image](https://github.com/user-attachments/assets/e919a1c5-8c26-4cc0-b739-f5c6a9f63146)

> Chọn Add/Remove file 

![image](https://github.com/user-attachments/assets/0d212aef-1748-4456-9972-81d1a5a02e5f)

> Add

![image](https://github.com/user-attachments/assets/11fbbd16-457c-4ed2-8114-758047859f19)

> Sau đó chọn file có sẵn rồi bấm OK.

> Sau khi có file design  thì : 

> Click đúp vào Complie design :

![image](https://github.com/user-attachments/assets/ad90fd81-e355-43f7-9a22-9005b1263713)

> Sau khi Comply thành công, Code không có lỗi thì giao hiện sẽ như sau : 

![image](https://github.com/user-attachments/assets/5f7e9310-b67d-4b54-acf8-684214ff4ad1)

> Xem nestlist : Chọn tool -> Nestlist viewer -> RTL viewer

![image](https://github.com/user-attachments/assets/d61726de-ab1d-4efa-a5ed-cc1ad5b08618)

> Sau đó sẽ hiện ra cửa sổ nestlist : 

![image](https://github.com/user-attachments/assets/ecc19a8f-e229-40c5-b267-bded7e7d954f)

**Bước 3 : Tạo file Testbench và mô phỏng.**

- Liên kết ModelSim vào Quartus : 

> Chọn tools -> Chọn Options

![image](https://github.com/user-attachments/assets/d7cd4c9c-b97c-4a35-966f-8a461457fc74)

> Cửa sổ hiện ra như sau : 

![image](https://github.com/user-attachments/assets/4899a6dd-7e16-43e8-9657-84fd4253726f)

> Chọn EDA Tool options -> Ở phần ModelSim-Alterta : Copy đường dẫn sau vào : `C:\intelFPGA\17.1\modelsim_ase\win32aloem`
> Chọn OK

> Lưu ý, đường dẫn trên là mặc định, nếu bạn lưu ModelSim ở nơi khác thì chỉ cần tìm đường dẫn dẫn tới win32aloem là được.

![image](https://github.com/user-attachments/assets/3a219835-be43-425e-beb4-3872e5a2a7af)

- Tạo file Testbench và mô phỏng

> Tạo file Testbench : Tạo bình thường như tạo file design.
> Code Testbench cho mạch And 2 đầu vào : 
```Verilog
module tb;
reg a;
reg b;
wire c;

//instance 
and2gate dut(
	.a(a),
	.b(b),
	.c(c)
);

initial begin
	a = 0;
	b = 0;
	#10
	a = 0;
	b = 1;
	#10
	a = 1;
	b = 0;
	#10
	a = 1;
	b = 1;
        #10;
end 

endmodule 
```
> Sau khi tạo xong thì ADD file Testbench như sau : 
> Chọn Assignments -> Settings

![image](https://github.com/user-attachments/assets/12da19ab-ced5-4db3-859e-5fde16c37767)

> Chọn Simulation -> Tích vào Complie test bench -> Test Benches 

![image](https://github.com/user-attachments/assets/586bdb00-4ac2-4045-ba96-f75b787292ba)

> Chọn theo thứ tự 1 -> 2 -> 3
![image](https://github.com/user-attachments/assets/699b3ba4-bbf6-4c76-a6eb-03654dbf9ec7)

> Chọn file tb -> bấm OK

![image](https://github.com/user-attachments/assets/c9055478-f7ba-451f-8279-a95264be027d)

> ADD -> OK

![image](https://github.com/user-attachments/assets/10250dc7-4811-43b0-95cb-992aa9ea4f43)

> OK

![image](https://github.com/user-attachments/assets/8c85b2bf-27f0-4c33-8e73-2f92597582d2)

> Complie project

> Mở trình mô phỏng xem waveform : Chọn Tools -> Run Simulation tool -> RTL Simulation : 

![image](https://github.com/user-attachments/assets/792eb078-4676-4c67-98e2-9f470e068a9b)

> Kết quả : 

![image](https://github.com/user-attachments/assets/6e8dfffd-dd55-470c-8207-772e9bc22d7e)

> Điều chỉnh Zoom để phóng to hoặc thu nhỏ Waveform










