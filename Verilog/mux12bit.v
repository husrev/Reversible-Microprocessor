`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:39 05/14/2016 
// Design Name: 
// Module Name:    mux12bit 
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
module mux12bit(
    input [11:0] a,
    input [11:0] b,
    input sel,
    output reg [11:0] x
    );

always @*
if (~sel)
	x <= a;
else
	x <= b;
endmodule
