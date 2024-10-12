

module lab8( 
				input              CLOCK_50,
            input    [1:0]     KEY,    // bit 0 is set up as Reset
				
             ///////// VGA /////////
				output             VGA_HS,
				output             VGA_VS,
				output   [ 3: 0]   VGA_R,
				output   [ 3: 0]   VGA_G,
				output   [ 3: 0]   VGA_B,
				///////// SDRAM /////////
				output             DRAM_CLK,
				output             DRAM_CKE,
				output   [12: 0]   DRAM_ADDR,
				output   [ 1: 0]   DRAM_BA,
				inout    [15: 0]   DRAM_DQ,
				output             DRAM_LDQM,
				output             DRAM_UDQM,
				output             DRAM_CS_N,
				output             DRAM_WE_N,
				output             DRAM_CAS_N,
				output             DRAM_RAS_N
);
						  

//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic isLogo;
	logic [9:0] drawxsig, drawysig;
	logic [7:0] Red, Blue, Green;
	logic VGA_BLANK_N;
	logic VGA_SYNC_N;
	logic [9:0] draw_x, draw_y;
	logic Reset_h;

    //assign Clk = CLOCK_50;
    always_ff @ (posedge CLOCK_50) begin
        Reset_h <= ~(KEY[0]);        // The push buttons are active low
    end

	 
	 logic [1:0] room_num;
	 
	 logic [15:0] logo_address;
	
	 
	 lab62soc u0 (
		.clk_clk                           (CLOCK_50),  //clk.clk
		.reset_reset_n                     (1'b1),           //reset.reset_n
		.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
		.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
		.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
		.key_external_connection_export    (KEY),            //key_external_connection.export

		//SDRAM
		.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
		.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                             //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
		.sdram_wire_cke(DRAM_CKE),                           //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
		.sdram_wire_dq(DRAM_DQ),                             //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
		.sdram_wire_we_n(DRAM_WE_N)                          //.we_n
		
	 );
	 
    
    // TODO: Fill in the connections for the rest of the modules 
    VGA_controller vga_controller_instance(
														.Clk(CLOCK_50),
														.Reset(Reset_h),
														.VGA_HS(VGA_HS),
														.VGA_VS(VGA_VS),
														//.VGA_CLK(VGA_CLK),
														.VGA_BLANK_N(VGA_BLANK_N),
														.VGA_SYNC_N(VGA_SYNC_N),
														.DrawX(draw_x),
														.DrawY(draw_y)
);
	
    Color_Mapper color_instance(
										 .is_logo(isLogo),
										 .logo_address(logo_address),	
										 .DrawX(draw_x),
										 .DrawY(draw_y),
										 .VGA_R(VGA_R),
										 .VGA_G(VGA_G),
										 .VGA_B(VGA_B)
);
	 
	 logo title_logo  (
							.DrawX(draw_x),
							.DrawY(draw_y),
							.RoomNum(room_num),
							.is_logo(isLogo),
							.logo_address(logo_address)
);
	 
endmodule
