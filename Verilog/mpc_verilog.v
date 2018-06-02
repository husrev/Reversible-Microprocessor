////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 14.7
//  \   \         Application : sch2hdl
//  /   /         Filename : microprocessor.vf
// /___/   /\     Timestamp : 06/21/2016 15:58:22
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt\unwrapped\sch2hdl.exe -intstyle ise -family spartan3e -verilog microprocessor.vf -w C:/Users/Husrev.TunayCakar/Dropbox/RFTFA/microprocessor.sch
//Design Name: microprocessor
//Device: spartan3e
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module mpc_verilog   (CLK, 
                      DATA_IN, 
                      INSTR, 
                      RESET, 
                      ADDR_OUT, 
                      DATA_OUT, 
                      RW);

    input CLK;
    input [11:0] DATA_IN;
    input [2:0] INSTR;
    input RESET;
   output [11:0] ADDR_OUT;
   output [11:0] DATA_OUT;
   output RW;
   
   wire CIN;
   wire CTRL_A;
   wire CTRL_ADDR;
   wire CTRL_PC;
   wire OVF;
   wire WE_A;
   wire WE_B;
   wire WE_PC;
   wire XLXN_80;
   wire [11:0] XLXN_298;
   wire [11:0] XLXN_338;
   wire [11:0] XLXN_347;
   wire [11:0] XLXN_371;
   wire [11:0] XLXN_497;
   wire XLXN_498;
   wire [11:0] XLXN_499;
   wire [11:0] XLXN_502;
   wire [11:0] XLXN_503;
   wire [11:0] XLXN_504;
   wire [11:0] XLXN_590;
   wire [11:0] XLXN_616;
   wire [11:0] XLXN_623;
   wire [11:0] DATA_OUT_DUMMY;
   
   assign XLXN_497 = 12'h000;
   assign XLXN_498 = 0;
   assign XLXN_499 = 12'h000;
   assign XLXN_504 = 12'h007;
   assign XLXN_590 = 12'h000;
   assign XLXN_616 = 12'h000;
   assign XLXN_623 = 12'h000;
   assign DATA_OUT[11:0] = DATA_OUT_DUMMY[11:0];
   register12bit  A (.clk(CLK), 
                    .clr(RESET), 
                    .data_in(XLXN_298[11:0]), 
                    .wr_e(WE_A), 
                    .data_out(DATA_OUT_DUMMY[11:0]));
   register12bit  B (.clk(CLK), 
                    .clr(RESET), 
                    .data_in(DATA_IN[11:0]), 
                    .wr_e(WE_B), 
                    .data_out(XLXN_502[11:0]));
   register12bit  PC (.clk(CLK), 
                     .clr(RESET), 
                     .data_in(XLXN_338[11:0]), 
                     .wr_e(WE_PC), 
                     .data_out(XLXN_503[11:0]));
   FD #( .INIT(1'b0) ) XLXI_49 (.C(CLK), 
               .D(XLXN_80), 
               .Q(OVF));
   DAFA  XLXI_55 (.ovf_in(CIN), 
                 .s_in(XLXN_497[11:0]), 
                 .x_in(XLXN_502[11:0]), 
                 .y_in(DATA_OUT_DUMMY[11:0]), 
                 .ovf_out(XLXN_80), 
                 .s_out(XLXN_347[11:0]), 
                 .x_out(), 
                 .y_out());
   DAFA  XLXI_56 (.ovf_in(XLXN_498), 
                 .s_in(XLXN_499[11:0]), 
                 .x_in(XLXN_504[11:0]), 
                 .y_in(XLXN_503[11:0]), 
                 .ovf_out(), 
                 .s_out(XLXN_371[11:0]), 
                 .x_out(), 
                 .y_out());
   CU  XLXI_105 (.clk(CLK), 
                .INSTR(INSTR[2:0]), 
                .OVF(OVF), 
                .reset(RESET), 
                .CIN(CIN), 
                .CTRLa(CTRL_A), 
                .CTRLaddr(CTRL_ADDR), 
                .CTRLpc(CTRL_PC), 
                .RW(RW), 
                .WEa(WE_A), 
                .WEb(WE_B), 
                .WEpc(WE_PC));
   revMUX12  XLXI_106 (.a_in(DATA_IN[11:0]), 
                      .b_in(XLXN_371[11:0]), 
                      .s_in(CTRL_PC), 
                      .x_in(XLXN_590[11:0]), 
                      .a_out(), 
                      .b_out(), 
                      .s_out(), 
                      .x_out(XLXN_338[11:0]));
   revMUX12  XLXI_110 (.a_in(DATA_IN[11:0]), 
                      .b_in(XLXN_347[11:0]), 
                      .s_in(CTRL_A), 
                      .x_in(XLXN_616[11:0]), 
                      .a_out(), 
                      .b_out(), 
                      .s_out(), 
                      .x_out(XLXN_298[11:0]));
   revMUX12  XLXI_112 (.a_in(XLXN_502[11:0]), 
                      .b_in(XLXN_503[11:0]), 
                      .s_in(CTRL_ADDR), 
                      .x_in(XLXN_623[11:0]), 
                      .a_out(), 
                      .b_out(), 
                      .s_out(), 
                      .x_out(ADDR_OUT[11:0]));
endmodule
