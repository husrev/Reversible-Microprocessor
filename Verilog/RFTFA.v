`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:56:26 04/17/2016 
// Design Name: 
// Module Name:    RFTFA 
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
module RFTFA(
    input [3:0] in,
    output [3:0] out
    );
wire [6:0] w;
wire [6:0] v;
decoder d1({in[0],in[1],in[2],in[3]},{w[0],w[1],w[2],w[3],w[4],w[5],w[6]});
RFA r1(w,v);
encoder e1({v[0],v[1],v[2],v[3],v[4],v[5],v[6]},{out[0],out[1],out[2],out[3]});
endmodule
