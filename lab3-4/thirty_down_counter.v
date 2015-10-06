`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:15:38 08/20/2015 
// Design Name: 
// Module Name:    thirty_down_counter 
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
module down_counter(display,ftsd_ctl,clk,reset
    );

output [14:0] display;
output [3:0] ftsd_ctl;
input clk,reset;

wire clk_d;
reg clk_d1;
reg [3:0]cnt_out;
reg [3:0]cnt_out1;
wire [1:0]ftsd_ctl_en;
wire [3:0]ftsd_in;

reg [3:0] temp_out;
reg [3:0] temp_out1;

freq_div f1(
.clk_out(clk_d), 
.clk_ctl(ftsd_ctl_en), 
.clk(clk), 
.rst_n(reset) 
);


always @(posedge clk_d or negedge reset)
begin 
if  (~reset)
    begin
	  temp_out<=0;
	  temp_out1<=3;
	  end
else
begin
    if(temp_out!=0 &  temp_out1!=0)
	  temp_out<=cnt_out-4'b0001;
    else if(temp_out!=0 &  temp_out1==0)
     temp_out<=cnt_out-4'b0001;
    else if(temp_out==0 &  temp_out1!=0)
	 begin
	 temp_out1<=cnt_out1-4'b0001;
	 temp_out<=4'd9;
    end
    else if(temp_out==0 &  temp_out1==0)
    begin
	 temp_out<=0;
	 temp_out1<=0;
    end
end
end

always @(*)
  begin
              cnt_out=temp_out;
				  cnt_out1=temp_out1;
				  end


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

