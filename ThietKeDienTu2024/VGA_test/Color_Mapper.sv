module  Color_Mapper ( 
   input               is_logo,        // Hiển thị logo
   input      [15:0] logo_address,     // Địa chỉ màu logo
   output logic [3:0] VGA_R, VGA_G, VGA_B // Tín hiệu màu VGA
);

logic [11:0] output_color_logo;
logic [3:0] Red, Green, Blue;

// Gán tín hiệu màu cho VGA
assign VGA_R = Red;
assign VGA_G = Green;
assign VGA_B = Blue;

// Module sprite cho logo
ram_logo logo(.read_address(logo_address), .output_color(output_color_logo));

// Xử lý logic hiển thị màu
always_comb
begin
    if (is_logo) begin
        // Hiển thị logo
        Red = output_color_logo[11:8];
        Green = output_color_logo[7:4];
        Blue = output_color_logo[3:0];
    end else begin
        // Hiển thị màu trắng cho phần còn lại
        Red = 4'h3;
        Green = 4'ha;
        Blue = 4'hd;
    end
end

endmodule
