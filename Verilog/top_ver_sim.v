`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:46:19 05/15/2016
// Design Name:   TOP_verilog
// Module Name:   C:/Users/MHC/Dropbox/RFTFA/top_ver_sim.v
// Project Name:  RFTFA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TOP_verilog
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_ver_sim;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire defect_address;
	wire defect_data;

	// Instantiate the Unit Under Test (UUT)
	TOP_verilog uut (
		.clk(clk), 
		.reset(reset), 
		.defect_address(defect_address), 
		.defect_data(defect_data)
	);
	always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		#3
		reset = 1;
		#52;
		reset = 0;    
	end
endmodule

