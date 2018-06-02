`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:14:12 04/18/2016
// Design Name:   encoder
// Module Name:   C:/Users/MHC/Dropbox/RFTFA/enc_sim.v
// Project Name:  RFTFA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: encoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module enc_sim;

	// Inputs
	reg [6:0] in;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	encoder uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
      in = 7'b0000111;
		#100;
		in = 7'b0110100;
		#100
		in = 7'b1111000;
		// Add stimulus here

	end
      
endmodule

