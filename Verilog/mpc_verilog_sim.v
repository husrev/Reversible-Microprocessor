`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:19:24 05/14/2016
// Design Name:   mpc_verilog
// Module Name:   C:/Users/MHC/Dropbox/RFTFA/mpc_verilog_sim.v
// Project Name:  RFTFA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mpc_verilog
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mpc_verilog_sim;

	// Inputs
	reg CIN;
	reg CLK;
	reg CTRL_A;
	reg CTRL_ADDR;
	reg CTRL_PC;
	reg [11:0] DATA_IN;
	reg RESET;
	reg WE_A;
	reg WE_B;
	reg WE_PC;

	// Outputs
	wire [11:0] ADDR_OUT;
	wire [11:0] DATA_OUT;
	wire OVF;

	// Instantiate the Unit Under Test (UUT)
	mpc_verilog uut (
		.CIN(CIN), 
		.CLK(CLK), 
		.CTRL_A(CTRL_A), 
		.CTRL_ADDR(CTRL_ADDR), 
		.CTRL_PC(CTRL_PC), 
		.DATA_IN(DATA_IN), 
		.RESET(RESET), 
		.WE_A(WE_A), 
		.WE_B(WE_B), 
		.WE_PC(WE_PC), 
		.ADDR_OUT(ADDR_OUT), 
		.DATA_OUT(DATA_OUT), 
		.OVF(OVF)
	);
	always #10 CLK = ~CLK;
	initial begin
		// Initialize Inputs
		CIN = 0;
		CLK = 0;
		CTRL_A = 0;
		CTRL_ADDR = 0;
		CTRL_PC = 0;
		DATA_IN = 0;
		RESET = 1;
		WE_A = 0;
		WE_B = 0;
		WE_PC = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
      RESET = 0;
		CTRL_A = 1	;
		WE_A = 1;
		DATA_IN = 12'b000000000111;
		#20;
		CTRL_A = 0;
		WE_A = 0;
		WE_B = 1;
		DATA_IN = 12'b000000011001;
		#20;
		CTRL_A = 0;
		WE_A = 1;
		WE_B = 0;
		DATA_IN = 12'b000000011001;
		
		// Add stimulus here  

	end
      
endmodule

