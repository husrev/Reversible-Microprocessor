`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:32:32 06/21/2016
// Design Name:   revMUX12
// Module Name:   C:/Users/Husrev.TunayCakar/Dropbox/RFTFA/revmuxsim.v
// Project Name:  RFTFA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: revMUX12
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module revmuxsim;

	// Inputs
	reg [11:0] a_in;
	reg [11:0] b_in;
	reg s_in;
	reg [11:0] x_in;

	// Outputs
	wire [11:0] a_out;
	wire [11:0] b_out;
	wire s_out;
	wire [11:0] x_out;

	// Instantiate the Unit Under Test (UUT)
	revMUX12 uut (
		.a_in(a_in), 
		.b_in(b_in), 
		.s_in(s_in), 
		.x_in(x_in), 
		.a_out(a_out), 
		.b_out(b_out), 
		.s_out(s_out), 
		.x_out(x_out)
	);

	initial begin
		// Initialize Inputs
		a_in = 0;
		b_in = 0;
		s_in = 0;
		x_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		a_in = 15;
		b_in = 255;
		#100
		s_in = 1;
        
		// Add stimulus here

	end
      
endmodule

