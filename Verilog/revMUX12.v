`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:29:07 06/21/2016 
// Design Name: 
// Module Name:    revMUX12 
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
module revMUX12(
	input [11:0] a_in,
	input [11:0] b_in,
	input s_in,
	input [11:0] x_in,
	output [11:0] a_out,
	output [11:0] b_out,
	output s_out,
	output [11:0] x_out
    );
	 
(* KEEP="TRUE" *) wire s_mid;
(* KEEP="TRUE" *) wire s_mid2;  
(* KEEP="TRUE" *) wire [11:0] x_mid;

tof MyTof0({x_in[0],s_in,a_in[0]},{x_mid[0],s_mid,a_out[0]});
tof MyTof1({x_in[1],s_in,a_in[1]},{x_mid[1],s_mid,a_out[1]});
tof MyTof2({x_in[2],s_in,a_in[2]},{x_mid[2],s_mid,a_out[2]});
tof MyTof3({x_in[3],s_in,a_in[3]},{x_mid[3],s_mid,a_out[3]});
tof MyTof4({x_in[4],s_in,a_in[4]},{x_mid[4],s_mid,a_out[4]});
tof MyTof5({x_in[5],s_in,a_in[5]},{x_mid[5],s_mid,a_out[5]});
tof MyTof6({x_in[6],s_in,a_in[6]},{x_mid[6],s_mid,a_out[6]});
tof MyTof7({x_in[7],s_in,a_in[7]},{x_mid[7],s_mid,a_out[7]});
tof MyTof8({x_in[8],s_in,a_in[8]},{x_mid[8],s_mid,a_out[8]});
tof MyTof9({x_in[9],s_in,a_in[9]},{x_mid[9],s_mid,a_out[9]});
tof MyTof10({x_in[10],s_in,a_in[10]},{x_mid[10],s_mid,a_out[10]});
tof MyTof11({x_in[11],s_in,a_in[11]},{x_mid[11],s_mid,a_out[11]});

inv MyInv(s_mid,s_mid2);

tof MyTof12({x_mid[0],s_mid2,b_in[0]},{x_out[0],s_out,b_out[0]});
tof MyTof13({x_mid[1],s_mid2,b_in[1]},{x_out[1],s_out,b_out[1]});
tof MyTof14({x_mid[2],s_mid2,b_in[2]},{x_out[2],s_out,b_out[2]});
tof MyTof15({x_mid[3],s_mid2,b_in[3]},{x_out[3],s_out,b_out[3]});
tof MyTof16({x_mid[4],s_mid2,b_in[4]},{x_out[4],s_out,b_out[4]});
tof MyTof17({x_mid[5],s_mid2,b_in[5]},{x_out[5],s_out,b_out[5]});
tof MyTof18({x_mid[6],s_mid2,b_in[6]},{x_out[6],s_out,b_out[6]});
tof MyTof19({x_mid[7],s_mid2,b_in[7]},{x_out[7],s_out,b_out[7]});
tof MyTof20({x_mid[8],s_mid2,b_in[8]},{x_out[8],s_out,b_out[8]});
tof MyTof21({x_mid[9],s_mid2,b_in[9]},{x_out[9],s_out,b_out[9]});
tof MyTof22({x_mid[10],s_mid2,b_in[10]},{x_out[10],s_out,b_out[10]});
tof MyTof23({x_mid[11],s_mid2,b_in[11]},{x_out[11],s_out,b_out[11]});

endmodule
