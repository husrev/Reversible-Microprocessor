`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:06 05/14/2016 
// Design Name: 
// Module Name:    CU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CU(
    input [2:0] INSTR,
    input OVF,
	 input clk,
	 input reset,
    output reg WEa,
    output reg WEb,
    output reg WEpc,
    output reg CTRLa,
    output reg CTRLpc,
    output reg CTRLaddr,
    output reg RW,
    output reg CIN
    );
	 // Instructions
	 localparam [2:0] ADD 	=	3'b000, 
							SBTR 	= 	3'b001,
							LDA 	=	3'b010,
							LDB 	=	3'b011,
							STR	=	3'b100, 
							JMP	=	3'b101,
							JMPOVF=	3'b110,
							HALT	=	3'b111;
	 // States
	 localparam [3:0] IDLE 			=	4'b0000, 
							ADDstate		= 	4'b0001,
							SBTRstate	=	4'b0010,
							LDAstate		=	4'b0011,
							LDBstate		=	4'b0100, 
							STR0			=	4'b0101,
							STR1			=	4'b0110,
							JMPstate		=	4'b0111,
							JMPOVFstate	=	4'b1000,	 
							HALTstate	=	4'b1001;
	reg [3:0] state;
	always@(posedge clk, posedge reset)
	if(reset)
		begin 
			RW <= 1'b0;
			state <= 4'b0000;
			WEa <= 0;
			WEb <= 0;
			WEpc <= 1;
			CTRLa <= 1;
			CTRLpc <= 0;
			CTRLaddr <= 0;
		end
	else
		case(state)
			IDLE: 
				begin
				RW <= 0;
				case(INSTR) 
						ADD: 
							begin
							WEa <= 1;
							WEb <= 0;
							WEpc <= 1;
							CTRLa <= 0;
							CTRLpc <= 0;
							CTRLaddr <= 0;
							CIN <= 0;
							//state <= ADDstate;
							state <= IDLE;
							end						
						SBTR:
							begin
							WEa <= 1;
							WEb <= 0;
							WEpc <= 1;
							CTRLa <= 0;
							CTRLpc <= 0;
							CTRLaddr <= 0;
							CIN <= 1;
							//state <= SBTRstate;
							state <= IDLE;
							end		
						LDA:
							begin
							WEa <= 1;
							WEb <= 0;
							WEpc <= 1;
							CTRLpc <= 0;
							CTRLaddr <= 0;
							state <= LDAstate;
							end			
						LDB:
							begin
							WEa <= 0;
							WEb <= 1;
							WEpc <= 1;
							CTRLpc <= 0;
							CTRLaddr <= 0;
							state <= LDBstate;
							end
						STR:
							begin
							WEa <= 0;
							WEb <= 1;
							WEpc <= 1;
							CTRLpc <= 0;
							CTRLaddr <= 0;
							state <= STR0;
							end
						JMP:
							begin
							WEa <= 0;
							WEb <= 0;
							WEpc <= 1;
							CTRLpc <= 0;
							CTRLaddr <= 0;
							state <= JMPstate;
							end
						JMPOVF:
							begin
							WEa <= 0;
							WEb <= 0;
							WEpc <= 1;
							CTRLpc <= 0;
							CTRLaddr <= 0;
							state <= JMPOVFstate;
							end
						HALT: 
							begin
							WEa <= 0;
							WEb <= 0;
							WEpc <= 0;
							CTRLpc <= 0;
							CTRLaddr <= 0;
							state <= HALTstate;
							end
					endcase
				end
			ADDstate:
				begin
				WEa <= 0;
				WEb <= 0;
				WEpc <= 1;
				CTRLpc <= 0;
				CTRLaddr <= 0;
				RW <= 0;
				state <= IDLE;
				end
			SBTRstate:
				begin
				WEa <= 0;
				WEb <= 0;
				WEpc <= 1;
				CTRLpc <= 0;
				CTRLaddr <= 0;
				RW <= 0;
				state <= IDLE;
				end
			LDAstate:
				begin
				WEa <= 0;
				WEb <= 0;
				WEpc <= 1;
				CTRLa <= 1;
				CTRLpc <= 0;
				CTRLaddr <= 0;
				RW <= 0;
				state <= IDLE;
				end
			LDBstate:
				begin
				WEa <= 0;
				WEb <= 0;
				WEpc <= 1;
				CTRLpc <= 0;
				CTRLaddr <= 0;
				RW <= 0;
				state <= IDLE;
				end
			STR0:
				begin
				WEa <= 0;
				WEb <= 0;
				WEpc <= 1;
				CTRLpc <= 0;
				CTRLaddr <= 0;
				RW <= 0;
				state <= STR1;
				end
			STR1:
				begin
				WEa <= 0;
				WEb <= 0;
				WEpc <= 0;
				CTRLpc <= 0;
				CTRLaddr <= 1;
				RW <= 1;
				state <= IDLE;
				end
			JMPstate:
				begin
				WEa <= 0;
				WEb <= 0;
				WEpc <= 1;
				CTRLpc <= 1;
				CTRLaddr <= 0;
				RW <= 0;
				state <= IDLE;
				end
			JMPOVFstate:
				begin
				WEa <= 0;
				WEb <= 1;
				WEpc <= 1;
				CTRLpc <= OVF;
				CTRLaddr <= 0;
				RW <= 0;
				state <= IDLE;
				end
			HALTstate:
				begin
				WEa <= 0;
				WEb <= 0;
				WEpc <= 0;
				CTRLpc <= 0;
				CTRLaddr <= 0;
				RW <= 0;
				state <= HALTstate;
				end
		endcase
endmodule
