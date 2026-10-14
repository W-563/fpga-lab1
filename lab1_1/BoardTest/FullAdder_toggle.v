`timescale 1ns / 1ns
module FullAdder_toggle (
	input wire clk, 
	input wire rst_n, 
	input wire B2, 
	input wire B3, 
	input wire B4, 
	
	output wire led1, 
	output wire led2, 
	output wire led3, 
	output wire led4, 
	output wire led5
);

reg B2d, B3d, B4d;
reg A_on, B_on, Cin_on;

always @(posedge clk or negedge rst_n) begin
if (!rst_n) begin
B2d <= 1'b1;
B3d <= 1'b1;
B4d <= 1'b1;

A_on <= 1'b0;
B_on <= 1'b0;
Cin_on <= 1'b0;
end
else begin
B2d <= B2;
B3d <= B3;
B4d <= B4;

if (B2d && !B2) 
A_on <= ~A_on;

if (B3d && !B3)
B_on <= ~B_on;

 if (B4d && !B4)
 Cin_on <= ~Cin_on;
 end
 end
 
 FullAdder dut (
 	.key_A_n (~A_on), 
 	.key_B_n (~B_on), 
 	.key_Cin_n (~Cin_on), 
 	.led_S_n (led1), 
 	.led_Cout_n (led2)
 );
 
 assign led3 = ~A_on;
 assign led4 = ~B_on;
 assign led5 = ~Cin_on;
 
 endmodule