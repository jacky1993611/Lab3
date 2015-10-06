`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:06:23 08/20/2015 
// Design Name: 
// Module Name:    binary_up_counter 
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
module double_binary_up_counter(display,ftsd_ctl,clk,reset,reset1
    );

output [14:0] display;
output [3:0] ftsd_ctl;
input clk,reset,reset1;

wire clk_d;
wire [3:0]cnt_out;
wire [3:0]cnt_out1;
wire [1:0]ftsd_ctl_en;
wire [3:0]ftsd_in;


freq_div f1(
.clk_out(clk_d), 
.clk_ctl(ftsd_ctl_en), 
.clk(clk), 
.rst_n(reset) 
);





bincnt b1(.out(cnt_out), .clk(clk_d), .rst_n(reset1));

scan_ctl s1(
.ftsd_ctl(ftsd_ctl),
.ftsd_in(ftsd_in),
.in0(4'd0),
.in1(4'd0),
.in2(4'd0),
.in3(cnt_out),
.ftsd_ctl_en(ftsd_ctl_en));

bcd2ftsegdec(
.display(display),
.bcd(ftsd_in) 
);
endmodule
