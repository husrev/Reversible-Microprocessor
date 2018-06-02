`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:20:25 04/18/2016
// Design Name:   RFA
// Module Name:   C:/Users/MHC/Dropbox/RFTFA/rfa_sim.v
// Project Name:  RFTFA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RFA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rfa_sim;

	// Inputs
	reg [6:0] in;

	// Outputs
	wire [6:0] out;

	// Instantiate the Unit Under Test (UUT)
	RFA uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		in = 7'b1110000;
		#100;
		in = 7'b1001100;
		#100;
		in = 7'b0111100;
		#100;
		in = 7'b0101010;
		
	end
      
endmodule

