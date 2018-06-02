`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:30:26 05/14/2016
// Design Name:   CU
// Module Name:   C:/Users/MHC/Dropbox/RFTFA/CUsim.v
// Project Name:  RFTFA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CUsim;

	// Inputs
	reg [3:0] INSTR;
	reg OVF;
	reg clk;
	reg reset;
	reg [3:0] i;

	// Outputs
	wire WEa;
	wire WEb;
	wire WEpc;
	wire CTRLa;
	wire CTRLpc;
	wire CTRLaddr;
	wire RW;
	wire CIN;

	// Instantiate the Unit Under Test (UUT)
	CU uut (
		.INSTR(INSTR), 
		.OVF(OVF), 
		.clk(clk), 
		.reset(reset), 
		.WEa(WEa), 
		.WEb(WEb), 
		.WEpc(WEpc), 
		.CTRLa(CTRLa), 
		.CTRLpc(CTRLpc), 
		.CTRLaddr(CTRLaddr), 
		.RW(RW), 
		.CIN(CIN)
	);
	always #10 clk <= ~clk;
	initial begin
		// Initialize Inputs
		INSTR = 0;
		OVF = 0;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		for(i = 4'd0; i < 4'd11; i = i+1)
        #20 INSTR = i;
		// Add stimulus here

	end
      
endmodule

