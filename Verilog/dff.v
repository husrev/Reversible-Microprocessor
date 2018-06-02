`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:51:34 05/20/2016 
// Design Name: 
// Module Name:    dff 
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
module dff(
    input data_in,
    output reg data_out,
    input wr_e,
    input clr,
    input clk
    );

always @(posedge clk, posedge clr)
begin
	if(clr)
		data_out <= 1'b0;
	else if(wr_e)
		data_out <= data_in;
end

endmodule

