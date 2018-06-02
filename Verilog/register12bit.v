`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:43 05/14/2016 
// Design Name: 
// Module Name:    register12bit 
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
module register12bit(
    input [11:0] data_in,
    output reg[11:0] data_out,
    input wr_e,
    input clr,
    input clk
    );

always @(posedge clk, posedge clr)
begin
	if(clr)
		data_out <= 12'b000000000000;
	else if(wr_e)
		data_out <= data_in;
end

endmodule
