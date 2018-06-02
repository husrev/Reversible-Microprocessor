`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:59 05/04/2016 
// Design Name: 
// Module Name:    mux16_8 
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
module mux16_8(
    input [7:0] a,
    input [7:0] b,
    input s,
    output [7:0] out
    );
assign out = ~s & a | s & b;

endmodule
