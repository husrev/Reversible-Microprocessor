// Verilog test fixture created from schematic C:\Users\MHC\Dropbox\RFTFA\microprocessor.sch - Sat May 14 19:03:42 2016

`timescale 1ns / 1ps

module microprocessor_microprocessor_sch_tb();

// Inputs
   reg CTRL_A;
   reg RESET;
   reg CLK;
   reg WE_A;
   reg [11:0] DATA_IN;
   reg WE_B;
   reg CIN;
   reg WE_PC;
   reg CTRL_PC;
   reg CTRL_ADDR;

// Output
   wire [11:0] ADDR_OUT;
   wire [11:0] DATA_OUT;
   wire OVF;

// Bidirs

// Instantiate the UUT
   microprocessor UUT (
		.ADDR_OUT(ADDR_OUT), 
		.DATA_OUT(DATA_OUT), 
		.CTRL_A(CTRL_A), 
		.RESET(RESET), 
		.CLK(CLK), 
		.WE_A(WE_A), 
		.DATA_IN(DATA_IN), 
		.WE_B(WE_B), 
		.CIN(CIN), 
		.OVF(OVF), 
		.WE_PC(WE_PC), 
		.CTRL_PC(CTRL_PC), 
		.CTRL_ADDR(CTRL_ADDR)
   );
// Initialize Inputs
   `ifdef auto_init
       initial begin
		CTRL_A = 0;
		RESET = 0;
		CLK = 0;
		WE_A = 0;
		DATA_IN = 0;
		WE_B = 0;
		CIN = 0;
		WE_PC = 0;
		CTRL_PC = 0;
		CTRL_ADDR = 0;
   `endif
endmodule
