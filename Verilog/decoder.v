`timescale 1ns / 1ps

module decoder(
    input [3:0] in,
    output reg [6:0] out
    );

always @*
case(in)
	4'd0: out = 7'b0000000;
	4'd1: out = 7'b0000111;
	4'd2: out = 7'b0011001;
	4'd3: out = 7'b0011110;
	4'd4: out = 7'b0101010;
	4'd5: out = 7'b0101101;
	4'd6: out = 7'b0110011;
	4'd7: out = 7'b0110100;
	4'd8: out = 7'b1001011;
	4'd9: out = 7'b1001100;
	4'd10: out = 7'b1010010;
	4'd11: out = 7'b1010101;
	4'd12: out = 7'b1100001;
	4'd13: out = 7'b1100110;
	4'd14: out = 7'b1111000;
	4'd15: out = 7'b1111111;
endcase

endmodule
