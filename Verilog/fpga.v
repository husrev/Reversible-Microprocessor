////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 14.7
//  \   \         Application : sch2hdl
//  /   /         Filename : TOP.vf
// /___/   /\     Timestamp : 05/15/2016 12:45:03
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt64\unwrapped\sch2hdl.exe -intstyle ise -family spartan3e -verilog TOP.vf -w C:/Users/MHC/Dropbox/RFTFA/TOP.sch
//Design Name: TOP
//Device: spartan3e
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module fpga(clk, 
           reset, 
           defect_address, 
           defect_data,
			  clk_proc,
           DATA_IN, 
           INSTR, 
           RESET, 
           ADDR_OUT, 
           DATA_OUT, 
           RW
			  );

    input clk;
    input reset;
   output defect_address;
   output defect_data;
	
	output clk_proc;
	output [11:0] DATA_IN;
   output [2:0] INSTR; 
   output  RESET; 
   input  [11:0] ADDR_OUT; 
   input  [11:0] DATA_OUT; 
   input  RW;
   
   wire [11:0] XLXN_1;
   wire [7:0] XLXN_4;
   wire XLXN_10;
   wire [11:0] XLXN_11;
   wire [11:0] XLXN_12;
   wire [7:0] XLXN_13;
   wire [7:0] XLXN_18;
   
   decoder12_8  XLXI_2 (.data_in(XLXN_12[11:0]), 
                       .data_out(XLXN_18[7:0]), 
                       .defect(defect_address));
   decoder12_8  XLXI_4 (.data_in(XLXN_11[11:0]), 
                       .data_out(XLXN_13[7:0]), 
                       .defect(defect_data));
   encoder8_12  XLXI_5 (.data_in(XLXN_4[7:0]), 
                       .data_out(XLXN_1[11:0]));
   Memory  XLXI_6 (.address(XLXN_18[7:0]), 
                  .clk(clk), 
                  .data_in(XLXN_13[7:0]), 
                  .reset(reset), 
                  .write(XLXN_10), 
                  .data_out(XLXN_4[7:0]));
	assign clk_proc = clk; 
	assign DATA_IN = XLXN_1[11:0];
	assign INSTR = XLXN_4[7:5];
   assign RESET = reset;
   assign XLXN_12[11:0] = ADDR_OUT;
   assign XLXN_11[11:0] = DATA_OUT; 
   assign XLXN_10 = RW;
endmodule
