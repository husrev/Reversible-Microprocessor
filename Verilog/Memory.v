`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:50:59 05/15/2016 
// Design Name: 
// Module Name:    Memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//`timescale 1ns / 1ps
module Memory(
    input clk,
	 input reset,
    input write,
    input [7:0] address,
    input [7:0] data_in,
    output reg [7:0] data_out 
    );
	reg [7:0] r[0:255];
	always @(posedge clk, posedge reset)
	if(reset)
	begin
			r[0] <= 8'b01000000; // LDA
			r[1] <= 8'b00001010; // #10
			r[2] <= 8'b01100000; // LDB
			r[3] <= 8'b00000101; // #5
			r[4] <= 8'b00000000; // ADD
			r[5] <= 8'b10000000; // STR
			r[6] <= 8'b00001000; // @R[8]
			r[7] <= 8'b11100000; // HALT
			r[8] <= 8'b00000000; // 
	end
	
	always @*
		if(~write)
			data_out <= r[address];
		else
			r[address] <= data_in;
		

endmodule
