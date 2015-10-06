`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:53:43 08/20/2015 
// Design Name: 
// Module Name:    bincnt 
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
`define CNT_BIT_WIDTH 4
module bincnt(
out, // counter output
clk, // global clock
rst_n // active low reset
);
output [`CNT_BIT_WIDTH-1:0] out; // counter output
input clk; // global clock
input rst_n; // active low reset
reg [`CNT_BIT_WIDTH-1:0] out; // counter output (in always block)
reg [`CNT_BIT_WIDTH-1:0] tmp_cnt; // input to dff (in always block)
// Combinational logics
always @(out)
begin
if(out<4'd9)
tmp_cnt = out + 1'b1;
else
tmp_cnt =0;
end
// Sequential logics: Flip flops
always @(posedge clk or negedge rst_n)
if (~rst_n)
out<=0;
else
out<=tmp_cnt;
endmodule