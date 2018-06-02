`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:06 05/06/2016 
// Design Name: 
// Module Name:    DAFA 
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
module DAFA(
    input [11:0] s_in,
    input [11:0] x_in,
    input [11:0] y_in,
    output [11:0] s_out,
    output [11:0] x_out,
    output [11:0] y_out,
    input ovf_in,
    output ovf_out
    );

// Block 1
(* KEEP="TRUE" *)  wire [4:0] m1out;
mexor m1({s_in[4],s_in[3],s_in[0],y_in[2],x_in[2]},m1out);
/*
t3 x2 y2 s0
t3 x2 y2 s3
t3 x2 y2 s4*/

(* KEEP="TRUE" *)  wire [3:0] m2out;
tcnot m2({y_in[2],y_in[1],y_in[0],x_in[2]},m2out);
/*
t2 x2 y0
t2 x2 y1
t2 x2 y2*/

(* KEEP="TRUE" *)  wire [4:0] m3out;
mexor m3({m1out[4],m1out[3],m1out[2],s_in[2],m2out[3]},m3out);
/*
t3 y2 s2 s0
t3 y2 s2 s3
t3 y2 s2 s4*/

(* KEEP="TRUE" *)  wire [3:0] m4out;
tcnot m4({s_in[2],s_in[1],m3out[2],m2out[3]},m4out);
/*
t2 y2 s0
t2 y2 s1
t2 y2 s2*/

// Block 2
(* KEEP="TRUE" *)  wire [4:0] m5out;
mexor m5({s_in[5],m3out[3],m4out[2],y_in[4],x_in[4]},m5out);
/*
t3 x4 y4 s1
t3 x4 y4 s3
t3 x4 y4 s5*/

(* KEEP="TRUE" *)  wire [3:0] m6out;
tcnot m6({y_in[4],y_in[3],m2out[1],x_in[4]},m6out);
/*
t2 x4 y0
t2 x4 y3
t2 x4 y4*/

(* KEEP="TRUE" *)  wire[4:0] m7out;
mexor m7({m5out[4],m5out[3],m5out[2],y_in[4],m3out[4]},m7out);
/*
t3 s4 y4 s1
t3 s4 y4 s3
t3 s4 y4 s5*/

(* KEEP="TRUE" *)  wire [3:0] m8out;
tcnot m8({m3out[4],m7out[3],m4out[1],m6out[3]},m8out);
/*
t2 y4 s0
t2 y4 s3
t2 y4 s4*/

// Block 3

(* KEEP="TRUE" *)  wire [5:0] m9out;
mexor4 m9({s_in[6],m8out[2], m7out[2],m8out[1],y_in[5],x_in[5]},m9out);
/*
t3 x5 y5 s0
t3 x5 y5 s1
t3 x5 y5 s3
t3 x5 y5 s6*/

(* KEEP="TRUE" *)  wire [3:0] m10out;
tcnot m10({y_in[5],m6out[2],m2out[2],x_in[5] },m10out);
/*
t2 x5 y1
t2 x5 y3
t2 x5 y5*/

(* KEEP="TRUE" *)  wire [5:0] m11out;
mexor4 m11({m9out[5],m9out[4],m9out[3],m9out[2],m10out[3],m7out[4]},m11out);

/*
t3 s5 y5 s0
t3 s5 y5 s1
t3 s5 y5 s3 
t3 s5 y5 s6*/

(* KEEP="TRUE" *)  wire [3:0] m12out;
tcnot m12({m7out[4],m11out[4],m11out[3],m10out[3]},m12out);

/*
t2 y5 s1
t2 y5 s3
t2 y5 s5*/

// Block 4

(* KEEP="TRUE" *)  wire [4:0] m13out;
mexor m13({s_in[8],s_in[7],m11out[2],y_in[6],x_in[6]},m13out);
/*
t3 x6 y6 s0
t3 x6 y6 s7
t3 x6 y6 s8*/

(* KEEP="TRUE" *)  wire [4:0] m14out;
qcnot m14({y_in[6], m10out[2],m10out[1], m6out[1],x_in[6]},m14out);
/*
t2 x6 y0
t2 x6 y1
t2 x6 y3
t2 x6 y6*/

(* KEEP="TRUE" *)  wire [4:0] m15out;
mexor m15({m13out[4],m13out[3],m13out[2],m14out[4],m11out[5]},m15out);
/*
t3 s6 y6 s0
t3 s6 y6 s7
t3 s6 y6 s8 */

(* KEEP="TRUE" *)  wire [4:0] m16out;
qcnot m16({m11out[5],m12out[2],m12out[1],m15out[2],m14out[4]},m16out);
/*
t2 y6 s0
t2 y6 s1
t2 y6 s3
t2 y6 s6*/

// Block 5

(* KEEP="TRUE" *)  wire [4:0] m17out;
mexor m17({s_in[9],m15out[3],m16out[2],y_in[8],x_in[8]},m17out);
/*
t3 x8 y8 s1
t3 x8 y8 s7
t3 x8 y8 s9*/

(* KEEP="TRUE" *)  wire [3:0] m18out;
tcnot m18({y_in[8],y_in[7],m14out[1],x_in[8]},m18out);
/*
t2 x8 y0
t2 x8 y7
t2 x8 y8*/

(* KEEP="TRUE" *)  wire [4:0] m19out;
mexor m19({m17out[4],m17out[3],m17out[2],m18out[3],m15out[4]},m19out);
/*
t3 s8 y8 s1
t3 s8 y8 s7
t3 s8 y8 s9 */






(* KEEP="TRUE" *)  wire [3:0] m20out;
tcnot m20({m15out[4],m19out[3],m16out[1],m18out[3]},m20out);
/*
t2 y8 s0
t2 y8 s7
t2 y8 s8*/

// HERE

// Block 6

(* KEEP="TRUE" *)  wire [5:0] m21out;
mexor4 m21({s_in[10],m20out[2],m19out[2],m20out[1],y_in[9],x_in[9]},m21out);
/*
t3 x9 y9 s0
t3 x9 y9 s1
t3 x9 y9 s7
t3 x9 y9 s10*/

(* KEEP="TRUE" *)  wire [3:0] m22out;
tcnot m22({y_in[9],m18out[2],m14out[2],x_in[9]},m22out);
/*
t2 x9 y1
t2 x9 y7
t2 x9 y9*/

(* KEEP="TRUE" *)  wire [5:0] m23out;
mexor4 m23({m21out[5],m21out[4],m21out[3],m21out[2],m22out[3],m19out[4]},m23out);
/*
t3 s9 y9 s0
t3 s9 y9 s1
t3 s9 y9 s7 
t3 s9 y9 s10*/

(* KEEP="TRUE" *)  wire [3:0] m24out;
tcnot m24({m19out[4],m23out[4],m23out[3],m22out[3]},m24out);
/*
t2 y9 s1
t2 y9 s7
t2 y9 s9*/

// Block 7

(* KEEP="TRUE" *)  wire [4:0] m25out;
mexor m25({s_in[11],m24out[2],m16out[3],y_in[10],x_in[10]},m25out);
/*
t3 x10 y10 s3
t3 x10 y10 s7
t3 x10 y10 s11*/

(* KEEP="TRUE" *)  wire [4:0] m26out;
qcnot m26({y_in[10],m22out[2],m22out[1],m18out[1],x_in[10]},m26out);
/*
t2 x10 y0
t2 x10 y1
t2 x10 y7
t2 x10 y10*/

(* KEEP="TRUE" *)  wire [4:0] m27out;
mexor m27({m25out[4],m25out[3],m25out[2],m26out[4],m23out[5]},m27out);
/*
t3 s10 y10 s3
t3 s10 y10 s7
t3 s10 y10 s11*/

(* KEEP="TRUE" *)  wire [4:0] m28out;
qcnot m28({m23out[5],m27out[3],m24out[1],m23out[2],m26out[4]},m28out);
/*
t2 y10 s0
t2 y10 s1
t2 y10 s7
t2 y10 s10*/

// Block 8

(* KEEP="TRUE" *)  wire [2:0] m29out;
tof m29({ovf_in,y_in[11],x_in[11]},m29out);
/*
t3 x11 y11 ovf*/

(* KEEP="TRUE" *)  wire [3:0] m30out;
tcnot m30({y_in[11],m26out[3],m14out[3],x_in[11]},m30out);
/*
t2 x11 y3
t2 x11 y7
t2 x11 y11*/

(* KEEP="TRUE" *)  wire[2:0] m31out;
tof m31({m29out[2],m30out[3],m27out[4]},m31out);
/*
t3 s11 y11 ovf*/

(* KEEP="TRUE" *)  wire[3:0] m32out;
tcnot m32({m27out[4],m28out[3],m27out[2],m30out[3]},m32out);
/*
t2 y11 s3
t2 y11 s7
t2 y11 s11*/

assign ovf_out = m31out[2];
assign x_out = x_in;
assign y_out = {m30out[3],m26out[4],m22out[3],m18out[3],m30out[2],m14out[4],m10out[3],m6out[3],m30out[1],m2out[3],m26out[2],m26out[1]};
assign s_out = {m32out[3],m28out[4],m24out[3],m20out[3],m32out[2],m16out[4],m12out[3],m8out[3],m32out[1],m4out[3],m28out[2],m28out[1]};
endmodule
