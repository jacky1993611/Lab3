`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:20:01 08/20/2015 
// Design Name: 
// Module Name:    double_binary_up_counter 
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
reg clk_d1;
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



always @(cnt_out)
begin
if(cnt_out==0)
clk_d1<=1;
else
clk_d1<=0;
end


bincnt b1(.out(cnt_out), .clk(clk_d), .rst_n(reset1));
bincnt b2(.out(cnt_out1), .clk(clk_d1), .rst_n(reset1));

scan_ctl s1(
.ftsd_ctl(ftsd_ctl),
.ftsd_in(ftsd_in),
.in0(4'd0),
.in1(4'd0),
.in2(cnt_out1),
.in3(cnt_out),
.ftsd_ctl_en(ftsd_ctl_en));

bcd2ftsegdec(
.display(display),
.bcd(ftsd_in) 
);
endmodule

