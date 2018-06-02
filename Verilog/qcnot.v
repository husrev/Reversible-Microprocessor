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
module qcnot(
    input [4:0] in,
    output [4:0] out
    );
assign out[0] = in[0];
assign out[1] = in[1] ^ in[0];
assign out[2] = in[2] ^ in[0];
assign out[3] = in[3] ^ in[0];
assign out[4] = in[4] ^ in[0];

endmodule
