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
module RFA(
    input [6:0] in,
    output [6:0] out
    );
wire [6:0] w0;
assign {w0[2],w0[3]} = {in[2],in[3]};
mexor g0({in[6],in[5],in[4],in[1],in[0]},{w0[6],w0[5],w0[4],w0[1],w0[0]});
wire [6:0] w1;
assign {w1[2],w1[4],w1[6]} = {w0[2],w0[4],w0[6]};
tcnot g1({w0[5],w0[3],w0[1],w0[0]},{w1[5],w1[3],w1[1],w1[0]});
wire [6:0] w2;
assign {w2[0],w2[3]} = {w1[0],w1[3]};
mexor g2({w1[6],w1[5],w1[4],w1[2],w1[1]},{w2[6],w2[5],w2[4],w2[2],w2[1]});
assign {out[0],out[4],out[5]} = {w2[0],w2[4],w2[5]};
tcnot g3({w2[6],w2[3],w2[2],w2[1]},{out[6],out[3],out[2],out[1]});
endmodule
