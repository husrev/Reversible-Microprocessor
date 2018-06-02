`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:49:00 04/17/2016 
// Design Name: 
// Module Name:    encoder 
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
module encoder(
    input [6:0] in,
    output reg [3:0] out
    );

always @*
case(in)
	7'b0000000: out = 4'd0;
	7'b0000111: out = 4'd1;
	7'b0011001: out = 4'd2;
	7'b0011110: out = 4'd3;
	7'b0101010: out = 4'd4;
	7'b0101101: out = 4'd5;
	7'b0110011: out = 4'd6;
	7'b0110100: out = 4'd7;
	7'b1001011: out = 4'd8;
	7'b1001100: out = 4'd9;
	7'b1010010: out = 4'd10;
	7'b1010101: out = 4'd11;
	7'b1100001: out = 4'd12;
	7'b1100110: out = 4'd13;
	7'b1111000: out = 4'd14;
	7'b1111111: out = 4'd15;
endcase

endmodule
