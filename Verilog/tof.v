`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:53:40 04/17/2016 
// Design Name: 
// Module Name:    mexor 
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
module tof(
    input [2:0] in,
    output [2:0] out
    );
wire w;
assign w = in[0] & in[1];
assign out[0] = in[0];
assign out[1] = in[1];
assign out[2] = in[2] ^ w;


endmodule
