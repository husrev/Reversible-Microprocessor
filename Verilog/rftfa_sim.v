`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:27:20 04/18/2016
// Design Name:   RFTFA
// Module Name:   D:/RFTFA/rftfa_sim.v
// Project Name:  RFTFA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RFTFA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rftfa_sim;

	// Inputs
	reg [3:0] in;
	integer i;
	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	RFTFA uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
      for (i = 0; i < 16; i = i+1)
			#10 in = i;
		// Add stimulus here

	end
      
endmodule

