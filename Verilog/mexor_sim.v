`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:47:00 04/18/2016
// Design Name:   mexor
// Module Name:   C:/Users/MHC/Dropbox/RFTFA/mexor_sim.v
// Project Name:  RFTFA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mexor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mexor_sim;

	// Inputs
	reg [4:0] in;
	integer i;
	// Outputs
	wire [4:0] out;

	// Instantiate the Unit Under Test (UUT)
	mexor uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		for (i = 0; i < 32; i = i+1)
			#10 in = i;
        
		// Add stimulus here

	end
      
endmodule

