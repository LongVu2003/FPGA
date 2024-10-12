
module  Color_Mapper ( 
							  input 			 		is_logo,				  // if this is a 0 we're gonna draw the logo, otherwise nah lol
							  input		  [15:0] logo_address,		  // if there is a logo, gotta decide its sprite colors with this address.
							  input        [9:0] DrawX, DrawY,       // Current pixel coordinates
                       output logic [3:0] VGA_R, VGA_G, VGA_B // VGA RGB output
                     );
    
    logic [7:0] Red, Green, Blue;
	 logic [11:0] output_color_logo;
    
    // Output colors to VGA
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
    
	 // sprite modules
		 // logo sprite
		 ram_logo logo(.read_address(logo_address), .output_color(output_color_logo));
	 
    // Assign color based on is_ball signal
    always_comb
    begin
        if (is_logo == 1'b1)
		  begin
				Red = output_color_logo[11:8];
				Green = output_color_logo[7:4];
				Blue = output_color_logo[3:0];
		  end
		  else 
        begin
				Red = 4'h0;
				Green = 4'h0;
				Blue = 4'h0;

        end
    end 
    
endmodule
