
// Top-Level Module ELEX 7660 Term Project
// Created by Ed.Casas 2017-1-11
// Modified by Navtej Heir and Andrew Ydendberg 2017-03-25

module KeypadTess (
	output logic [3:0] kpc, // column select, active-low
	(* altera_attribute = "-name WEAK_PULL_UP_RESISTOR ON" *)
	input logic [3:0] kpr, // rows, active-low w/ pull-ups
	output logic [3:0] ct, // " digit enables
	output logic TX,
	output logic [9:0] num , // value of pressed key
	input logic reset_n, CLOCK_50 
);
	logic clk ; // 1 MHz clock for keypad scanning
	logic bclk ; // 9600 Hz output clock
	logic kphit ; // a key is pressed
	//logic [9:0] num ; // value of pressed key
	assign ct = { {3{1'b0}}, kphit } ;
	
	pll pll0 ( .inclk0(CLOCK_50), .c0(clk), .c1(bclk) ) ;
	
	// instantiate of scanning algoritthm, decode, and UART module
	
	colseq colseq_0(.kpr, .clk, .reset_n, .kpc);
	
	kpdecode kpdecode_0(.kpc, .kpr, .kphit, .num);
	
	UART UART_0(.DataIn(num), .clk(bclk), .TX(TX));
	
endmodule
