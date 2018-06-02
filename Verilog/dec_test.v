`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:44:02 04/17/2016
// Design Name:   decoder
// Module Name:   D:/RFTFA/dec_test.v
// Project Name:  RFTFA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dec_test;

	// Inputs
	reg [3:0] in;

	// Outputs
	wire [6:0] out;
	integer i;
	// Instantiate the Unit Under Test (UUT)
	decoder uut (
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

