`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:37 08/29/2015 
// Design Name: 
// Module Name:    fdtest 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fdtest(clk_out,clk
    );
	 input clk;
	 output clk_out;
	 
freq_div f1(
.clk_out(clk_out), // divided clock output
.clk_ctl(), // divided clock output for scan freq
.clk(clk), // global clock input
.rst_n(1'b1) // active low reset
);

endmodule
