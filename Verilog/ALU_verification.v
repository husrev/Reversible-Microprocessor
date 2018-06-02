`timescale 1ns / 1ps

module ALU_verification;

	reg [11:0] s_in;
	reg [11:0] x_in;
	reg [11:0] y_in;
	reg ovf_in;
	wire [11:0] s_out;
	wire [11:0] x_out; 
	wire [11:0] y_out;
	wire ovf_out;

	DAFA uut (
		.s_in(s_in), 
		.x_in(x_in), 
		.y_in(y_in), 
		.s_out(s_out), 
		.x_out(x_out), 
		.y_out(y_out), 
		.ovf_in(ovf_in), 
		.ovf_out(ovf_out)
	);

	initial begin
		s_in = 0;
		x_in = 0;
		y_in = 0;
		ovf_in = 0;
		#100;

		// Test case #0
		y_in = 12'b000000000000; //15
		x_in = 12'b000001111111; //0
		#10;
		if(s_out != 12'b000001111111) //if 15
			$display("Error: In 15+0 s_out is %b while it should be 000001111111", s_out);

		// Test case #1
		y_in = 12'b000000000111; //15
		x_in = 12'b000001111111; //1
		#10;
		if(s_out != 12'b000110000001) //if 16
			$display("Error: In 15+1 s_out is %b while it should be 000110000001", s_out);

		// Test case #2
		y_in = 12'b000000011001; //15
		x_in = 12'b000001111111; //2
		#10;
		if(s_out != 12'b000110000110) //if 17
			$display("Error: In 15+2 s_out is %b while it should be 000110000110", s_out);

		// Test case #3
		y_in = 12'b000000011110; //15
		x_in = 12'b000001111111; //3
		#10;
		if(s_out != 12'b000110011000) //if 18
			$display("Error: In 15+3 s_out is %b while it should be 000110011000", s_out);

		// Test case #4
		y_in = 12'b000000101010; //15
		x_in = 12'b000001111111; //4
		#10;
		if(s_out != 12'b000110011111) //if 19
			$display("Error: In 15+4 s_out is %b while it should be 000110011111", s_out);

		// Test case #5
		y_in = 12'b000000101101; //15
		x_in = 12'b000001111111; //5
		#10;
		if(s_out != 12'b000110101011) //if 20
			$display("Error: In 15+5 s_out is %b while it should be 000110101011", s_out);

		// Test case #6
		y_in = 12'b000000110011; //15
		x_in = 12'b000001111111; //6
		#10;
		if(s_out != 12'b000110101100) //if 21
			$display("Error: In 15+6 s_out is %b while it should be 000110101100", s_out);

		// Test case #7
		y_in = 12'b000000110100; //15
		x_in = 12'b000001111111; //7
		#10;
		if(s_out != 12'b000110110010) //if 22
			$display("Error: In 15+7 s_out is %b while it should be 000110110010", s_out);

		// Test case #8
		y_in = 12'b000001001011; //15
		x_in = 12'b000001111111; //8
		#10;
		if(s_out != 12'b000110110101) //if 23
			$display("Error: In 15+8 s_out is %b while it should be 000110110101", s_out);

		// Test case #9
		y_in = 12'b000001001100; //15
		x_in = 12'b000001111111; //9
		#10;
		if(s_out != 12'b000111001010) //if 24
			$display("Error: In 15+9 s_out is %b while it should be 000111001010", s_out);

		// Test case #10
		y_in = 12'b000001010010; //15
		x_in = 12'b000001111111; //10
		#10;
		if(s_out != 12'b000111001101) //if 25
			$display("Error: In 15+10 s_out is %b while it should be 000111001101", s_out);

		// Test case #11
		y_in = 12'b000001010101; //15
		x_in = 12'b000001111111; //11
		#10;
		if(s_out != 12'b000111010011) //if 26
			$display("Error: In 15+11 s_out is %b while it should be 000111010011", s_out);

		// Test case #12
		y_in = 12'b000001100001; //15
		x_in = 12'b000001111111; //12
		#10;
		if(s_out != 12'b000111010100) //if 27
			$display("Error: In 15+12 s_out is %b while it should be 000111010100", s_out);

		// Test case #13
		y_in = 12'b000001100110; //15
		x_in = 12'b000001111111; //13
		#10;
		if(s_out != 12'b000111100000) //if 28
			$display("Error: In 15+13 s_out is %b while it should be 000111100000", s_out);

		// Test case #14
		y_in = 12'b000001111000; //15
		x_in = 12'b000001111111; //14
		#10;
		if(s_out != 12'b000111100111) //if 29
			$display("Error: In 15+14 s_out is %b while it should be 000111100111", s_out);

		// Test case #15
		y_in = 12'b000001111111; //15
		x_in = 12'b000001111111; //15
		#10;
		if(s_out != 12'b000111111001) //if 30
			$display("Error: In 15+15 s_out is %b while it should be 000111111001", s_out);

		// Test case #16
		y_in = 12'b000110000001; //15
		x_in = 12'b000001111111; //16
		#10;
		if(s_out != 12'b000111111110) //if 31
			$display("Error: In 15+16 s_out is %b while it should be 000111111110", s_out);

		// Test case #17
		y_in = 12'b000110000110; //15
		x_in = 12'b000001111111; //17
		#10;
		if(s_out != 12'b001010000010) //if 32
			$display("Error: In 15+17 s_out is %b while it should be 001010000010", s_out);

		// Test case #18
		y_in = 12'b000110011000; //15
		x_in = 12'b000001111111; //18
		#10;
		if(s_out != 12'b001010000101) //if 33
			$display("Error: In 15+18 s_out is %b while it should be 001010000101", s_out);

		// Test case #19
		y_in = 12'b000110011111; //15
		x_in = 12'b000001111111; //19
		#10;
		if(s_out != 12'b001010011011) //if 34
			$display("Error: In 15+19 s_out is %b while it should be 001010011011", s_out);

		// Test case #20
		y_in = 12'b000110101011; //15
		x_in = 12'b000001111111; //20
		#10;
		if(s_out != 12'b001010011100) //if 35
			$display("Error: In 15+20 s_out is %b while it should be 001010011100", s_out);

		// Test case #21
		y_in = 12'b000110101100; //15
		x_in = 12'b000001111111; //21
		#10;
		if(s_out != 12'b001010101000) //if 36
			$display("Error: In 15+21 s_out is %b while it should be 001010101000", s_out);

		// Test case #22
		y_in = 12'b000110110010; //15
		x_in = 12'b000001111111; //22
		#10;
		if(s_out != 12'b001010101111) //if 37
			$display("Error: In 15+22 s_out is %b while it should be 001010101111", s_out);

		// Test case #23
		y_in = 12'b000110110101; //15
		x_in = 12'b000001111111; //23
		#10;
		if(s_out != 12'b001010110001) //if 38
			$display("Error: In 15+23 s_out is %b while it should be 001010110001", s_out);

		// Test case #24
		y_in = 12'b000111001010; //15
		x_in = 12'b000001111111; //24
		#10;
		if(s_out != 12'b001010110110) //if 39
			$display("Error: In 15+24 s_out is %b while it should be 001010110110", s_out);

		// Test case #25
		y_in = 12'b000111001101; //15
		x_in = 12'b000001111111; //25
		#10;
		if(s_out != 12'b001011001001) //if 40
			$display("Error: In 15+25 s_out is %b while it should be 001011001001", s_out);

		// Test case #26
		y_in = 12'b000111010011; //15
		x_in = 12'b000001111111; //26
		#10;
		if(s_out != 12'b001011001110) //if 41
			$display("Error: In 15+26 s_out is %b while it should be 001011001110", s_out);

		// Test case #27
		y_in = 12'b000111010100; //15
		x_in = 12'b000001111111; //27
		#10;
		if(s_out != 12'b001011010000) //if 42
			$display("Error: In 15+27 s_out is %b while it should be 001011010000", s_out);

		// Test case #28
		y_in = 12'b000111100000; //15
		x_in = 12'b000001111111; //28
		#10;
		if(s_out != 12'b001011010111) //if 43
			$display("Error: In 15+28 s_out is %b while it should be 001011010111", s_out);

		// Test case #29
		y_in = 12'b000111100111; //15
		x_in = 12'b000001111111; //29
		#10;
		if(s_out != 12'b001011100011) //if 44
			$display("Error: In 15+29 s_out is %b while it should be 001011100011", s_out);

		// Test case #30
		y_in = 12'b000111111001; //15
		x_in = 12'b000001111111; //30
		#10;
		if(s_out != 12'b001011100100) //if 45
			$display("Error: In 15+30 s_out is %b while it should be 001011100100", s_out);

		// Test case #31
		y_in = 12'b000111111110; //15
		x_in = 12'b000001111111; //31
		#10;
		if(s_out != 12'b001011111010) //if 46
			$display("Error: In 15+31 s_out is %b while it should be 001011111010", s_out);

		// Test case #32
		y_in = 12'b001010000010; //15
		x_in = 12'b000001111111; //32
		#10;
		if(s_out != 12'b001011111101) //if 47
			$display("Error: In 15+32 s_out is %b while it should be 001011111101", s_out);

		// Test case #33
		y_in = 12'b001010000101; //15
		x_in = 12'b000001111111; //33
		#10;
		if(s_out != 12'b001100000011) //if 48
			$display("Error: In 15+33 s_out is %b while it should be 001100000011", s_out);

		// Test case #34
		y_in = 12'b001010011011; //15
		x_in = 12'b000001111111; //34
		#10;
		if(s_out != 12'b001100000100) //if 49
			$display("Error: In 15+34 s_out is %b while it should be 001100000100", s_out);

		// Test case #35
		y_in = 12'b001010011100; //15
		x_in = 12'b000001111111; //35
		#10;
		if(s_out != 12'b001100011010) //if 50
			$display("Error: In 15+35 s_out is %b while it should be 001100011010", s_out);

		// Test case #36
		y_in = 12'b001010101000; //15
		x_in = 12'b000001111111; //36
		#10;
		if(s_out != 12'b001100011101) //if 51
			$display("Error: In 15+36 s_out is %b while it should be 001100011101", s_out);

		// Test case #37
		y_in = 12'b001010101111; //15
		x_in = 12'b000001111111; //37
		#10;
		if(s_out != 12'b001100101001) //if 52
			$display("Error: In 15+37 s_out is %b while it should be 001100101001", s_out);

		// Test case #38
		y_in = 12'b001010110001; //15
		x_in = 12'b000001111111; //38
		#10;
		if(s_out != 12'b001100101110) //if 53
			$display("Error: In 15+38 s_out is %b while it should be 001100101110", s_out);

		// Test case #39
		y_in = 12'b001010110110; //15
		x_in = 12'b000001111111; //39
		#10;
		if(s_out != 12'b001100110000) //if 54
			$display("Error: In 15+39 s_out is %b while it should be 001100110000", s_out);

		// Test case #40
		y_in = 12'b001011001001; //15
		x_in = 12'b000001111111; //40
		#10;
		if(s_out != 12'b001100110111) //if 55
			$display("Error: In 15+40 s_out is %b while it should be 001100110111", s_out);

		// Test case #41
		y_in = 12'b001011001110; //15
		x_in = 12'b000001111111; //41
		#10;
		if(s_out != 12'b001101001000) //if 56
			$display("Error: In 15+41 s_out is %b while it should be 001101001000", s_out);

		// Test case #42
		y_in = 12'b001011010000; //15
		x_in = 12'b000001111111; //42
		#10;
		if(s_out != 12'b001101001111) //if 57
			$display("Error: In 15+42 s_out is %b while it should be 001101001111", s_out);

		// Test case #43
		y_in = 12'b001011010111; //15
		x_in = 12'b000001111111; //43
		#10;
		if(s_out != 12'b001101010001) //if 58
			$display("Error: In 15+43 s_out is %b while it should be 001101010001", s_out);

		// Test case #44
		y_in = 12'b001011100011; //15
		x_in = 12'b000001111111; //44
		#10;
		if(s_out != 12'b001101010110) //if 59
			$display("Error: In 15+44 s_out is %b while it should be 001101010110", s_out);

		// Test case #45
		y_in = 12'b001011100100; //15
		x_in = 12'b000001111111; //45
		#10;
		if(s_out != 12'b001101100010) //if 60
			$display("Error: In 15+45 s_out is %b while it should be 001101100010", s_out);

		// Test case #46
		y_in = 12'b001011111010; //15
		x_in = 12'b000001111111; //46
		#10;
		if(s_out != 12'b001101100101) //if 61
			$display("Error: In 15+46 s_out is %b while it should be 001101100101", s_out);

		// Test case #47
		y_in = 12'b001011111101; //15
		x_in = 12'b000001111111; //47
		#10;
		if(s_out != 12'b001101111011) //if 62
			$display("Error: In 15+47 s_out is %b while it should be 001101111011", s_out);

		// Test case #48
		y_in = 12'b001100000011; //15
		x_in = 12'b000001111111; //48
		#10;
		if(s_out != 12'b001101111100) //if 63
			$display("Error: In 15+48 s_out is %b while it should be 001101111100", s_out);

		// Test case #49
		y_in = 12'b001100000100; //15
		x_in = 12'b000001111111; //49
		#10;
		if(s_out != 12'b010010000011) //if 64
			$display("Error: In 15+49 s_out is %b while it should be 010010000011", s_out);

		// Test case #50
		y_in = 12'b001100011010; //15
		x_in = 12'b000001111111; //50
		#10;
		if(s_out != 12'b010010000100) //if 65
			$display("Error: In 15+50 s_out is %b while it should be 010010000100", s_out);

		// Test case #51
		y_in = 12'b001100011101; //15
		x_in = 12'b000001111111; //51
		#10;
		if(s_out != 12'b010010011010) //if 66
			$display("Error: In 15+51 s_out is %b while it should be 010010011010", s_out);

		// Test case #52
		y_in = 12'b001100101001; //15
		x_in = 12'b000001111111; //52
		#10;
		if(s_out != 12'b010010011101) //if 67
			$display("Error: In 15+52 s_out is %b while it should be 010010011101", s_out);

		// Test case #53
		y_in = 12'b001100101110; //15
		x_in = 12'b000001111111; //53
		#10;
		if(s_out != 12'b010010101001) //if 68
			$display("Error: In 15+53 s_out is %b while it should be 010010101001", s_out);

		// Test case #54
		y_in = 12'b001100110000; //15
		x_in = 12'b000001111111; //54
		#10;
		if(s_out != 12'b010010101110) //if 69
			$display("Error: In 15+54 s_out is %b while it should be 010010101110", s_out);

		// Test case #55
		y_in = 12'b001100110111; //15
		x_in = 12'b000001111111; //55
		#10;
		if(s_out != 12'b010010110000) //if 70
			$display("Error: In 15+55 s_out is %b while it should be 010010110000", s_out);

		// Test case #56
		y_in = 12'b001101001000; //15
		x_in = 12'b000001111111; //56
		#10;
		if(s_out != 12'b010010110111) //if 71
			$display("Error: In 15+56 s_out is %b while it should be 010010110111", s_out);

		// Test case #57
		y_in = 12'b001101001111; //15
		x_in = 12'b000001111111; //57
		#10;
		if(s_out != 12'b010011001000) //if 72
			$display("Error: In 15+57 s_out is %b while it should be 010011001000", s_out);

		// Test case #58
		y_in = 12'b001101010001; //15
		x_in = 12'b000001111111; //58
		#10;
		if(s_out != 12'b010011001111) //if 73
			$display("Error: In 15+58 s_out is %b while it should be 010011001111", s_out);

		// Test case #59
		y_in = 12'b001101010110; //15
		x_in = 12'b000001111111; //59
		#10;
		if(s_out != 12'b010011010001) //if 74
			$display("Error: In 15+59 s_out is %b while it should be 010011010001", s_out);

		// Test case #60
		y_in = 12'b001101100010; //15
		x_in = 12'b000001111111; //60
		#10;
		if(s_out != 12'b010011010110) //if 75
			$display("Error: In 15+60 s_out is %b while it should be 010011010110", s_out);

		// Test case #61
		y_in = 12'b001101100101; //15
		x_in = 12'b000001111111; //61
		#10;
		if(s_out != 12'b010011100010) //if 76
			$display("Error: In 15+61 s_out is %b while it should be 010011100010", s_out);

		// Test case #62
		y_in = 12'b001101111011; //15
		x_in = 12'b000001111111; //62
		#10;
		if(s_out != 12'b010011100101) //if 77
			$display("Error: In 15+62 s_out is %b while it should be 010011100101", s_out);

		// Test case #63
		y_in = 12'b001101111100; //15
		x_in = 12'b000001111111; //63
		#10;
		if(s_out != 12'b010011111011) //if 78
			$display("Error: In 15+63 s_out is %b while it should be 010011111011", s_out);

		// Test case #64
		y_in = 12'b010010000011; //15
		x_in = 12'b000001111111; //64
		#10;
		if(s_out != 12'b010011111100) //if 79
			$display("Error: In 15+64 s_out is %b while it should be 010011111100", s_out);

		// Test case #65
		y_in = 12'b010010000100; //15
		x_in = 12'b000001111111; //65
		#10;
		if(s_out != 12'b010100000010) //if 80
			$display("Error: In 15+65 s_out is %b while it should be 010100000010", s_out);

		// Test case #66
		y_in = 12'b010010011010; //15
		x_in = 12'b000001111111; //66
		#10;
		if(s_out != 12'b010100000101) //if 81
			$display("Error: In 15+66 s_out is %b while it should be 010100000101", s_out);

		// Test case #67
		y_in = 12'b010010011101; //15
		x_in = 12'b000001111111; //67
		#10;
		if(s_out != 12'b010100011011) //if 82
			$display("Error: In 15+67 s_out is %b while it should be 010100011011", s_out);

		// Test case #68
		y_in = 12'b010010101001; //15
		x_in = 12'b000001111111; //68
		#10;
		if(s_out != 12'b010100011100) //if 83
			$display("Error: In 15+68 s_out is %b while it should be 010100011100", s_out);

		// Test case #69
		y_in = 12'b010010101110; //15
		x_in = 12'b000001111111; //69
		#10;
		if(s_out != 12'b010100101000) //if 84
			$display("Error: In 15+69 s_out is %b while it should be 010100101000", s_out);

		// Test case #70
		y_in = 12'b010010110000; //15
		x_in = 12'b000001111111; //70
		#10;
		if(s_out != 12'b010100101111) //if 85
			$display("Error: In 15+70 s_out is %b while it should be 010100101111", s_out);

		// Test case #71
		y_in = 12'b010010110111; //15
		x_in = 12'b000001111111; //71
		#10;
		if(s_out != 12'b010100110001) //if 86
			$display("Error: In 15+71 s_out is %b while it should be 010100110001", s_out);

		// Test case #72
		y_in = 12'b010011001000; //15
		x_in = 12'b000001111111; //72
		#10;
		if(s_out != 12'b010100110110) //if 87
			$display("Error: In 15+72 s_out is %b while it should be 010100110110", s_out);

		// Test case #73
		y_in = 12'b010011001111; //15
		x_in = 12'b000001111111; //73
		#10;
		if(s_out != 12'b010101001001) //if 88
			$display("Error: In 15+73 s_out is %b while it should be 010101001001", s_out);

		// Test case #74
		y_in = 12'b010011010001; //15
		x_in = 12'b000001111111; //74
		#10;
		if(s_out != 12'b010101001110) //if 89
			$display("Error: In 15+74 s_out is %b while it should be 010101001110", s_out);

		// Test case #75
		y_in = 12'b010011010110; //15
		x_in = 12'b000001111111; //75
		#10;
		if(s_out != 12'b010101010000) //if 90
			$display("Error: In 15+75 s_out is %b while it should be 010101010000", s_out);

		// Test case #76
		y_in = 12'b010011100010; //15
		x_in = 12'b000001111111; //76
		#10;
		if(s_out != 12'b010101010111) //if 91
			$display("Error: In 15+76 s_out is %b while it should be 010101010111", s_out);

		// Test case #77
		y_in = 12'b010011100101; //15
		x_in = 12'b000001111111; //77
		#10;
		if(s_out != 12'b010101100011) //if 92
			$display("Error: In 15+77 s_out is %b while it should be 010101100011", s_out);

		// Test case #78
		y_in = 12'b010011111011; //15
		x_in = 12'b000001111111; //78
		#10;
		if(s_out != 12'b010101100100) //if 93
			$display("Error: In 15+78 s_out is %b while it should be 010101100100", s_out);

		// Test case #79
		y_in = 12'b010011111100; //15
		x_in = 12'b000001111111; //79
		#10;
		if(s_out != 12'b010101111010) //if 94
			$display("Error: In 15+79 s_out is %b while it should be 010101111010", s_out);

		// Test case #80
		y_in = 12'b010100000010; //15
		x_in = 12'b000001111111; //80
		#10;
		if(s_out != 12'b010101111101) //if 95
			$display("Error: In 15+80 s_out is %b while it should be 010101111101", s_out);

		// Test case #81
		y_in = 12'b010100000101; //15
		x_in = 12'b000001111111; //81
		#10;
		if(s_out != 12'b011000000001) //if 96
			$display("Error: In 15+81 s_out is %b while it should be 011000000001", s_out);

		// Test case #82
		y_in = 12'b010100011011; //15
		x_in = 12'b000001111111; //82
		#10;
		if(s_out != 12'b011000000110) //if 97
			$display("Error: In 15+82 s_out is %b while it should be 011000000110", s_out);

		// Test case #83
		y_in = 12'b010100011100; //15
		x_in = 12'b000001111111; //83
		#10;
		if(s_out != 12'b011000011000) //if 98
			$display("Error: In 15+83 s_out is %b while it should be 011000011000", s_out);

		// Test case #84
		y_in = 12'b010100101000; //15
		x_in = 12'b000001111111; //84
		#10;
		if(s_out != 12'b011000011111) //if 99
			$display("Error: In 15+84 s_out is %b while it should be 011000011111", s_out);

		// Test case #85
		y_in = 12'b010100101111; //15
		x_in = 12'b000001111111; //85
		#10;
		if(s_out != 12'b011000101011) //if 100
			$display("Error: In 15+85 s_out is %b while it should be 011000101011", s_out);

		// Test case #86
		y_in = 12'b010100110001; //15
		x_in = 12'b000001111111; //86
		#10;
		if(s_out != 12'b011000101100) //if 101
			$display("Error: In 15+86 s_out is %b while it should be 011000101100", s_out);

		// Test case #87
		y_in = 12'b010100110110; //15
		x_in = 12'b000001111111; //87
		#10;
		if(s_out != 12'b011000110010) //if 102
			$display("Error: In 15+87 s_out is %b while it should be 011000110010", s_out);

		// Test case #88
		y_in = 12'b010101001001; //15
		x_in = 12'b000001111111; //88
		#10;
		if(s_out != 12'b011000110101) //if 103
			$display("Error: In 15+88 s_out is %b while it should be 011000110101", s_out);

		// Test case #89
		y_in = 12'b010101001110; //15
		x_in = 12'b000001111111; //89
		#10;
		if(s_out != 12'b011001001010) //if 104
			$display("Error: In 15+89 s_out is %b while it should be 011001001010", s_out);

		// Test case #90
		y_in = 12'b010101010000; //15
		x_in = 12'b000001111111; //90
		#10;
		if(s_out != 12'b011001001101) //if 105
			$display("Error: In 15+90 s_out is %b while it should be 011001001101", s_out);

		// Test case #91
		y_in = 12'b010101010111; //15
		x_in = 12'b000001111111; //91
		#10;
		if(s_out != 12'b011001010011) //if 106
			$display("Error: In 15+91 s_out is %b while it should be 011001010011", s_out);

		// Test case #92
		y_in = 12'b010101100011; //15
		x_in = 12'b000001111111; //92
		#10;
		if(s_out != 12'b011001010100) //if 107
			$display("Error: In 15+92 s_out is %b while it should be 011001010100", s_out);

		// Test case #93
		y_in = 12'b010101100100; //15
		x_in = 12'b000001111111; //93
		#10;
		if(s_out != 12'b011001100000) //if 108
			$display("Error: In 15+93 s_out is %b while it should be 011001100000", s_out);

		// Test case #94
		y_in = 12'b010101111010; //15
		x_in = 12'b000001111111; //94
		#10;
		if(s_out != 12'b011001100111) //if 109
			$display("Error: In 15+94 s_out is %b while it should be 011001100111", s_out);

		// Test case #95
		y_in = 12'b010101111101; //15
		x_in = 12'b000001111111; //95
		#10;
		if(s_out != 12'b011001111001) //if 110
			$display("Error: In 15+95 s_out is %b while it should be 011001111001", s_out);

		// Test case #96
		y_in = 12'b011000000001; //15
		x_in = 12'b000001111111; //96
		#10;
		if(s_out != 12'b011001111110) //if 111
			$display("Error: In 15+96 s_out is %b while it should be 011001111110", s_out);

		// Test case #97
		y_in = 12'b011000000110; //15
		x_in = 12'b000001111111; //97
		#10;
		if(s_out != 12'b011110000000) //if 112
			$display("Error: In 15+97 s_out is %b while it should be 011110000000", s_out);

		// Test case #98
		y_in = 12'b011000011000; //15
		x_in = 12'b000001111111; //98
		#10;
		if(s_out != 12'b011110000111) //if 113
			$display("Error: In 15+98 s_out is %b while it should be 011110000111", s_out);

		// Test case #99
		y_in = 12'b011000011111; //15
		x_in = 12'b000001111111; //99
		#10;
		if(s_out != 12'b011110011001) //if 114
			$display("Error: In 15+99 s_out is %b while it should be 011110011001", s_out);

		// Test case #100
		y_in = 12'b011000101011; //15
		x_in = 12'b000001111111; //100
		#10;
		if(s_out != 12'b011110011110) //if 115
			$display("Error: In 15+100 s_out is %b while it should be 011110011110", s_out);

		// Test case #101
		y_in = 12'b011000101100; //15
		x_in = 12'b000001111111; //101
		#10;
		if(s_out != 12'b011110101010) //if 116
			$display("Error: In 15+101 s_out is %b while it should be 011110101010", s_out);

		// Test case #102
		y_in = 12'b011000110010; //15
		x_in = 12'b000001111111; //102
		#10;
		if(s_out != 12'b011110101101) //if 117
			$display("Error: In 15+102 s_out is %b while it should be 011110101101", s_out);

		// Test case #103
		y_in = 12'b011000110101; //15
		x_in = 12'b000001111111; //103
		#10;
		if(s_out != 12'b011110110011) //if 118
			$display("Error: In 15+103 s_out is %b while it should be 011110110011", s_out);

		// Test case #104
		y_in = 12'b011001001010; //15
		x_in = 12'b000001111111; //104
		#10;
		if(s_out != 12'b011110110100) //if 119
			$display("Error: In 15+104 s_out is %b while it should be 011110110100", s_out);

		// Test case #105
		y_in = 12'b011001001101; //15
		x_in = 12'b000001111111; //105
		#10;
		if(s_out != 12'b011111001011) //if 120
			$display("Error: In 15+105 s_out is %b while it should be 011111001011", s_out);

		// Test case #106
		y_in = 12'b011001010011; //15
		x_in = 12'b000001111111; //106
		#10;
		if(s_out != 12'b011111001100) //if 121
			$display("Error: In 15+106 s_out is %b while it should be 011111001100", s_out);

		// Test case #107
		y_in = 12'b011001010100; //15
		x_in = 12'b000001111111; //107
		#10;
		if(s_out != 12'b011111010010) //if 122
			$display("Error: In 15+107 s_out is %b while it should be 011111010010", s_out);

		// Test case #108
		y_in = 12'b011001100000; //15
		x_in = 12'b000001111111; //108
		#10;
		if(s_out != 12'b011111010101) //if 123
			$display("Error: In 15+108 s_out is %b while it should be 011111010101", s_out);

		// Test case #109
		y_in = 12'b011001100111; //15
		x_in = 12'b000001111111; //109
		#10;
		if(s_out != 12'b011111100001) //if 124
			$display("Error: In 15+109 s_out is %b while it should be 011111100001", s_out);

		// Test case #110
		y_in = 12'b011001111001; //15
		x_in = 12'b000001111111; //110
		#10;
		if(s_out != 12'b011111100110) //if 125
			$display("Error: In 15+110 s_out is %b while it should be 011111100110", s_out);

		// Test case #111
		y_in = 12'b011001111110; //15
		x_in = 12'b000001111111; //111
		#10;
		if(s_out != 12'b011111111000) //if 126
			$display("Error: In 15+111 s_out is %b while it should be 011111111000", s_out);

		// Test case #112
		y_in = 12'b011110000000; //15
		x_in = 12'b000001111111; //112
		#10;
		if(s_out != 12'b011111111111) //if 127
			$display("Error: In 15+112 s_out is %b while it should be 011111111111", s_out);

		// Test case #113
		y_in = 12'b011110000111; //15
		x_in = 12'b000001111111; //113
		#10;
		if(s_out != 12'b100010001000) //if 128
			$display("Error: In 15+113 s_out is %b while it should be 100010001000", s_out);

		// Test case #114
		y_in = 12'b011110011001; //15
		x_in = 12'b000001111111; //114
		#10;
		if(s_out != 12'b100010001111) //if 129
			$display("Error: In 15+114 s_out is %b while it should be 100010001111", s_out);

		// Test case #115
		y_in = 12'b011110011110; //15
		x_in = 12'b000001111111; //115
		#10;
		if(s_out != 12'b100010010001) //if 130
			$display("Error: In 15+115 s_out is %b while it should be 100010010001", s_out);

		// Test case #116
		y_in = 12'b011110101010; //15
		x_in = 12'b000001111111; //116
		#10;
		if(s_out != 12'b100010010110) //if 131
			$display("Error: In 15+116 s_out is %b while it should be 100010010110", s_out);

		// Test case #117
		y_in = 12'b011110101101; //15
		x_in = 12'b000001111111; //117
		#10;
		if(s_out != 12'b100010100010) //if 132
			$display("Error: In 15+117 s_out is %b while it should be 100010100010", s_out);

		// Test case #118
		y_in = 12'b011110110011; //15
		x_in = 12'b000001111111; //118
		#10;
		if(s_out != 12'b100010100101) //if 133
			$display("Error: In 15+118 s_out is %b while it should be 100010100101", s_out);

		// Test case #119
		y_in = 12'b011110110100; //15
		x_in = 12'b000001111111; //119
		#10;
		if(s_out != 12'b100010111011) //if 134
			$display("Error: In 15+119 s_out is %b while it should be 100010111011", s_out);

		// Test case #120
		y_in = 12'b011111001011; //15
		x_in = 12'b000001111111; //120
		#10;
		if(s_out != 12'b100010111100) //if 135
			$display("Error: In 15+120 s_out is %b while it should be 100010111100", s_out);

		// Test case #121
		y_in = 12'b011111001100; //15
		x_in = 12'b000001111111; //121
		#10;
		if(s_out != 12'b100011000011) //if 136
			$display("Error: In 15+121 s_out is %b while it should be 100011000011", s_out);

		// Test case #122
		y_in = 12'b011111010010; //15
		x_in = 12'b000001111111; //122
		#10;
		if(s_out != 12'b100011000100) //if 137
			$display("Error: In 15+122 s_out is %b while it should be 100011000100", s_out);

		// Test case #123
		y_in = 12'b011111010101; //15
		x_in = 12'b000001111111; //123
		#10;
		if(s_out != 12'b100011011010) //if 138
			$display("Error: In 15+123 s_out is %b while it should be 100011011010", s_out);

		// Test case #124
		y_in = 12'b011111100001; //15
		x_in = 12'b000001111111; //124
		#10;
		if(s_out != 12'b100011011101) //if 139
			$display("Error: In 15+124 s_out is %b while it should be 100011011101", s_out);

		// Test case #125
		y_in = 12'b011111100110; //15
		x_in = 12'b000001111111; //125
		#10;
		if(s_out != 12'b100011101001) //if 140
			$display("Error: In 15+125 s_out is %b while it should be 100011101001", s_out);

		// Test case #126
		y_in = 12'b011111111000; //15
		x_in = 12'b000001111111; //126
		#10;
		if(s_out != 12'b100011101110) //if 141
			$display("Error: In 15+126 s_out is %b while it should be 100011101110", s_out);

		// Test case #127
		y_in = 12'b011111111111; //15
		x_in = 12'b000001111111; //127
		#10;
		if(s_out != 12'b100011110000) //if 142
			$display("Error: In 15+127 s_out is %b while it should be 100011110000", s_out);

		// Test case #128
		y_in = 12'b100010001000; //15
		x_in = 12'b000001111111; //128
		#10;
		if(s_out != 12'b100011110111) //if 143
			$display("Error: In 15+128 s_out is %b while it should be 100011110111", s_out);

		// Test case #129
		y_in = 12'b100010001111; //15
		x_in = 12'b000001111111; //129
		#10;
		if(s_out != 12'b100100001001) //if 144
			$display("Error: In 15+129 s_out is %b while it should be 100100001001", s_out);

		// Test case #130
		y_in = 12'b100010010001; //15
		x_in = 12'b000001111111; //130
		#10;
		if(s_out != 12'b100100001110) //if 145
			$display("Error: In 15+130 s_out is %b while it should be 100100001110", s_out);

		// Test case #131
		y_in = 12'b100010010110; //15
		x_in = 12'b000001111111; //131
		#10;
		if(s_out != 12'b100100010000) //if 146
			$display("Error: In 15+131 s_out is %b while it should be 100100010000", s_out);

		// Test case #132
		y_in = 12'b100010100010; //15
		x_in = 12'b000001111111; //132
		#10;
		if(s_out != 12'b100100010111) //if 147
			$display("Error: In 15+132 s_out is %b while it should be 100100010111", s_out);

		// Test case #133
		y_in = 12'b100010100101; //15
		x_in = 12'b000001111111; //133
		#10;
		if(s_out != 12'b100100100011) //if 148
			$display("Error: In 15+133 s_out is %b while it should be 100100100011", s_out);

		// Test case #134
		y_in = 12'b100010111011; //15
		x_in = 12'b000001111111; //134
		#10;
		if(s_out != 12'b100100100100) //if 149
			$display("Error: In 15+134 s_out is %b while it should be 100100100100", s_out);

		// Test case #135
		y_in = 12'b100010111100; //15
		x_in = 12'b000001111111; //135
		#10;
		if(s_out != 12'b100100111010) //if 150
			$display("Error: In 15+135 s_out is %b while it should be 100100111010", s_out);

		// Test case #136
		y_in = 12'b100011000011; //15
		x_in = 12'b000001111111; //136
		#10;
		if(s_out != 12'b100100111101) //if 151
			$display("Error: In 15+136 s_out is %b while it should be 100100111101", s_out);

		// Test case #137
		y_in = 12'b100011000100; //15
		x_in = 12'b000001111111; //137
		#10;
		if(s_out != 12'b100101000010) //if 152
			$display("Error: In 15+137 s_out is %b while it should be 100101000010", s_out);

		// Test case #138
		y_in = 12'b100011011010; //15
		x_in = 12'b000001111111; //138
		#10;
		if(s_out != 12'b100101000101) //if 153
			$display("Error: In 15+138 s_out is %b while it should be 100101000101", s_out);

		// Test case #139
		y_in = 12'b100011011101; //15
		x_in = 12'b000001111111; //139
		#10;
		if(s_out != 12'b100101011011) //if 154
			$display("Error: In 15+139 s_out is %b while it should be 100101011011", s_out);

		// Test case #140
		y_in = 12'b100011101001; //15
		x_in = 12'b000001111111; //140
		#10;
		if(s_out != 12'b100101011100) //if 155
			$display("Error: In 15+140 s_out is %b while it should be 100101011100", s_out);

		// Test case #141
		y_in = 12'b100011101110; //15
		x_in = 12'b000001111111; //141
		#10;
		if(s_out != 12'b100101101000) //if 156
			$display("Error: In 15+141 s_out is %b while it should be 100101101000", s_out);

		// Test case #142
		y_in = 12'b100011110000; //15
		x_in = 12'b000001111111; //142
		#10;
		if(s_out != 12'b100101101111) //if 157
			$display("Error: In 15+142 s_out is %b while it should be 100101101111", s_out);

		// Test case #143
		y_in = 12'b100011110111; //15
		x_in = 12'b000001111111; //143
		#10;
		if(s_out != 12'b100101110001) //if 158
			$display("Error: In 15+143 s_out is %b while it should be 100101110001", s_out);

		// Test case #144
		y_in = 12'b100100001001; //15
		x_in = 12'b000001111111; //144
		#10;
		if(s_out != 12'b100101110110) //if 159
			$display("Error: In 15+144 s_out is %b while it should be 100101110110", s_out);

		// Test case #145
		y_in = 12'b100100001110; //15
		x_in = 12'b000001111111; //145
		#10;
		if(s_out != 12'b101000001010) //if 160
			$display("Error: In 15+145 s_out is %b while it should be 101000001010", s_out);

		// Test case #146
		y_in = 12'b100100010000; //15
		x_in = 12'b000001111111; //146
		#10;
		if(s_out != 12'b101000001101) //if 161
			$display("Error: In 15+146 s_out is %b while it should be 101000001101", s_out);

		// Test case #147
		y_in = 12'b100100010111; //15
		x_in = 12'b000001111111; //147
		#10;
		if(s_out != 12'b101000010011) //if 162
			$display("Error: In 15+147 s_out is %b while it should be 101000010011", s_out);

		// Test case #148
		y_in = 12'b100100100011; //15
		x_in = 12'b000001111111; //148
		#10;
		if(s_out != 12'b101000010100) //if 163
			$display("Error: In 15+148 s_out is %b while it should be 101000010100", s_out);

		// Test case #149
		y_in = 12'b100100100100; //15
		x_in = 12'b000001111111; //149
		#10;
		if(s_out != 12'b101000100000) //if 164
			$display("Error: In 15+149 s_out is %b while it should be 101000100000", s_out);

		// Test case #150
		y_in = 12'b100100111010; //15
		x_in = 12'b000001111111; //150
		#10;
		if(s_out != 12'b101000100111) //if 165
			$display("Error: In 15+150 s_out is %b while it should be 101000100111", s_out);

		// Test case #151
		y_in = 12'b100100111101; //15
		x_in = 12'b000001111111; //151
		#10;
		if(s_out != 12'b101000111001) //if 166
			$display("Error: In 15+151 s_out is %b while it should be 101000111001", s_out);

		// Test case #152
		y_in = 12'b100101000010; //15
		x_in = 12'b000001111111; //152
		#10;
		if(s_out != 12'b101000111110) //if 167
			$display("Error: In 15+152 s_out is %b while it should be 101000111110", s_out);

		// Test case #153
		y_in = 12'b100101000101; //15
		x_in = 12'b000001111111; //153
		#10;
		if(s_out != 12'b101001000001) //if 168
			$display("Error: In 15+153 s_out is %b while it should be 101001000001", s_out);

		// Test case #154
		y_in = 12'b100101011011; //15
		x_in = 12'b000001111111; //154
		#10;
		if(s_out != 12'b101001000110) //if 169
			$display("Error: In 15+154 s_out is %b while it should be 101001000110", s_out);

		// Test case #155
		y_in = 12'b100101011100; //15
		x_in = 12'b000001111111; //155
		#10;
		if(s_out != 12'b101001011000) //if 170
			$display("Error: In 15+155 s_out is %b while it should be 101001011000", s_out);

		// Test case #156
		y_in = 12'b100101101000; //15
		x_in = 12'b000001111111; //156
		#10;
		if(s_out != 12'b101001011111) //if 171
			$display("Error: In 15+156 s_out is %b while it should be 101001011111", s_out);

		// Test case #157
		y_in = 12'b100101101111; //15
		x_in = 12'b000001111111; //157
		#10;
		if(s_out != 12'b101001101011) //if 172
			$display("Error: In 15+157 s_out is %b while it should be 101001101011", s_out);

		// Test case #158
		y_in = 12'b100101110001; //15
		x_in = 12'b000001111111; //158
		#10;
		if(s_out != 12'b101001101100) //if 173
			$display("Error: In 15+158 s_out is %b while it should be 101001101100", s_out);

		// Test case #159
		y_in = 12'b100101110110; //15
		x_in = 12'b000001111111; //159
		#10;
		if(s_out != 12'b101001110010) //if 174
			$display("Error: In 15+159 s_out is %b while it should be 101001110010", s_out);

		// Test case #160
		y_in = 12'b101000001010; //15
		x_in = 12'b000001111111; //160
		#10;
		if(s_out != 12'b101001110101) //if 175
			$display("Error: In 15+160 s_out is %b while it should be 101001110101", s_out);

		// Test case #161
		y_in = 12'b101000001101; //15
		x_in = 12'b000001111111; //161
		#10;
		if(s_out != 12'b101110001011) //if 176
			$display("Error: In 15+161 s_out is %b while it should be 101110001011", s_out);

		// Test case #162
		y_in = 12'b101000010011; //15
		x_in = 12'b000001111111; //162
		#10;
		if(s_out != 12'b101110001100) //if 177
			$display("Error: In 15+162 s_out is %b while it should be 101110001100", s_out);

		// Test case #163
		y_in = 12'b101000010100; //15
		x_in = 12'b000001111111; //163
		#10;
		if(s_out != 12'b101110010010) //if 178
			$display("Error: In 15+163 s_out is %b while it should be 101110010010", s_out);

		// Test case #164
		y_in = 12'b101000100000; //15
		x_in = 12'b000001111111; //164
		#10;
		if(s_out != 12'b101110010101) //if 179
			$display("Error: In 15+164 s_out is %b while it should be 101110010101", s_out);

		// Test case #165
		y_in = 12'b101000100111; //15
		x_in = 12'b000001111111; //165
		#10;
		if(s_out != 12'b101110100001) //if 180
			$display("Error: In 15+165 s_out is %b while it should be 101110100001", s_out);

		// Test case #166
		y_in = 12'b101000111001; //15
		x_in = 12'b000001111111; //166
		#10;
		if(s_out != 12'b101110100110) //if 181
			$display("Error: In 15+166 s_out is %b while it should be 101110100110", s_out);

		// Test case #167
		y_in = 12'b101000111110; //15
		x_in = 12'b000001111111; //167
		#10;
		if(s_out != 12'b101110111000) //if 182
			$display("Error: In 15+167 s_out is %b while it should be 101110111000", s_out);

		// Test case #168
		y_in = 12'b101001000001; //15
		x_in = 12'b000001111111; //168
		#10;
		if(s_out != 12'b101110111111) //if 183
			$display("Error: In 15+168 s_out is %b while it should be 101110111111", s_out);

		// Test case #169
		y_in = 12'b101001000110; //15
		x_in = 12'b000001111111; //169
		#10;
		if(s_out != 12'b101111000000) //if 184
			$display("Error: In 15+169 s_out is %b while it should be 101111000000", s_out);

		// Test case #170
		y_in = 12'b101001011000; //15
		x_in = 12'b000001111111; //170
		#10;
		if(s_out != 12'b101111000111) //if 185
			$display("Error: In 15+170 s_out is %b while it should be 101111000111", s_out);

		// Test case #171
		y_in = 12'b101001011111; //15
		x_in = 12'b000001111111; //171
		#10;
		if(s_out != 12'b101111011001) //if 186
			$display("Error: In 15+171 s_out is %b while it should be 101111011001", s_out);

		// Test case #172
		y_in = 12'b101001101011; //15
		x_in = 12'b000001111111; //172
		#10;
		if(s_out != 12'b101111011110) //if 187
			$display("Error: In 15+172 s_out is %b while it should be 101111011110", s_out);

		// Test case #173
		y_in = 12'b101001101100; //15
		x_in = 12'b000001111111; //173
		#10;
		if(s_out != 12'b101111101010) //if 188
			$display("Error: In 15+173 s_out is %b while it should be 101111101010", s_out);

		// Test case #174
		y_in = 12'b101001110010; //15
		x_in = 12'b000001111111; //174
		#10;
		if(s_out != 12'b101111101101) //if 189
			$display("Error: In 15+174 s_out is %b while it should be 101111101101", s_out);

		// Test case #175
		y_in = 12'b101001110101; //15
		x_in = 12'b000001111111; //175
		#10;
		if(s_out != 12'b101111110011) //if 190
			$display("Error: In 15+175 s_out is %b while it should be 101111110011", s_out);

		// Test case #176
		y_in = 12'b101110001011; //15
		x_in = 12'b000001111111; //176
		#10;
		if(s_out != 12'b101111110100) //if 191
			$display("Error: In 15+176 s_out is %b while it should be 101111110100", s_out);

		// Test case #177
		y_in = 12'b101110001100; //15
		x_in = 12'b000001111111; //177
		#10;
		if(s_out != 12'b110000001011) //if 192
			$display("Error: In 15+177 s_out is %b while it should be 110000001011", s_out);

		// Test case #178
		y_in = 12'b101110010010; //15
		x_in = 12'b000001111111; //178
		#10;
		if(s_out != 12'b110000001100) //if 193
			$display("Error: In 15+178 s_out is %b while it should be 110000001100", s_out);

		// Test case #179
		y_in = 12'b101110010101; //15
		x_in = 12'b000001111111; //179
		#10;
		if(s_out != 12'b110000010010) //if 194
			$display("Error: In 15+179 s_out is %b while it should be 110000010010", s_out);

		// Test case #180
		y_in = 12'b101110100001; //15
		x_in = 12'b000001111111; //180
		#10;
		if(s_out != 12'b110000010101) //if 195
			$display("Error: In 15+180 s_out is %b while it should be 110000010101", s_out);

		// Test case #181
		y_in = 12'b101110100110; //15
		x_in = 12'b000001111111; //181
		#10;
		if(s_out != 12'b110000100001) //if 196
			$display("Error: In 15+181 s_out is %b while it should be 110000100001", s_out);

		// Test case #182
		y_in = 12'b101110111000; //15
		x_in = 12'b000001111111; //182
		#10;
		if(s_out != 12'b110000100110) //if 197
			$display("Error: In 15+182 s_out is %b while it should be 110000100110", s_out);

		// Test case #183
		y_in = 12'b101110111111; //15
		x_in = 12'b000001111111; //183
		#10;
		if(s_out != 12'b110000111000) //if 198
			$display("Error: In 15+183 s_out is %b while it should be 110000111000", s_out);

		// Test case #184
		y_in = 12'b101111000000; //15
		x_in = 12'b000001111111; //184
		#10;
		if(s_out != 12'b110000111111) //if 199
			$display("Error: In 15+184 s_out is %b while it should be 110000111111", s_out);

		// Test case #185
		y_in = 12'b101111000111; //15
		x_in = 12'b000001111111; //185
		#10;
		if(s_out != 12'b110001000000) //if 200
			$display("Error: In 15+185 s_out is %b while it should be 110001000000", s_out);

		// Test case #186
		y_in = 12'b101111011001; //15
		x_in = 12'b000001111111; //186
		#10;
		if(s_out != 12'b110001000111) //if 201
			$display("Error: In 15+186 s_out is %b while it should be 110001000111", s_out);

		// Test case #187
		y_in = 12'b101111011110; //15
		x_in = 12'b000001111111; //187
		#10;
		if(s_out != 12'b110001011001) //if 202
			$display("Error: In 15+187 s_out is %b while it should be 110001011001", s_out);

		// Test case #188
		y_in = 12'b101111101010; //15
		x_in = 12'b000001111111; //188
		#10;
		if(s_out != 12'b110001011110) //if 203
			$display("Error: In 15+188 s_out is %b while it should be 110001011110", s_out);

		// Test case #189
		y_in = 12'b101111101101; //15
		x_in = 12'b000001111111; //189
		#10;
		if(s_out != 12'b110001101010) //if 204
			$display("Error: In 15+189 s_out is %b while it should be 110001101010", s_out);

		// Test case #190
		y_in = 12'b101111110011; //15
		x_in = 12'b000001111111; //190
		#10;
		if(s_out != 12'b110001101101) //if 205
			$display("Error: In 15+190 s_out is %b while it should be 110001101101", s_out);

		// Test case #191
		y_in = 12'b101111110100; //15
		x_in = 12'b000001111111; //191
		#10;
		if(s_out != 12'b110001110011) //if 206
			$display("Error: In 15+191 s_out is %b while it should be 110001110011", s_out);

		// Test case #192
		y_in = 12'b110000001011; //15
		x_in = 12'b000001111111; //192
		#10;
		if(s_out != 12'b110001110100) //if 207
			$display("Error: In 15+192 s_out is %b while it should be 110001110100", s_out);

		// Test case #193
		y_in = 12'b110000001100; //15
		x_in = 12'b000001111111; //193
		#10;
		if(s_out != 12'b110110001010) //if 208
			$display("Error: In 15+193 s_out is %b while it should be 110110001010", s_out);

		// Test case #194
		y_in = 12'b110000010010; //15
		x_in = 12'b000001111111; //194
		#10;
		if(s_out != 12'b110110001101) //if 209
			$display("Error: In 15+194 s_out is %b while it should be 110110001101", s_out);

		// Test case #195
		y_in = 12'b110000010101; //15
		x_in = 12'b000001111111; //195
		#10;
		if(s_out != 12'b110110010011) //if 210
			$display("Error: In 15+195 s_out is %b while it should be 110110010011", s_out);

		// Test case #196
		y_in = 12'b110000100001; //15
		x_in = 12'b000001111111; //196
		#10;
		if(s_out != 12'b110110010100) //if 211
			$display("Error: In 15+196 s_out is %b while it should be 110110010100", s_out);

		// Test case #197
		y_in = 12'b110000100110; //15
		x_in = 12'b000001111111; //197
		#10;
		if(s_out != 12'b110110100000) //if 212
			$display("Error: In 15+197 s_out is %b while it should be 110110100000", s_out);

		// Test case #198
		y_in = 12'b110000111000; //15
		x_in = 12'b000001111111; //198
		#10;
		if(s_out != 12'b110110100111) //if 213
			$display("Error: In 15+198 s_out is %b while it should be 110110100111", s_out);

		// Test case #199
		y_in = 12'b110000111111; //15
		x_in = 12'b000001111111; //199
		#10;
		if(s_out != 12'b110110111001) //if 214
			$display("Error: In 15+199 s_out is %b while it should be 110110111001", s_out);

		// Test case #200
		y_in = 12'b110001000000; //15
		x_in = 12'b000001111111; //200
		#10;
		if(s_out != 12'b110110111110) //if 215
			$display("Error: In 15+200 s_out is %b while it should be 110110111110", s_out);

		// Test case #201
		y_in = 12'b110001000111; //15
		x_in = 12'b000001111111; //201
		#10;
		if(s_out != 12'b110111000001) //if 216
			$display("Error: In 15+201 s_out is %b while it should be 110111000001", s_out);

		// Test case #202
		y_in = 12'b110001011001; //15
		x_in = 12'b000001111111; //202
		#10;
		if(s_out != 12'b110111000110) //if 217
			$display("Error: In 15+202 s_out is %b while it should be 110111000110", s_out);

		// Test case #203
		y_in = 12'b110001011110; //15
		x_in = 12'b000001111111; //203
		#10;
		if(s_out != 12'b110111011000) //if 218
			$display("Error: In 15+203 s_out is %b while it should be 110111011000", s_out);

		// Test case #204
		y_in = 12'b110001101010; //15
		x_in = 12'b000001111111; //204
		#10;
		if(s_out != 12'b110111011111) //if 219
			$display("Error: In 15+204 s_out is %b while it should be 110111011111", s_out);

		// Test case #205
		y_in = 12'b110001101101; //15
		x_in = 12'b000001111111; //205
		#10;
		if(s_out != 12'b110111101011) //if 220
			$display("Error: In 15+205 s_out is %b while it should be 110111101011", s_out);

		// Test case #206
		y_in = 12'b110001110011; //15
		x_in = 12'b000001111111; //206
		#10;
		if(s_out != 12'b110111101100) //if 221
			$display("Error: In 15+206 s_out is %b while it should be 110111101100", s_out);

		// Test case #207
		y_in = 12'b110001110100; //15
		x_in = 12'b000001111111; //207
		#10;
		if(s_out != 12'b110111110010) //if 222
			$display("Error: In 15+207 s_out is %b while it should be 110111110010", s_out);

		// Test case #208
		y_in = 12'b110110001010; //15
		x_in = 12'b000001111111; //208
		#10;
		if(s_out != 12'b110111110101) //if 223
			$display("Error: In 15+208 s_out is %b while it should be 110111110101", s_out);

		// Test case #209
		y_in = 12'b110110001101; //15
		x_in = 12'b000001111111; //209
		#10;
		if(s_out != 12'b111010001001) //if 224
			$display("Error: In 15+209 s_out is %b while it should be 111010001001", s_out);

		// Test case #210
		y_in = 12'b110110010011; //15
		x_in = 12'b000001111111; //210
		#10;
		if(s_out != 12'b111010001110) //if 225
			$display("Error: In 15+210 s_out is %b while it should be 111010001110", s_out);

		// Test case #211
		y_in = 12'b110110010100; //15
		x_in = 12'b000001111111; //211
		#10;
		if(s_out != 12'b111010010000) //if 226
			$display("Error: In 15+211 s_out is %b while it should be 111010010000", s_out);

		// Test case #212
		y_in = 12'b110110100000; //15
		x_in = 12'b000001111111; //212
		#10;
		if(s_out != 12'b111010010111) //if 227
			$display("Error: In 15+212 s_out is %b while it should be 111010010111", s_out);

		// Test case #213
		y_in = 12'b110110100111; //15
		x_in = 12'b000001111111; //213
		#10;
		if(s_out != 12'b111010100011) //if 228
			$display("Error: In 15+213 s_out is %b while it should be 111010100011", s_out);

		// Test case #214
		y_in = 12'b110110111001; //15
		x_in = 12'b000001111111; //214
		#10;
		if(s_out != 12'b111010100100) //if 229
			$display("Error: In 15+214 s_out is %b while it should be 111010100100", s_out);

		// Test case #215
		y_in = 12'b110110111110; //15
		x_in = 12'b000001111111; //215
		#10;
		if(s_out != 12'b111010111010) //if 230
			$display("Error: In 15+215 s_out is %b while it should be 111010111010", s_out);

		// Test case #216
		y_in = 12'b110111000001; //15
		x_in = 12'b000001111111; //216
		#10;
		if(s_out != 12'b111010111101) //if 231
			$display("Error: In 15+216 s_out is %b while it should be 111010111101", s_out);

		// Test case #217
		y_in = 12'b110111000110; //15
		x_in = 12'b000001111111; //217
		#10;
		if(s_out != 12'b111011000010) //if 232
			$display("Error: In 15+217 s_out is %b while it should be 111011000010", s_out);

		// Test case #218
		y_in = 12'b110111011000; //15
		x_in = 12'b000001111111; //218
		#10;
		if(s_out != 12'b111011000101) //if 233
			$display("Error: In 15+218 s_out is %b while it should be 111011000101", s_out);

		// Test case #219
		y_in = 12'b110111011111; //15
		x_in = 12'b000001111111; //219
		#10;
		if(s_out != 12'b111011011011) //if 234
			$display("Error: In 15+219 s_out is %b while it should be 111011011011", s_out);

		// Test case #220
		y_in = 12'b110111101011; //15
		x_in = 12'b000001111111; //220
		#10;
		if(s_out != 12'b111011011100) //if 235
			$display("Error: In 15+220 s_out is %b while it should be 111011011100", s_out);

		// Test case #221
		y_in = 12'b110111101100; //15
		x_in = 12'b000001111111; //221
		#10;
		if(s_out != 12'b111011101000) //if 236
			$display("Error: In 15+221 s_out is %b while it should be 111011101000", s_out);

		// Test case #222
		y_in = 12'b110111110010; //15
		x_in = 12'b000001111111; //222
		#10;
		if(s_out != 12'b111011101111) //if 237
			$display("Error: In 15+222 s_out is %b while it should be 111011101111", s_out);

		// Test case #223
		y_in = 12'b110111110101; //15
		x_in = 12'b000001111111; //223
		#10;
		if(s_out != 12'b111011110001) //if 238
			$display("Error: In 15+223 s_out is %b while it should be 111011110001", s_out);

		// Test case #224
		y_in = 12'b111010001001; //15
		x_in = 12'b000001111111; //224
		#10;
		if(s_out != 12'b111011110110) //if 239
			$display("Error: In 15+224 s_out is %b while it should be 111011110110", s_out);

		// Test case #225
		y_in = 12'b111010001110; //15
		x_in = 12'b000001111111; //225
		#10;
		if(s_out != 12'b111100001000) //if 240
			$display("Error: In 15+225 s_out is %b while it should be 111100001000", s_out);

		// Test case #226
		y_in = 12'b111010010000; //15
		x_in = 12'b000001111111; //226
		#10;
		if(s_out != 12'b111100001111) //if 241
			$display("Error: In 15+226 s_out is %b while it should be 111100001111", s_out);

		// Test case #227
		y_in = 12'b111010010111; //15
		x_in = 12'b000001111111; //227
		#10;
		if(s_out != 12'b111100010001) //if 242
			$display("Error: In 15+227 s_out is %b while it should be 111100010001", s_out);

		// Test case #228
		y_in = 12'b111010100011; //15
		x_in = 12'b000001111111; //228
		#10;
		if(s_out != 12'b111100010110) //if 243
			$display("Error: In 15+228 s_out is %b while it should be 111100010110", s_out);

		// Test case #229
		y_in = 12'b111010100100; //15
		x_in = 12'b000001111111; //229
		#10;
		if(s_out != 12'b111100100010) //if 244
			$display("Error: In 15+229 s_out is %b while it should be 111100100010", s_out);

		// Test case #230
		y_in = 12'b111010111010; //15
		x_in = 12'b000001111111; //230
		#10;
		if(s_out != 12'b111100100101) //if 245
			$display("Error: In 15+230 s_out is %b while it should be 111100100101", s_out);

		// Test case #231
		y_in = 12'b111010111101; //15
		x_in = 12'b000001111111; //231
		#10;
		if(s_out != 12'b111100111011) //if 246
			$display("Error: In 15+231 s_out is %b while it should be 111100111011", s_out);

		// Test case #232
		y_in = 12'b111011000010; //15
		x_in = 12'b000001111111; //232
		#10;
		if(s_out != 12'b111100111100) //if 247
			$display("Error: In 15+232 s_out is %b while it should be 111100111100", s_out);

		// Test case #233
		y_in = 12'b111011000101; //15
		x_in = 12'b000001111111; //233
		#10;
		if(s_out != 12'b111101000011) //if 248
			$display("Error: In 15+233 s_out is %b while it should be 111101000011", s_out);

		// Test case #234
		y_in = 12'b111011011011; //15
		x_in = 12'b000001111111; //234
		#10;
		if(s_out != 12'b111101000100) //if 249
			$display("Error: In 15+234 s_out is %b while it should be 111101000100", s_out);

		// Test case #235
		y_in = 12'b111011011100; //15
		x_in = 12'b000001111111; //235
		#10;
		if(s_out != 12'b111101011010) //if 250
			$display("Error: In 15+235 s_out is %b while it should be 111101011010", s_out);

		// Test case #236
		y_in = 12'b111011101000; //15
		x_in = 12'b000001111111; //236
		#10;
		if(s_out != 12'b111101011101) //if 251
			$display("Error: In 15+236 s_out is %b while it should be 111101011101", s_out);

		// Test case #237
		y_in = 12'b111011101111; //15
		x_in = 12'b000001111111; //237
		#10;
		if(s_out != 12'b111101101001) //if 252
			$display("Error: In 15+237 s_out is %b while it should be 111101101001", s_out);

		// Test case #238
		y_in = 12'b111011110001; //15
		x_in = 12'b000001111111; //238
		#10;
		if(s_out != 12'b111101101110) //if 253
			$display("Error: In 15+238 s_out is %b while it should be 111101101110", s_out);

		// Test case #239
		y_in = 12'b111011110110; //15
		x_in = 12'b000001111111; //239
		#10;
		if(s_out != 12'b111101110000) //if 254
			$display("Error: In 15+239 s_out is %b while it should be 111101110000", s_out);

		// Test case #240
		y_in = 12'b111100001000; //15
		x_in = 12'b000001111111; //240
		#10;
		if(s_out != 12'b111101110111) //if 255
			$display("Error: In 15+240 s_out is %b while it should be 111101110111", s_out);

		// Test case #241
		y_in = 12'b000000000000; //16
		x_in = 12'b000110000001; //0
		#10;
		if(s_out != 12'b000110000001) //if 16
			$display("Error: In 16+0 s_out is %b while it should be 000110000001", s_out);

		// Test case #242
		y_in = 12'b000000000111; //16
		x_in = 12'b000110000001; //1
		#10;
		if(s_out != 12'b000110000110) //if 17
			$display("Error: In 16+1 s_out is %b while it should be 000110000110", s_out);

		// Test case #243
		y_in = 12'b000000011001; //16
		x_in = 12'b000110000001; //2
		#10;
		if(s_out != 12'b000110011000) //if 18
			$display("Error: In 16+2 s_out is %b while it should be 000110011000", s_out);

		// Test case #244
		y_in = 12'b000000011110; //16
		x_in = 12'b000110000001; //3
		#10;
		if(s_out != 12'b000110011111) //if 19
			$display("Error: In 16+3 s_out is %b while it should be 000110011111", s_out);

		// Test case #245
		y_in = 12'b000000101010; //16
		x_in = 12'b000110000001; //4
		#10;
		if(s_out != 12'b000110101011) //if 20
			$display("Error: In 16+4 s_out is %b while it should be 000110101011", s_out);

		// Test case #246
		y_in = 12'b000000101101; //16
		x_in = 12'b000110000001; //5
		#10;
		if(s_out != 12'b000110101100) //if 21
			$display("Error: In 16+5 s_out is %b while it should be 000110101100", s_out);

		// Test case #247
		y_in = 12'b000000110011; //16
		x_in = 12'b000110000001; //6
		#10;
		if(s_out != 12'b000110110010) //if 22
			$display("Error: In 16+6 s_out is %b while it should be 000110110010", s_out);

		// Test case #248
		y_in = 12'b000000110100; //16
		x_in = 12'b000110000001; //7
		#10;
		if(s_out != 12'b000110110101) //if 23
			$display("Error: In 16+7 s_out is %b while it should be 000110110101", s_out);

		// Test case #249
		y_in = 12'b000001001011; //16
		x_in = 12'b000110000001; //8
		#10;
		if(s_out != 12'b000111001010) //if 24
			$display("Error: In 16+8 s_out is %b while it should be 000111001010", s_out);

		// Test case #250
		y_in = 12'b000001001100; //16
		x_in = 12'b000110000001; //9
		#10;
		if(s_out != 12'b000111001101) //if 25
			$display("Error: In 16+9 s_out is %b while it should be 000111001101", s_out);

		// Test case #251
		y_in = 12'b000001010010; //16
		x_in = 12'b000110000001; //10
		#10;
		if(s_out != 12'b000111010011) //if 26
			$display("Error: In 16+10 s_out is %b while it should be 000111010011", s_out);

		// Test case #252
		y_in = 12'b000001010101; //16
		x_in = 12'b000110000001; //11
		#10;
		if(s_out != 12'b000111010100) //if 27
			$display("Error: In 16+11 s_out is %b while it should be 000111010100", s_out);

		// Test case #253
		y_in = 12'b000001100001; //16
		x_in = 12'b000110000001; //12
		#10;
		if(s_out != 12'b000111100000) //if 28
			$display("Error: In 16+12 s_out is %b while it should be 000111100000", s_out);

		// Test case #254
		y_in = 12'b000001100110; //16
		x_in = 12'b000110000001; //13
		#10;
		if(s_out != 12'b000111100111) //if 29
			$display("Error: In 16+13 s_out is %b while it should be 000111100111", s_out);

		// Test case #255
		y_in = 12'b000001111000; //16
		x_in = 12'b000110000001; //14
		#10;
		if(s_out != 12'b000111111001) //if 30
			$display("Error: In 16+14 s_out is %b while it should be 000111111001", s_out);

		// Test case #256
		y_in = 12'b000001111111; //16
		x_in = 12'b000110000001; //15
		#10;
		if(s_out != 12'b000111111110) //if 31
			$display("Error: In 16+15 s_out is %b while it should be 000111111110", s_out);

		// Test case #257
		y_in = 12'b000110000001; //16
		x_in = 12'b000110000001; //16
		#10;
		if(s_out != 12'b001010000010) //if 32
			$display("Error: In 16+16 s_out is %b while it should be 001010000010", s_out);

		// Test case #258
		y_in = 12'b000110000110; //16
		x_in = 12'b000110000001; //17
		#10;
		if(s_out != 12'b001010000101) //if 33
			$display("Error: In 16+17 s_out is %b while it should be 001010000101", s_out);

		// Test case #259
		y_in = 12'b000110011000; //16
		x_in = 12'b000110000001; //18
		#10;
		if(s_out != 12'b001010011011) //if 34
			$display("Error: In 16+18 s_out is %b while it should be 001010011011", s_out);

		// Test case #260
		y_in = 12'b000110011111; //16
		x_in = 12'b000110000001; //19
		#10;
		if(s_out != 12'b001010011100) //if 35
			$display("Error: In 16+19 s_out is %b while it should be 001010011100", s_out);

		// Test case #261
		y_in = 12'b000110101011; //16
		x_in = 12'b000110000001; //20
		#10;
		if(s_out != 12'b001010101000) //if 36
			$display("Error: In 16+20 s_out is %b while it should be 001010101000", s_out);

		// Test case #262
		y_in = 12'b000110101100; //16
		x_in = 12'b000110000001; //21
		#10;
		if(s_out != 12'b001010101111) //if 37
			$display("Error: In 16+21 s_out is %b while it should be 001010101111", s_out);

		// Test case #263
		y_in = 12'b000110110010; //16
		x_in = 12'b000110000001; //22
		#10;
		if(s_out != 12'b001010110001) //if 38
			$display("Error: In 16+22 s_out is %b while it should be 001010110001", s_out);

		// Test case #264
		y_in = 12'b000110110101; //16
		x_in = 12'b000110000001; //23
		#10;
		if(s_out != 12'b001010110110) //if 39
			$display("Error: In 16+23 s_out is %b while it should be 001010110110", s_out);

		// Test case #265
		y_in = 12'b000111001010; //16
		x_in = 12'b000110000001; //24
		#10;
		if(s_out != 12'b001011001001) //if 40
			$display("Error: In 16+24 s_out is %b while it should be 001011001001", s_out);

		// Test case #266
		y_in = 12'b000111001101; //16
		x_in = 12'b000110000001; //25
		#10;
		if(s_out != 12'b001011001110) //if 41
			$display("Error: In 16+25 s_out is %b while it should be 001011001110", s_out);

		// Test case #267
		y_in = 12'b000111010011; //16
		x_in = 12'b000110000001; //26
		#10;
		if(s_out != 12'b001011010000) //if 42
			$display("Error: In 16+26 s_out is %b while it should be 001011010000", s_out);

		// Test case #268
		y_in = 12'b000111010100; //16
		x_in = 12'b000110000001; //27
		#10;
		if(s_out != 12'b001011010111) //if 43
			$display("Error: In 16+27 s_out is %b while it should be 001011010111", s_out);

		// Test case #269
		y_in = 12'b000111100000; //16
		x_in = 12'b000110000001; //28
		#10;
		if(s_out != 12'b001011100011) //if 44
			$display("Error: In 16+28 s_out is %b while it should be 001011100011", s_out);

		// Test case #270
		y_in = 12'b000111100111; //16
		x_in = 12'b000110000001; //29
		#10;
		if(s_out != 12'b001011100100) //if 45
			$display("Error: In 16+29 s_out is %b while it should be 001011100100", s_out);

		// Test case #271
		y_in = 12'b000111111001; //16
		x_in = 12'b000110000001; //30
		#10;
		if(s_out != 12'b001011111010) //if 46
			$display("Error: In 16+30 s_out is %b while it should be 001011111010", s_out);

		// Test case #272
		y_in = 12'b000111111110; //16
		x_in = 12'b000110000001; //31
		#10;
		if(s_out != 12'b001011111101) //if 47
			$display("Error: In 16+31 s_out is %b while it should be 001011111101", s_out);

		// Test case #273
		y_in = 12'b001010000010; //16
		x_in = 12'b000110000001; //32
		#10;
		if(s_out != 12'b001100000011) //if 48
			$display("Error: In 16+32 s_out is %b while it should be 001100000011", s_out);

		// Test case #274
		y_in = 12'b001010000101; //16
		x_in = 12'b000110000001; //33
		#10;
		if(s_out != 12'b001100000100) //if 49
			$display("Error: In 16+33 s_out is %b while it should be 001100000100", s_out);

		// Test case #275
		y_in = 12'b001010011011; //16
		x_in = 12'b000110000001; //34
		#10;
		if(s_out != 12'b001100011010) //if 50
			$display("Error: In 16+34 s_out is %b while it should be 001100011010", s_out);

		// Test case #276
		y_in = 12'b001010011100; //16
		x_in = 12'b000110000001; //35
		#10;
		if(s_out != 12'b001100011101) //if 51
			$display("Error: In 16+35 s_out is %b while it should be 001100011101", s_out);

		// Test case #277
		y_in = 12'b001010101000; //16
		x_in = 12'b000110000001; //36
		#10;
		if(s_out != 12'b001100101001) //if 52
			$display("Error: In 16+36 s_out is %b while it should be 001100101001", s_out);

		// Test case #278
		y_in = 12'b001010101111; //16
		x_in = 12'b000110000001; //37
		#10;
		if(s_out != 12'b001100101110) //if 53
			$display("Error: In 16+37 s_out is %b while it should be 001100101110", s_out);

		// Test case #279
		y_in = 12'b001010110001; //16
		x_in = 12'b000110000001; //38
		#10;
		if(s_out != 12'b001100110000) //if 54
			$display("Error: In 16+38 s_out is %b while it should be 001100110000", s_out);

		// Test case #280
		y_in = 12'b001010110110; //16
		x_in = 12'b000110000001; //39
		#10;
		if(s_out != 12'b001100110111) //if 55
			$display("Error: In 16+39 s_out is %b while it should be 001100110111", s_out);

		// Test case #281
		y_in = 12'b001011001001; //16
		x_in = 12'b000110000001; //40
		#10;
		if(s_out != 12'b001101001000) //if 56
			$display("Error: In 16+40 s_out is %b while it should be 001101001000", s_out);

		// Test case #282
		y_in = 12'b001011001110; //16
		x_in = 12'b000110000001; //41
		#10;
		if(s_out != 12'b001101001111) //if 57
			$display("Error: In 16+41 s_out is %b while it should be 001101001111", s_out);

		// Test case #283
		y_in = 12'b001011010000; //16
		x_in = 12'b000110000001; //42
		#10;
		if(s_out != 12'b001101010001) //if 58
			$display("Error: In 16+42 s_out is %b while it should be 001101010001", s_out);

		// Test case #284
		y_in = 12'b001011010111; //16
		x_in = 12'b000110000001; //43
		#10;
		if(s_out != 12'b001101010110) //if 59
			$display("Error: In 16+43 s_out is %b while it should be 001101010110", s_out);

		// Test case #285
		y_in = 12'b001011100011; //16
		x_in = 12'b000110000001; //44
		#10;
		if(s_out != 12'b001101100010) //if 60
			$display("Error: In 16+44 s_out is %b while it should be 001101100010", s_out);

		// Test case #286
		y_in = 12'b001011100100; //16
		x_in = 12'b000110000001; //45
		#10;
		if(s_out != 12'b001101100101) //if 61
			$display("Error: In 16+45 s_out is %b while it should be 001101100101", s_out);

		// Test case #287
		y_in = 12'b001011111010; //16
		x_in = 12'b000110000001; //46
		#10;
		if(s_out != 12'b001101111011) //if 62
			$display("Error: In 16+46 s_out is %b while it should be 001101111011", s_out);

		// Test case #288
		y_in = 12'b001011111101; //16
		x_in = 12'b000110000001; //47
		#10;
		if(s_out != 12'b001101111100) //if 63
			$display("Error: In 16+47 s_out is %b while it should be 001101111100", s_out);

		// Test case #289
		y_in = 12'b001100000011; //16
		x_in = 12'b000110000001; //48
		#10;
		if(s_out != 12'b010010000011) //if 64
			$display("Error: In 16+48 s_out is %b while it should be 010010000011", s_out);

		// Test case #290
		y_in = 12'b001100000100; //16
		x_in = 12'b000110000001; //49
		#10;
		if(s_out != 12'b010010000100) //if 65
			$display("Error: In 16+49 s_out is %b while it should be 010010000100", s_out);

		// Test case #291
		y_in = 12'b001100011010; //16
		x_in = 12'b000110000001; //50
		#10;
		if(s_out != 12'b010010011010) //if 66
			$display("Error: In 16+50 s_out is %b while it should be 010010011010", s_out);

		// Test case #292
		y_in = 12'b001100011101; //16
		x_in = 12'b000110000001; //51
		#10;
		if(s_out != 12'b010010011101) //if 67
			$display("Error: In 16+51 s_out is %b while it should be 010010011101", s_out);

		// Test case #293
		y_in = 12'b001100101001; //16
		x_in = 12'b000110000001; //52
		#10;
		if(s_out != 12'b010010101001) //if 68
			$display("Error: In 16+52 s_out is %b while it should be 010010101001", s_out);

		// Test case #294
		y_in = 12'b001100101110; //16
		x_in = 12'b000110000001; //53
		#10;
		if(s_out != 12'b010010101110) //if 69
			$display("Error: In 16+53 s_out is %b while it should be 010010101110", s_out);

		// Test case #295
		y_in = 12'b001100110000; //16
		x_in = 12'b000110000001; //54
		#10;
		if(s_out != 12'b010010110000) //if 70
			$display("Error: In 16+54 s_out is %b while it should be 010010110000", s_out);

		// Test case #296
		y_in = 12'b001100110111; //16
		x_in = 12'b000110000001; //55
		#10;
		if(s_out != 12'b010010110111) //if 71
			$display("Error: In 16+55 s_out is %b while it should be 010010110111", s_out);

		// Test case #297
		y_in = 12'b001101001000; //16
		x_in = 12'b000110000001; //56
		#10;
		if(s_out != 12'b010011001000) //if 72
			$display("Error: In 16+56 s_out is %b while it should be 010011001000", s_out);

		// Test case #298
		y_in = 12'b001101001111; //16
		x_in = 12'b000110000001; //57
		#10;
		if(s_out != 12'b010011001111) //if 73
			$display("Error: In 16+57 s_out is %b while it should be 010011001111", s_out);

		// Test case #299
		y_in = 12'b001101010001; //16
		x_in = 12'b000110000001; //58
		#10;
		if(s_out != 12'b010011010001) //if 74
			$display("Error: In 16+58 s_out is %b while it should be 010011010001", s_out);

		// Test case #300
		y_in = 12'b001101010110; //16
		x_in = 12'b000110000001; //59
		#10;
		if(s_out != 12'b010011010110) //if 75
			$display("Error: In 16+59 s_out is %b while it should be 010011010110", s_out);

		// Test case #301
		y_in = 12'b001101100010; //16
		x_in = 12'b000110000001; //60
		#10;
		if(s_out != 12'b010011100010) //if 76
			$display("Error: In 16+60 s_out is %b while it should be 010011100010", s_out);

		// Test case #302
		y_in = 12'b001101100101; //16
		x_in = 12'b000110000001; //61
		#10;
		if(s_out != 12'b010011100101) //if 77
			$display("Error: In 16+61 s_out is %b while it should be 010011100101", s_out);

		// Test case #303
		y_in = 12'b001101111011; //16
		x_in = 12'b000110000001; //62
		#10;
		if(s_out != 12'b010011111011) //if 78
			$display("Error: In 16+62 s_out is %b while it should be 010011111011", s_out);

		// Test case #304
		y_in = 12'b001101111100; //16
		x_in = 12'b000110000001; //63
		#10;
		if(s_out != 12'b010011111100) //if 79
			$display("Error: In 16+63 s_out is %b while it should be 010011111100", s_out);

		// Test case #305
		y_in = 12'b010010000011; //16
		x_in = 12'b000110000001; //64
		#10;
		if(s_out != 12'b010100000010) //if 80
			$display("Error: In 16+64 s_out is %b while it should be 010100000010", s_out);

		// Test case #306
		y_in = 12'b010010000100; //16
		x_in = 12'b000110000001; //65
		#10;
		if(s_out != 12'b010100000101) //if 81
			$display("Error: In 16+65 s_out is %b while it should be 010100000101", s_out);

		// Test case #307
		y_in = 12'b010010011010; //16
		x_in = 12'b000110000001; //66
		#10;
		if(s_out != 12'b010100011011) //if 82
			$display("Error: In 16+66 s_out is %b while it should be 010100011011", s_out);

		// Test case #308
		y_in = 12'b010010011101; //16
		x_in = 12'b000110000001; //67
		#10;
		if(s_out != 12'b010100011100) //if 83
			$display("Error: In 16+67 s_out is %b while it should be 010100011100", s_out);

		// Test case #309
		y_in = 12'b010010101001; //16
		x_in = 12'b000110000001; //68
		#10;
		if(s_out != 12'b010100101000) //if 84
			$display("Error: In 16+68 s_out is %b while it should be 010100101000", s_out);

		// Test case #310
		y_in = 12'b010010101110; //16
		x_in = 12'b000110000001; //69
		#10;
		if(s_out != 12'b010100101111) //if 85
			$display("Error: In 16+69 s_out is %b while it should be 010100101111", s_out);

		// Test case #311
		y_in = 12'b010010110000; //16
		x_in = 12'b000110000001; //70
		#10;
		if(s_out != 12'b010100110001) //if 86
			$display("Error: In 16+70 s_out is %b while it should be 010100110001", s_out);

		// Test case #312
		y_in = 12'b010010110111; //16
		x_in = 12'b000110000001; //71
		#10;
		if(s_out != 12'b010100110110) //if 87
			$display("Error: In 16+71 s_out is %b while it should be 010100110110", s_out);

		// Test case #313
		y_in = 12'b010011001000; //16
		x_in = 12'b000110000001; //72
		#10;
		if(s_out != 12'b010101001001) //if 88
			$display("Error: In 16+72 s_out is %b while it should be 010101001001", s_out);

		// Test case #314
		y_in = 12'b010011001111; //16
		x_in = 12'b000110000001; //73
		#10;
		if(s_out != 12'b010101001110) //if 89
			$display("Error: In 16+73 s_out is %b while it should be 010101001110", s_out);

		// Test case #315
		y_in = 12'b010011010001; //16
		x_in = 12'b000110000001; //74
		#10;
		if(s_out != 12'b010101010000) //if 90
			$display("Error: In 16+74 s_out is %b while it should be 010101010000", s_out);

		// Test case #316
		y_in = 12'b010011010110; //16
		x_in = 12'b000110000001; //75
		#10;
		if(s_out != 12'b010101010111) //if 91
			$display("Error: In 16+75 s_out is %b while it should be 010101010111", s_out);

		// Test case #317
		y_in = 12'b010011100010; //16
		x_in = 12'b000110000001; //76
		#10;
		if(s_out != 12'b010101100011) //if 92
			$display("Error: In 16+76 s_out is %b while it should be 010101100011", s_out);

		// Test case #318
		y_in = 12'b010011100101; //16
		x_in = 12'b000110000001; //77
		#10;
		if(s_out != 12'b010101100100) //if 93
			$display("Error: In 16+77 s_out is %b while it should be 010101100100", s_out);

		// Test case #319
		y_in = 12'b010011111011; //16
		x_in = 12'b000110000001; //78
		#10;
		if(s_out != 12'b010101111010) //if 94
			$display("Error: In 16+78 s_out is %b while it should be 010101111010", s_out);

		// Test case #320
		y_in = 12'b010011111100; //16
		x_in = 12'b000110000001; //79
		#10;
		if(s_out != 12'b010101111101) //if 95
			$display("Error: In 16+79 s_out is %b while it should be 010101111101", s_out);

		// Test case #321
		y_in = 12'b010100000010; //16
		x_in = 12'b000110000001; //80
		#10;
		if(s_out != 12'b011000000001) //if 96
			$display("Error: In 16+80 s_out is %b while it should be 011000000001", s_out);

		// Test case #322
		y_in = 12'b010100000101; //16
		x_in = 12'b000110000001; //81
		#10;
		if(s_out != 12'b011000000110) //if 97
			$display("Error: In 16+81 s_out is %b while it should be 011000000110", s_out);

		// Test case #323
		y_in = 12'b010100011011; //16
		x_in = 12'b000110000001; //82
		#10;
		if(s_out != 12'b011000011000) //if 98
			$display("Error: In 16+82 s_out is %b while it should be 011000011000", s_out);

		// Test case #324
		y_in = 12'b010100011100; //16
		x_in = 12'b000110000001; //83
		#10;
		if(s_out != 12'b011000011111) //if 99
			$display("Error: In 16+83 s_out is %b while it should be 011000011111", s_out);

		// Test case #325
		y_in = 12'b010100101000; //16
		x_in = 12'b000110000001; //84
		#10;
		if(s_out != 12'b011000101011) //if 100
			$display("Error: In 16+84 s_out is %b while it should be 011000101011", s_out);

		// Test case #326
		y_in = 12'b010100101111; //16
		x_in = 12'b000110000001; //85
		#10;
		if(s_out != 12'b011000101100) //if 101
			$display("Error: In 16+85 s_out is %b while it should be 011000101100", s_out);

		// Test case #327
		y_in = 12'b010100110001; //16
		x_in = 12'b000110000001; //86
		#10;
		if(s_out != 12'b011000110010) //if 102
			$display("Error: In 16+86 s_out is %b while it should be 011000110010", s_out);

		// Test case #328
		y_in = 12'b010100110110; //16
		x_in = 12'b000110000001; //87
		#10;
		if(s_out != 12'b011000110101) //if 103
			$display("Error: In 16+87 s_out is %b while it should be 011000110101", s_out);

		// Test case #329
		y_in = 12'b010101001001; //16
		x_in = 12'b000110000001; //88
		#10;
		if(s_out != 12'b011001001010) //if 104
			$display("Error: In 16+88 s_out is %b while it should be 011001001010", s_out);

		// Test case #330
		y_in = 12'b010101001110; //16
		x_in = 12'b000110000001; //89
		#10;
		if(s_out != 12'b011001001101) //if 105
			$display("Error: In 16+89 s_out is %b while it should be 011001001101", s_out);

		// Test case #331
		y_in = 12'b010101010000; //16
		x_in = 12'b000110000001; //90
		#10;
		if(s_out != 12'b011001010011) //if 106
			$display("Error: In 16+90 s_out is %b while it should be 011001010011", s_out);

		// Test case #332
		y_in = 12'b010101010111; //16
		x_in = 12'b000110000001; //91
		#10;
		if(s_out != 12'b011001010100) //if 107
			$display("Error: In 16+91 s_out is %b while it should be 011001010100", s_out);

		// Test case #333
		y_in = 12'b010101100011; //16
		x_in = 12'b000110000001; //92
		#10;
		if(s_out != 12'b011001100000) //if 108
			$display("Error: In 16+92 s_out is %b while it should be 011001100000", s_out);

		// Test case #334
		y_in = 12'b010101100100; //16
		x_in = 12'b000110000001; //93
		#10;
		if(s_out != 12'b011001100111) //if 109
			$display("Error: In 16+93 s_out is %b while it should be 011001100111", s_out);

		// Test case #335
		y_in = 12'b010101111010; //16
		x_in = 12'b000110000001; //94
		#10;
		if(s_out != 12'b011001111001) //if 110
			$display("Error: In 16+94 s_out is %b while it should be 011001111001", s_out);

		// Test case #336
		y_in = 12'b010101111101; //16
		x_in = 12'b000110000001; //95
		#10;
		if(s_out != 12'b011001111110) //if 111
			$display("Error: In 16+95 s_out is %b while it should be 011001111110", s_out);

		// Test case #337
		y_in = 12'b011000000001; //16
		x_in = 12'b000110000001; //96
		#10;
		if(s_out != 12'b011110000000) //if 112
			$display("Error: In 16+96 s_out is %b while it should be 011110000000", s_out);

		// Test case #338
		y_in = 12'b011000000110; //16
		x_in = 12'b000110000001; //97
		#10;
		if(s_out != 12'b011110000111) //if 113
			$display("Error: In 16+97 s_out is %b while it should be 011110000111", s_out);

		// Test case #339
		y_in = 12'b011000011000; //16
		x_in = 12'b000110000001; //98
		#10;
		if(s_out != 12'b011110011001) //if 114
			$display("Error: In 16+98 s_out is %b while it should be 011110011001", s_out);

		// Test case #340
		y_in = 12'b011000011111; //16
		x_in = 12'b000110000001; //99
		#10;
		if(s_out != 12'b011110011110) //if 115
			$display("Error: In 16+99 s_out is %b while it should be 011110011110", s_out);

		// Test case #341
		y_in = 12'b011000101011; //16
		x_in = 12'b000110000001; //100
		#10;
		if(s_out != 12'b011110101010) //if 116
			$display("Error: In 16+100 s_out is %b while it should be 011110101010", s_out);

		// Test case #342
		y_in = 12'b011000101100; //16
		x_in = 12'b000110000001; //101
		#10;
		if(s_out != 12'b011110101101) //if 117
			$display("Error: In 16+101 s_out is %b while it should be 011110101101", s_out);

		// Test case #343
		y_in = 12'b011000110010; //16
		x_in = 12'b000110000001; //102
		#10;
		if(s_out != 12'b011110110011) //if 118
			$display("Error: In 16+102 s_out is %b while it should be 011110110011", s_out);

		// Test case #344
		y_in = 12'b011000110101; //16
		x_in = 12'b000110000001; //103
		#10;
		if(s_out != 12'b011110110100) //if 119
			$display("Error: In 16+103 s_out is %b while it should be 011110110100", s_out);

		// Test case #345
		y_in = 12'b011001001010; //16
		x_in = 12'b000110000001; //104
		#10;
		if(s_out != 12'b011111001011) //if 120
			$display("Error: In 16+104 s_out is %b while it should be 011111001011", s_out);

		// Test case #346
		y_in = 12'b011001001101; //16
		x_in = 12'b000110000001; //105
		#10;
		if(s_out != 12'b011111001100) //if 121
			$display("Error: In 16+105 s_out is %b while it should be 011111001100", s_out);

		// Test case #347
		y_in = 12'b011001010011; //16
		x_in = 12'b000110000001; //106
		#10;
		if(s_out != 12'b011111010010) //if 122
			$display("Error: In 16+106 s_out is %b while it should be 011111010010", s_out);

		// Test case #348
		y_in = 12'b011001010100; //16
		x_in = 12'b000110000001; //107
		#10;
		if(s_out != 12'b011111010101) //if 123
			$display("Error: In 16+107 s_out is %b while it should be 011111010101", s_out);

		// Test case #349
		y_in = 12'b011001100000; //16
		x_in = 12'b000110000001; //108
		#10;
		if(s_out != 12'b011111100001) //if 124
			$display("Error: In 16+108 s_out is %b while it should be 011111100001", s_out);

		// Test case #350
		y_in = 12'b011001100111; //16
		x_in = 12'b000110000001; //109
		#10;
		if(s_out != 12'b011111100110) //if 125
			$display("Error: In 16+109 s_out is %b while it should be 011111100110", s_out);

		// Test case #351
		y_in = 12'b011001111001; //16
		x_in = 12'b000110000001; //110
		#10;
		if(s_out != 12'b011111111000) //if 126
			$display("Error: In 16+110 s_out is %b while it should be 011111111000", s_out);

		// Test case #352
		y_in = 12'b011001111110; //16
		x_in = 12'b000110000001; //111
		#10;
		if(s_out != 12'b011111111111) //if 127
			$display("Error: In 16+111 s_out is %b while it should be 011111111111", s_out);

		// Test case #353
		y_in = 12'b011110000000; //16
		x_in = 12'b000110000001; //112
		#10;
		if(s_out != 12'b100010001000) //if 128
			$display("Error: In 16+112 s_out is %b while it should be 100010001000", s_out);

		// Test case #354
		y_in = 12'b011110000111; //16
		x_in = 12'b000110000001; //113
		#10;
		if(s_out != 12'b100010001111) //if 129
			$display("Error: In 16+113 s_out is %b while it should be 100010001111", s_out);

		// Test case #355
		y_in = 12'b011110011001; //16
		x_in = 12'b000110000001; //114
		#10;
		if(s_out != 12'b100010010001) //if 130
			$display("Error: In 16+114 s_out is %b while it should be 100010010001", s_out);

		// Test case #356
		y_in = 12'b011110011110; //16
		x_in = 12'b000110000001; //115
		#10;
		if(s_out != 12'b100010010110) //if 131
			$display("Error: In 16+115 s_out is %b while it should be 100010010110", s_out);

		// Test case #357
		y_in = 12'b011110101010; //16
		x_in = 12'b000110000001; //116
		#10;
		if(s_out != 12'b100010100010) //if 132
			$display("Error: In 16+116 s_out is %b while it should be 100010100010", s_out);

		// Test case #358
		y_in = 12'b011110101101; //16
		x_in = 12'b000110000001; //117
		#10;
		if(s_out != 12'b100010100101) //if 133
			$display("Error: In 16+117 s_out is %b while it should be 100010100101", s_out);

		// Test case #359
		y_in = 12'b011110110011; //16
		x_in = 12'b000110000001; //118
		#10;
		if(s_out != 12'b100010111011) //if 134
			$display("Error: In 16+118 s_out is %b while it should be 100010111011", s_out);

		// Test case #360
		y_in = 12'b011110110100; //16
		x_in = 12'b000110000001; //119
		#10;
		if(s_out != 12'b100010111100) //if 135
			$display("Error: In 16+119 s_out is %b while it should be 100010111100", s_out);

		// Test case #361
		y_in = 12'b011111001011; //16
		x_in = 12'b000110000001; //120
		#10;
		if(s_out != 12'b100011000011) //if 136
			$display("Error: In 16+120 s_out is %b while it should be 100011000011", s_out);

		// Test case #362
		y_in = 12'b011111001100; //16
		x_in = 12'b000110000001; //121
		#10;
		if(s_out != 12'b100011000100) //if 137
			$display("Error: In 16+121 s_out is %b while it should be 100011000100", s_out);

		// Test case #363
		y_in = 12'b011111010010; //16
		x_in = 12'b000110000001; //122
		#10;
		if(s_out != 12'b100011011010) //if 138
			$display("Error: In 16+122 s_out is %b while it should be 100011011010", s_out);

		// Test case #364
		y_in = 12'b011111010101; //16
		x_in = 12'b000110000001; //123
		#10;
		if(s_out != 12'b100011011101) //if 139
			$display("Error: In 16+123 s_out is %b while it should be 100011011101", s_out);

		// Test case #365
		y_in = 12'b011111100001; //16
		x_in = 12'b000110000001; //124
		#10;
		if(s_out != 12'b100011101001) //if 140
			$display("Error: In 16+124 s_out is %b while it should be 100011101001", s_out);

		// Test case #366
		y_in = 12'b011111100110; //16
		x_in = 12'b000110000001; //125
		#10;
		if(s_out != 12'b100011101110) //if 141
			$display("Error: In 16+125 s_out is %b while it should be 100011101110", s_out);

		// Test case #367
		y_in = 12'b011111111000; //16
		x_in = 12'b000110000001; //126
		#10;
		if(s_out != 12'b100011110000) //if 142
			$display("Error: In 16+126 s_out is %b while it should be 100011110000", s_out);

		// Test case #368
		y_in = 12'b011111111111; //16
		x_in = 12'b000110000001; //127
		#10;
		if(s_out != 12'b100011110111) //if 143
			$display("Error: In 16+127 s_out is %b while it should be 100011110111", s_out);

		// Test case #369
		y_in = 12'b100010001000; //16
		x_in = 12'b000110000001; //128
		#10;
		if(s_out != 12'b100100001001) //if 144
			$display("Error: In 16+128 s_out is %b while it should be 100100001001", s_out);

		// Test case #370
		y_in = 12'b100010001111; //16
		x_in = 12'b000110000001; //129
		#10;
		if(s_out != 12'b100100001110) //if 145
			$display("Error: In 16+129 s_out is %b while it should be 100100001110", s_out);

		// Test case #371
		y_in = 12'b100010010001; //16
		x_in = 12'b000110000001; //130
		#10;
		if(s_out != 12'b100100010000) //if 146
			$display("Error: In 16+130 s_out is %b while it should be 100100010000", s_out);

		// Test case #372
		y_in = 12'b100010010110; //16
		x_in = 12'b000110000001; //131
		#10;
		if(s_out != 12'b100100010111) //if 147
			$display("Error: In 16+131 s_out is %b while it should be 100100010111", s_out);

		// Test case #373
		y_in = 12'b100010100010; //16
		x_in = 12'b000110000001; //132
		#10;
		if(s_out != 12'b100100100011) //if 148
			$display("Error: In 16+132 s_out is %b while it should be 100100100011", s_out);

		// Test case #374
		y_in = 12'b100010100101; //16
		x_in = 12'b000110000001; //133
		#10;
		if(s_out != 12'b100100100100) //if 149
			$display("Error: In 16+133 s_out is %b while it should be 100100100100", s_out);

		// Test case #375
		y_in = 12'b100010111011; //16
		x_in = 12'b000110000001; //134
		#10;
		if(s_out != 12'b100100111010) //if 150
			$display("Error: In 16+134 s_out is %b while it should be 100100111010", s_out);

		// Test case #376
		y_in = 12'b100010111100; //16
		x_in = 12'b000110000001; //135
		#10;
		if(s_out != 12'b100100111101) //if 151
			$display("Error: In 16+135 s_out is %b while it should be 100100111101", s_out);

		// Test case #377
		y_in = 12'b100011000011; //16
		x_in = 12'b000110000001; //136
		#10;
		if(s_out != 12'b100101000010) //if 152
			$display("Error: In 16+136 s_out is %b while it should be 100101000010", s_out);

		// Test case #378
		y_in = 12'b100011000100; //16
		x_in = 12'b000110000001; //137
		#10;
		if(s_out != 12'b100101000101) //if 153
			$display("Error: In 16+137 s_out is %b while it should be 100101000101", s_out);

		// Test case #379
		y_in = 12'b100011011010; //16
		x_in = 12'b000110000001; //138
		#10;
		if(s_out != 12'b100101011011) //if 154
			$display("Error: In 16+138 s_out is %b while it should be 100101011011", s_out);

		// Test case #380
		y_in = 12'b100011011101; //16
		x_in = 12'b000110000001; //139
		#10;
		if(s_out != 12'b100101011100) //if 155
			$display("Error: In 16+139 s_out is %b while it should be 100101011100", s_out);

		// Test case #381
		y_in = 12'b100011101001; //16
		x_in = 12'b000110000001; //140
		#10;
		if(s_out != 12'b100101101000) //if 156
			$display("Error: In 16+140 s_out is %b while it should be 100101101000", s_out);

		// Test case #382
		y_in = 12'b100011101110; //16
		x_in = 12'b000110000001; //141
		#10;
		if(s_out != 12'b100101101111) //if 157
			$display("Error: In 16+141 s_out is %b while it should be 100101101111", s_out);

		// Test case #383
		y_in = 12'b100011110000; //16
		x_in = 12'b000110000001; //142
		#10;
		if(s_out != 12'b100101110001) //if 158
			$display("Error: In 16+142 s_out is %b while it should be 100101110001", s_out);

		// Test case #384
		y_in = 12'b100011110111; //16
		x_in = 12'b000110000001; //143
		#10;
		if(s_out != 12'b100101110110) //if 159
			$display("Error: In 16+143 s_out is %b while it should be 100101110110", s_out);

		// Test case #385
		y_in = 12'b100100001001; //16
		x_in = 12'b000110000001; //144
		#10;
		if(s_out != 12'b101000001010) //if 160
			$display("Error: In 16+144 s_out is %b while it should be 101000001010", s_out);

		// Test case #386
		y_in = 12'b100100001110; //16
		x_in = 12'b000110000001; //145
		#10;
		if(s_out != 12'b101000001101) //if 161
			$display("Error: In 16+145 s_out is %b while it should be 101000001101", s_out);

		// Test case #387
		y_in = 12'b100100010000; //16
		x_in = 12'b000110000001; //146
		#10;
		if(s_out != 12'b101000010011) //if 162
			$display("Error: In 16+146 s_out is %b while it should be 101000010011", s_out);

		// Test case #388
		y_in = 12'b100100010111; //16
		x_in = 12'b000110000001; //147
		#10;
		if(s_out != 12'b101000010100) //if 163
			$display("Error: In 16+147 s_out is %b while it should be 101000010100", s_out);

		// Test case #389
		y_in = 12'b100100100011; //16
		x_in = 12'b000110000001; //148
		#10;
		if(s_out != 12'b101000100000) //if 164
			$display("Error: In 16+148 s_out is %b while it should be 101000100000", s_out);

		// Test case #390
		y_in = 12'b100100100100; //16
		x_in = 12'b000110000001; //149
		#10;
		if(s_out != 12'b101000100111) //if 165
			$display("Error: In 16+149 s_out is %b while it should be 101000100111", s_out);

		// Test case #391
		y_in = 12'b100100111010; //16
		x_in = 12'b000110000001; //150
		#10;
		if(s_out != 12'b101000111001) //if 166
			$display("Error: In 16+150 s_out is %b while it should be 101000111001", s_out);

		// Test case #392
		y_in = 12'b100100111101; //16
		x_in = 12'b000110000001; //151
		#10;
		if(s_out != 12'b101000111110) //if 167
			$display("Error: In 16+151 s_out is %b while it should be 101000111110", s_out);

		// Test case #393
		y_in = 12'b100101000010; //16
		x_in = 12'b000110000001; //152
		#10;
		if(s_out != 12'b101001000001) //if 168
			$display("Error: In 16+152 s_out is %b while it should be 101001000001", s_out);

		// Test case #394
		y_in = 12'b100101000101; //16
		x_in = 12'b000110000001; //153
		#10;
		if(s_out != 12'b101001000110) //if 169
			$display("Error: In 16+153 s_out is %b while it should be 101001000110", s_out);

		// Test case #395
		y_in = 12'b100101011011; //16
		x_in = 12'b000110000001; //154
		#10;
		if(s_out != 12'b101001011000) //if 170
			$display("Error: In 16+154 s_out is %b while it should be 101001011000", s_out);

		// Test case #396
		y_in = 12'b100101011100; //16
		x_in = 12'b000110000001; //155
		#10;
		if(s_out != 12'b101001011111) //if 171
			$display("Error: In 16+155 s_out is %b while it should be 101001011111", s_out);

		// Test case #397
		y_in = 12'b100101101000; //16
		x_in = 12'b000110000001; //156
		#10;
		if(s_out != 12'b101001101011) //if 172
			$display("Error: In 16+156 s_out is %b while it should be 101001101011", s_out);

		// Test case #398
		y_in = 12'b100101101111; //16
		x_in = 12'b000110000001; //157
		#10;
		if(s_out != 12'b101001101100) //if 173
			$display("Error: In 16+157 s_out is %b while it should be 101001101100", s_out);

		// Test case #399
		y_in = 12'b100101110001; //16
		x_in = 12'b000110000001; //158
		#10;
		if(s_out != 12'b101001110010) //if 174
			$display("Error: In 16+158 s_out is %b while it should be 101001110010", s_out);

		// Test case #400
		y_in = 12'b100101110110; //16
		x_in = 12'b000110000001; //159
		#10;
		if(s_out != 12'b101001110101) //if 175
			$display("Error: In 16+159 s_out is %b while it should be 101001110101", s_out);

		// Test case #401
		y_in = 12'b101000001010; //16
		x_in = 12'b000110000001; //160
		#10;
		if(s_out != 12'b101110001011) //if 176
			$display("Error: In 16+160 s_out is %b while it should be 101110001011", s_out);

		// Test case #402
		y_in = 12'b101000001101; //16
		x_in = 12'b000110000001; //161
		#10;
		if(s_out != 12'b101110001100) //if 177
			$display("Error: In 16+161 s_out is %b while it should be 101110001100", s_out);

		// Test case #403
		y_in = 12'b101000010011; //16
		x_in = 12'b000110000001; //162
		#10;
		if(s_out != 12'b101110010010) //if 178
			$display("Error: In 16+162 s_out is %b while it should be 101110010010", s_out);

		// Test case #404
		y_in = 12'b101000010100; //16
		x_in = 12'b000110000001; //163
		#10;
		if(s_out != 12'b101110010101) //if 179
			$display("Error: In 16+163 s_out is %b while it should be 101110010101", s_out);

		// Test case #405
		y_in = 12'b101000100000; //16
		x_in = 12'b000110000001; //164
		#10;
		if(s_out != 12'b101110100001) //if 180
			$display("Error: In 16+164 s_out is %b while it should be 101110100001", s_out);

		// Test case #406
		y_in = 12'b101000100111; //16
		x_in = 12'b000110000001; //165
		#10;
		if(s_out != 12'b101110100110) //if 181
			$display("Error: In 16+165 s_out is %b while it should be 101110100110", s_out);

		// Test case #407
		y_in = 12'b101000111001; //16
		x_in = 12'b000110000001; //166
		#10;
		if(s_out != 12'b101110111000) //if 182
			$display("Error: In 16+166 s_out is %b while it should be 101110111000", s_out);

		// Test case #408
		y_in = 12'b101000111110; //16
		x_in = 12'b000110000001; //167
		#10;
		if(s_out != 12'b101110111111) //if 183
			$display("Error: In 16+167 s_out is %b while it should be 101110111111", s_out);

		// Test case #409
		y_in = 12'b101001000001; //16
		x_in = 12'b000110000001; //168
		#10;
		if(s_out != 12'b101111000000) //if 184
			$display("Error: In 16+168 s_out is %b while it should be 101111000000", s_out);

		// Test case #410
		y_in = 12'b101001000110; //16
		x_in = 12'b000110000001; //169
		#10;
		if(s_out != 12'b101111000111) //if 185
			$display("Error: In 16+169 s_out is %b while it should be 101111000111", s_out);

		// Test case #411
		y_in = 12'b101001011000; //16
		x_in = 12'b000110000001; //170
		#10;
		if(s_out != 12'b101111011001) //if 186
			$display("Error: In 16+170 s_out is %b while it should be 101111011001", s_out);

		// Test case #412
		y_in = 12'b101001011111; //16
		x_in = 12'b000110000001; //171
		#10;
		if(s_out != 12'b101111011110) //if 187
			$display("Error: In 16+171 s_out is %b while it should be 101111011110", s_out);

		// Test case #413
		y_in = 12'b101001101011; //16
		x_in = 12'b000110000001; //172
		#10;
		if(s_out != 12'b101111101010) //if 188
			$display("Error: In 16+172 s_out is %b while it should be 101111101010", s_out);

		// Test case #414
		y_in = 12'b101001101100; //16
		x_in = 12'b000110000001; //173
		#10;
		if(s_out != 12'b101111101101) //if 189
			$display("Error: In 16+173 s_out is %b while it should be 101111101101", s_out);

		// Test case #415
		y_in = 12'b101001110010; //16
		x_in = 12'b000110000001; //174
		#10;
		if(s_out != 12'b101111110011) //if 190
			$display("Error: In 16+174 s_out is %b while it should be 101111110011", s_out);

		// Test case #416
		y_in = 12'b101001110101; //16
		x_in = 12'b000110000001; //175
		#10;
		if(s_out != 12'b101111110100) //if 191
			$display("Error: In 16+175 s_out is %b while it should be 101111110100", s_out);

		// Test case #417
		y_in = 12'b101110001011; //16
		x_in = 12'b000110000001; //176
		#10;
		if(s_out != 12'b110000001011) //if 192
			$display("Error: In 16+176 s_out is %b while it should be 110000001011", s_out);

		// Test case #418
		y_in = 12'b101110001100; //16
		x_in = 12'b000110000001; //177
		#10;
		if(s_out != 12'b110000001100) //if 193
			$display("Error: In 16+177 s_out is %b while it should be 110000001100", s_out);

		// Test case #419
		y_in = 12'b101110010010; //16
		x_in = 12'b000110000001; //178
		#10;
		if(s_out != 12'b110000010010) //if 194
			$display("Error: In 16+178 s_out is %b while it should be 110000010010", s_out);

		// Test case #420
		y_in = 12'b101110010101; //16
		x_in = 12'b000110000001; //179
		#10;
		if(s_out != 12'b110000010101) //if 195
			$display("Error: In 16+179 s_out is %b while it should be 110000010101", s_out);

		// Test case #421
		y_in = 12'b101110100001; //16
		x_in = 12'b000110000001; //180
		#10;
		if(s_out != 12'b110000100001) //if 196
			$display("Error: In 16+180 s_out is %b while it should be 110000100001", s_out);

		// Test case #422
		y_in = 12'b101110100110; //16
		x_in = 12'b000110000001; //181
		#10;
		if(s_out != 12'b110000100110) //if 197
			$display("Error: In 16+181 s_out is %b while it should be 110000100110", s_out);

		// Test case #423
		y_in = 12'b101110111000; //16
		x_in = 12'b000110000001; //182
		#10;
		if(s_out != 12'b110000111000) //if 198
			$display("Error: In 16+182 s_out is %b while it should be 110000111000", s_out);

		// Test case #424
		y_in = 12'b101110111111; //16
		x_in = 12'b000110000001; //183
		#10;
		if(s_out != 12'b110000111111) //if 199
			$display("Error: In 16+183 s_out is %b while it should be 110000111111", s_out);

		// Test case #425
		y_in = 12'b101111000000; //16
		x_in = 12'b000110000001; //184
		#10;
		if(s_out != 12'b110001000000) //if 200
			$display("Error: In 16+184 s_out is %b while it should be 110001000000", s_out);

		// Test case #426
		y_in = 12'b101111000111; //16
		x_in = 12'b000110000001; //185
		#10;
		if(s_out != 12'b110001000111) //if 201
			$display("Error: In 16+185 s_out is %b while it should be 110001000111", s_out);

		// Test case #427
		y_in = 12'b101111011001; //16
		x_in = 12'b000110000001; //186
		#10;
		if(s_out != 12'b110001011001) //if 202
			$display("Error: In 16+186 s_out is %b while it should be 110001011001", s_out);

		// Test case #428
		y_in = 12'b101111011110; //16
		x_in = 12'b000110000001; //187
		#10;
		if(s_out != 12'b110001011110) //if 203
			$display("Error: In 16+187 s_out is %b while it should be 110001011110", s_out);

		// Test case #429
		y_in = 12'b101111101010; //16
		x_in = 12'b000110000001; //188
		#10;
		if(s_out != 12'b110001101010) //if 204
			$display("Error: In 16+188 s_out is %b while it should be 110001101010", s_out);

		// Test case #430
		y_in = 12'b101111101101; //16
		x_in = 12'b000110000001; //189
		#10;
		if(s_out != 12'b110001101101) //if 205
			$display("Error: In 16+189 s_out is %b while it should be 110001101101", s_out);

		// Test case #431
		y_in = 12'b101111110011; //16
		x_in = 12'b000110000001; //190
		#10;
		if(s_out != 12'b110001110011) //if 206
			$display("Error: In 16+190 s_out is %b while it should be 110001110011", s_out);

		// Test case #432
		y_in = 12'b101111110100; //16
		x_in = 12'b000110000001; //191
		#10;
		if(s_out != 12'b110001110100) //if 207
			$display("Error: In 16+191 s_out is %b while it should be 110001110100", s_out);

		// Test case #433
		y_in = 12'b110000001011; //16
		x_in = 12'b000110000001; //192
		#10;
		if(s_out != 12'b110110001010) //if 208
			$display("Error: In 16+192 s_out is %b while it should be 110110001010", s_out);

		// Test case #434
		y_in = 12'b110000001100; //16
		x_in = 12'b000110000001; //193
		#10;
		if(s_out != 12'b110110001101) //if 209
			$display("Error: In 16+193 s_out is %b while it should be 110110001101", s_out);

		// Test case #435
		y_in = 12'b110000010010; //16
		x_in = 12'b000110000001; //194
		#10;
		if(s_out != 12'b110110010011) //if 210
			$display("Error: In 16+194 s_out is %b while it should be 110110010011", s_out);

		// Test case #436
		y_in = 12'b110000010101; //16
		x_in = 12'b000110000001; //195
		#10;
		if(s_out != 12'b110110010100) //if 211
			$display("Error: In 16+195 s_out is %b while it should be 110110010100", s_out);

		// Test case #437
		y_in = 12'b110000100001; //16
		x_in = 12'b000110000001; //196
		#10;
		if(s_out != 12'b110110100000) //if 212
			$display("Error: In 16+196 s_out is %b while it should be 110110100000", s_out);

		// Test case #438
		y_in = 12'b110000100110; //16
		x_in = 12'b000110000001; //197
		#10;
		if(s_out != 12'b110110100111) //if 213
			$display("Error: In 16+197 s_out is %b while it should be 110110100111", s_out);

		// Test case #439
		y_in = 12'b110000111000; //16
		x_in = 12'b000110000001; //198
		#10;
		if(s_out != 12'b110110111001) //if 214
			$display("Error: In 16+198 s_out is %b while it should be 110110111001", s_out);

		// Test case #440
		y_in = 12'b110000111111; //16
		x_in = 12'b000110000001; //199
		#10;
		if(s_out != 12'b110110111110) //if 215
			$display("Error: In 16+199 s_out is %b while it should be 110110111110", s_out);

		// Test case #441
		y_in = 12'b110001000000; //16
		x_in = 12'b000110000001; //200
		#10;
		if(s_out != 12'b110111000001) //if 216
			$display("Error: In 16+200 s_out is %b while it should be 110111000001", s_out);

		// Test case #442
		y_in = 12'b110001000111; //16
		x_in = 12'b000110000001; //201
		#10;
		if(s_out != 12'b110111000110) //if 217
			$display("Error: In 16+201 s_out is %b while it should be 110111000110", s_out);

		// Test case #443
		y_in = 12'b110001011001; //16
		x_in = 12'b000110000001; //202
		#10;
		if(s_out != 12'b110111011000) //if 218
			$display("Error: In 16+202 s_out is %b while it should be 110111011000", s_out);

		// Test case #444
		y_in = 12'b110001011110; //16
		x_in = 12'b000110000001; //203
		#10;
		if(s_out != 12'b110111011111) //if 219
			$display("Error: In 16+203 s_out is %b while it should be 110111011111", s_out);

		// Test case #445
		y_in = 12'b110001101010; //16
		x_in = 12'b000110000001; //204
		#10;
		if(s_out != 12'b110111101011) //if 220
			$display("Error: In 16+204 s_out is %b while it should be 110111101011", s_out);

		// Test case #446
		y_in = 12'b110001101101; //16
		x_in = 12'b000110000001; //205
		#10;
		if(s_out != 12'b110111101100) //if 221
			$display("Error: In 16+205 s_out is %b while it should be 110111101100", s_out);

		// Test case #447
		y_in = 12'b110001110011; //16
		x_in = 12'b000110000001; //206
		#10;
		if(s_out != 12'b110111110010) //if 222
			$display("Error: In 16+206 s_out is %b while it should be 110111110010", s_out);

		// Test case #448
		y_in = 12'b110001110100; //16
		x_in = 12'b000110000001; //207
		#10;
		if(s_out != 12'b110111110101) //if 223
			$display("Error: In 16+207 s_out is %b while it should be 110111110101", s_out);

		// Test case #449
		y_in = 12'b110110001010; //16
		x_in = 12'b000110000001; //208
		#10;
		if(s_out != 12'b111010001001) //if 224
			$display("Error: In 16+208 s_out is %b while it should be 111010001001", s_out);

		// Test case #450
		y_in = 12'b110110001101; //16
		x_in = 12'b000110000001; //209
		#10;
		if(s_out != 12'b111010001110) //if 225
			$display("Error: In 16+209 s_out is %b while it should be 111010001110", s_out);

		// Test case #451
		y_in = 12'b110110010011; //16
		x_in = 12'b000110000001; //210
		#10;
		if(s_out != 12'b111010010000) //if 226
			$display("Error: In 16+210 s_out is %b while it should be 111010010000", s_out);

		// Test case #452
		y_in = 12'b110110010100; //16
		x_in = 12'b000110000001; //211
		#10;
		if(s_out != 12'b111010010111) //if 227
			$display("Error: In 16+211 s_out is %b while it should be 111010010111", s_out);

		// Test case #453
		y_in = 12'b110110100000; //16
		x_in = 12'b000110000001; //212
		#10;
		if(s_out != 12'b111010100011) //if 228
			$display("Error: In 16+212 s_out is %b while it should be 111010100011", s_out);

		// Test case #454
		y_in = 12'b110110100111; //16
		x_in = 12'b000110000001; //213
		#10;
		if(s_out != 12'b111010100100) //if 229
			$display("Error: In 16+213 s_out is %b while it should be 111010100100", s_out);

		// Test case #455
		y_in = 12'b110110111001; //16
		x_in = 12'b000110000001; //214
		#10;
		if(s_out != 12'b111010111010) //if 230
			$display("Error: In 16+214 s_out is %b while it should be 111010111010", s_out);

		// Test case #456
		y_in = 12'b110110111110; //16
		x_in = 12'b000110000001; //215
		#10;
		if(s_out != 12'b111010111101) //if 231
			$display("Error: In 16+215 s_out is %b while it should be 111010111101", s_out);

		// Test case #457
		y_in = 12'b110111000001; //16
		x_in = 12'b000110000001; //216
		#10;
		if(s_out != 12'b111011000010) //if 232
			$display("Error: In 16+216 s_out is %b while it should be 111011000010", s_out);

		// Test case #458
		y_in = 12'b110111000110; //16
		x_in = 12'b000110000001; //217
		#10;
		if(s_out != 12'b111011000101) //if 233
			$display("Error: In 16+217 s_out is %b while it should be 111011000101", s_out);

		// Test case #459
		y_in = 12'b110111011000; //16
		x_in = 12'b000110000001; //218
		#10;
		if(s_out != 12'b111011011011) //if 234
			$display("Error: In 16+218 s_out is %b while it should be 111011011011", s_out);

		// Test case #460
		y_in = 12'b110111011111; //16
		x_in = 12'b000110000001; //219
		#10;
		if(s_out != 12'b111011011100) //if 235
			$display("Error: In 16+219 s_out is %b while it should be 111011011100", s_out);

		// Test case #461
		y_in = 12'b110111101011; //16
		x_in = 12'b000110000001; //220
		#10;
		if(s_out != 12'b111011101000) //if 236
			$display("Error: In 16+220 s_out is %b while it should be 111011101000", s_out);

		// Test case #462
		y_in = 12'b110111101100; //16
		x_in = 12'b000110000001; //221
		#10;
		if(s_out != 12'b111011101111) //if 237
			$display("Error: In 16+221 s_out is %b while it should be 111011101111", s_out);

		// Test case #463
		y_in = 12'b110111110010; //16
		x_in = 12'b000110000001; //222
		#10;
		if(s_out != 12'b111011110001) //if 238
			$display("Error: In 16+222 s_out is %b while it should be 111011110001", s_out);

		// Test case #464
		y_in = 12'b110111110101; //16
		x_in = 12'b000110000001; //223
		#10;
		if(s_out != 12'b111011110110) //if 239
			$display("Error: In 16+223 s_out is %b while it should be 111011110110", s_out);

		// Test case #465
		y_in = 12'b111010001001; //16
		x_in = 12'b000110000001; //224
		#10;
		if(s_out != 12'b111100001000) //if 240
			$display("Error: In 16+224 s_out is %b while it should be 111100001000", s_out);

		// Test case #466
		y_in = 12'b111010001110; //16
		x_in = 12'b000110000001; //225
		#10;
		if(s_out != 12'b111100001111) //if 241
			$display("Error: In 16+225 s_out is %b while it should be 111100001111", s_out);

		// Test case #467
		y_in = 12'b111010010000; //16
		x_in = 12'b000110000001; //226
		#10;
		if(s_out != 12'b111100010001) //if 242
			$display("Error: In 16+226 s_out is %b while it should be 111100010001", s_out);

		// Test case #468
		y_in = 12'b111010010111; //16
		x_in = 12'b000110000001; //227
		#10;
		if(s_out != 12'b111100010110) //if 243
			$display("Error: In 16+227 s_out is %b while it should be 111100010110", s_out);

		// Test case #469
		y_in = 12'b111010100011; //16
		x_in = 12'b000110000001; //228
		#10;
		if(s_out != 12'b111100100010) //if 244
			$display("Error: In 16+228 s_out is %b while it should be 111100100010", s_out);

		// Test case #470
		y_in = 12'b111010100100; //16
		x_in = 12'b000110000001; //229
		#10;
		if(s_out != 12'b111100100101) //if 245
			$display("Error: In 16+229 s_out is %b while it should be 111100100101", s_out);

		// Test case #471
		y_in = 12'b111010111010; //16
		x_in = 12'b000110000001; //230
		#10;
		if(s_out != 12'b111100111011) //if 246
			$display("Error: In 16+230 s_out is %b while it should be 111100111011", s_out);

		// Test case #472
		y_in = 12'b111010111101; //16
		x_in = 12'b000110000001; //231
		#10;
		if(s_out != 12'b111100111100) //if 247
			$display("Error: In 16+231 s_out is %b while it should be 111100111100", s_out);

		// Test case #473
		y_in = 12'b111011000010; //16
		x_in = 12'b000110000001; //232
		#10;
		if(s_out != 12'b111101000011) //if 248
			$display("Error: In 16+232 s_out is %b while it should be 111101000011", s_out);

		// Test case #474
		y_in = 12'b111011000101; //16
		x_in = 12'b000110000001; //233
		#10;
		if(s_out != 12'b111101000100) //if 249
			$display("Error: In 16+233 s_out is %b while it should be 111101000100", s_out);

		// Test case #475
		y_in = 12'b111011011011; //16
		x_in = 12'b000110000001; //234
		#10;
		if(s_out != 12'b111101011010) //if 250
			$display("Error: In 16+234 s_out is %b while it should be 111101011010", s_out);

		// Test case #476
		y_in = 12'b111011011100; //16
		x_in = 12'b000110000001; //235
		#10;
		if(s_out != 12'b111101011101) //if 251
			$display("Error: In 16+235 s_out is %b while it should be 111101011101", s_out);

		// Test case #477
		y_in = 12'b111011101000; //16
		x_in = 12'b000110000001; //236
		#10;
		if(s_out != 12'b111101101001) //if 252
			$display("Error: In 16+236 s_out is %b while it should be 111101101001", s_out);

		// Test case #478
		y_in = 12'b111011101111; //16
		x_in = 12'b000110000001; //237
		#10;
		if(s_out != 12'b111101101110) //if 253
			$display("Error: In 16+237 s_out is %b while it should be 111101101110", s_out);

		// Test case #479
		y_in = 12'b111011110001; //16
		x_in = 12'b000110000001; //238
		#10;
		if(s_out != 12'b111101110000) //if 254
			$display("Error: In 16+238 s_out is %b while it should be 111101110000", s_out);

		// Test case #480
		y_in = 12'b111011110110; //16
		x_in = 12'b000110000001; //239
		#10;
		if(s_out != 12'b111101110111) //if 255
			$display("Error: In 16+239 s_out is %b while it should be 111101110111", s_out);

		// Test case #481
		y_in = 12'b000000000000; //17
		x_in = 12'b000110000110; //0
		#10;
		if(s_out != 12'b000110000110) //if 17
			$display("Error: In 17+0 s_out is %b while it should be 000110000110", s_out);

		// Test case #482
		y_in = 12'b000000000111; //17
		x_in = 12'b000110000110; //1
		#10;
		if(s_out != 12'b000110011000) //if 18
			$display("Error: In 17+1 s_out is %b while it should be 000110011000", s_out);

		// Test case #483
		y_in = 12'b000000011001; //17
		x_in = 12'b000110000110; //2
		#10;
		if(s_out != 12'b000110011111) //if 19
			$display("Error: In 17+2 s_out is %b while it should be 000110011111", s_out);

		// Test case #484
		y_in = 12'b000000011110; //17
		x_in = 12'b000110000110; //3
		#10;
		if(s_out != 12'b000110101011) //if 20
			$display("Error: In 17+3 s_out is %b while it should be 000110101011", s_out);

		// Test case #485
		y_in = 12'b000000101010; //17
		x_in = 12'b000110000110; //4
		#10;
		if(s_out != 12'b000110101100) //if 21
			$display("Error: In 17+4 s_out is %b while it should be 000110101100", s_out);

		// Test case #486
		y_in = 12'b000000101101; //17
		x_in = 12'b000110000110; //5
		#10;
		if(s_out != 12'b000110110010) //if 22
			$display("Error: In 17+5 s_out is %b while it should be 000110110010", s_out);

		// Test case #487
		y_in = 12'b000000110011; //17
		x_in = 12'b000110000110; //6
		#10;
		if(s_out != 12'b000110110101) //if 23
			$display("Error: In 17+6 s_out is %b while it should be 000110110101", s_out);

		// Test case #488
		y_in = 12'b000000110100; //17
		x_in = 12'b000110000110; //7
		#10;
		if(s_out != 12'b000111001010) //if 24
			$display("Error: In 17+7 s_out is %b while it should be 000111001010", s_out);

		// Test case #489
		y_in = 12'b000001001011; //17
		x_in = 12'b000110000110; //8
		#10;
		if(s_out != 12'b000111001101) //if 25
			$display("Error: In 17+8 s_out is %b while it should be 000111001101", s_out);

		// Test case #490
		y_in = 12'b000001001100; //17
		x_in = 12'b000110000110; //9
		#10;
		if(s_out != 12'b000111010011) //if 26
			$display("Error: In 17+9 s_out is %b while it should be 000111010011", s_out);

		// Test case #491
		y_in = 12'b000001010010; //17
		x_in = 12'b000110000110; //10
		#10;
		if(s_out != 12'b000111010100) //if 27
			$display("Error: In 17+10 s_out is %b while it should be 000111010100", s_out);

		// Test case #492
		y_in = 12'b000001010101; //17
		x_in = 12'b000110000110; //11
		#10;
		if(s_out != 12'b000111100000) //if 28
			$display("Error: In 17+11 s_out is %b while it should be 000111100000", s_out);

		// Test case #493
		y_in = 12'b000001100001; //17
		x_in = 12'b000110000110; //12
		#10;
		if(s_out != 12'b000111100111) //if 29
			$display("Error: In 17+12 s_out is %b while it should be 000111100111", s_out);

		// Test case #494
		y_in = 12'b000001100110; //17
		x_in = 12'b000110000110; //13
		#10;
		if(s_out != 12'b000111111001) //if 30
			$display("Error: In 17+13 s_out is %b while it should be 000111111001", s_out);

		// Test case #495
		y_in = 12'b000001111000; //17
		x_in = 12'b000110000110; //14
		#10;
		if(s_out != 12'b000111111110) //if 31
			$display("Error: In 17+14 s_out is %b while it should be 000111111110", s_out);

		// Test case #496
		y_in = 12'b000001111111; //17
		x_in = 12'b000110000110; //15
		#10;
		if(s_out != 12'b001010000010) //if 32
			$display("Error: In 17+15 s_out is %b while it should be 001010000010", s_out);

		// Test case #497
		y_in = 12'b000110000001; //17
		x_in = 12'b000110000110; //16
		#10;
		if(s_out != 12'b001010000101) //if 33
			$display("Error: In 17+16 s_out is %b while it should be 001010000101", s_out);

		// Test case #498
		y_in = 12'b000110000110; //17
		x_in = 12'b000110000110; //17
		#10;
		if(s_out != 12'b001010011011) //if 34
			$display("Error: In 17+17 s_out is %b while it should be 001010011011", s_out);

		// Test case #499
		y_in = 12'b000110011000; //17
		x_in = 12'b000110000110; //18
		#10;
		if(s_out != 12'b001010011100) //if 35
			$display("Error: In 17+18 s_out is %b while it should be 001010011100", s_out);

		// Test case #500
		y_in = 12'b000110011111; //17
		x_in = 12'b000110000110; //19
		#10;
		if(s_out != 12'b001010101000) //if 36
			$display("Error: In 17+19 s_out is %b while it should be 001010101000", s_out);

		// Test case #501
		y_in = 12'b000110101011; //17
		x_in = 12'b000110000110; //20
		#10;
		if(s_out != 12'b001010101111) //if 37
			$display("Error: In 17+20 s_out is %b while it should be 001010101111", s_out);

		// Test case #502
		y_in = 12'b000110101100; //17
		x_in = 12'b000110000110; //21
		#10;
		if(s_out != 12'b001010110001) //if 38
			$display("Error: In 17+21 s_out is %b while it should be 001010110001", s_out);

		// Test case #503
		y_in = 12'b000110110010; //17
		x_in = 12'b000110000110; //22
		#10;
		if(s_out != 12'b001010110110) //if 39
			$display("Error: In 17+22 s_out is %b while it should be 001010110110", s_out);

		// Test case #504
		y_in = 12'b000110110101; //17
		x_in = 12'b000110000110; //23
		#10;
		if(s_out != 12'b001011001001) //if 40
			$display("Error: In 17+23 s_out is %b while it should be 001011001001", s_out);

		// Test case #505
		y_in = 12'b000111001010; //17
		x_in = 12'b000110000110; //24
		#10;
		if(s_out != 12'b001011001110) //if 41
			$display("Error: In 17+24 s_out is %b while it should be 001011001110", s_out);

		// Test case #506
		y_in = 12'b000111001101; //17
		x_in = 12'b000110000110; //25
		#10;
		if(s_out != 12'b001011010000) //if 42
			$display("Error: In 17+25 s_out is %b while it should be 001011010000", s_out);

		// Test case #507
		y_in = 12'b000111010011; //17
		x_in = 12'b000110000110; //26
		#10;
		if(s_out != 12'b001011010111) //if 43
			$display("Error: In 17+26 s_out is %b while it should be 001011010111", s_out);

		// Test case #508
		y_in = 12'b000111010100; //17
		x_in = 12'b000110000110; //27
		#10;
		if(s_out != 12'b001011100011) //if 44
			$display("Error: In 17+27 s_out is %b while it should be 001011100011", s_out);

		// Test case #509
		y_in = 12'b000111100000; //17
		x_in = 12'b000110000110; //28
		#10;
		if(s_out != 12'b001011100100) //if 45
			$display("Error: In 17+28 s_out is %b while it should be 001011100100", s_out);

		// Test case #510
		y_in = 12'b000111100111; //17
		x_in = 12'b000110000110; //29
		#10;
		if(s_out != 12'b001011111010) //if 46
			$display("Error: In 17+29 s_out is %b while it should be 001011111010", s_out);

		// Test case #511
		y_in = 12'b000111111001; //17
		x_in = 12'b000110000110; //30
		#10;
		if(s_out != 12'b001011111101) //if 47
			$display("Error: In 17+30 s_out is %b while it should be 001011111101", s_out);

		// Test case #512
		y_in = 12'b000111111110; //17
		x_in = 12'b000110000110; //31
		#10;
		if(s_out != 12'b001100000011) //if 48
			$display("Error: In 17+31 s_out is %b while it should be 001100000011", s_out);

		// Test case #513
		y_in = 12'b001010000010; //17
		x_in = 12'b000110000110; //32
		#10;
		if(s_out != 12'b001100000100) //if 49
			$display("Error: In 17+32 s_out is %b while it should be 001100000100", s_out);

		// Test case #514
		y_in = 12'b001010000101; //17
		x_in = 12'b000110000110; //33
		#10;
		if(s_out != 12'b001100011010) //if 50
			$display("Error: In 17+33 s_out is %b while it should be 001100011010", s_out);

		// Test case #515
		y_in = 12'b001010011011; //17
		x_in = 12'b000110000110; //34
		#10;
		if(s_out != 12'b001100011101) //if 51
			$display("Error: In 17+34 s_out is %b while it should be 001100011101", s_out);

		// Test case #516
		y_in = 12'b001010011100; //17
		x_in = 12'b000110000110; //35
		#10;
		if(s_out != 12'b001100101001) //if 52
			$display("Error: In 17+35 s_out is %b while it should be 001100101001", s_out);

		// Test case #517
		y_in = 12'b001010101000; //17
		x_in = 12'b000110000110; //36
		#10;
		if(s_out != 12'b001100101110) //if 53
			$display("Error: In 17+36 s_out is %b while it should be 001100101110", s_out);

		// Test case #518
		y_in = 12'b001010101111; //17
		x_in = 12'b000110000110; //37
		#10;
		if(s_out != 12'b001100110000) //if 54
			$display("Error: In 17+37 s_out is %b while it should be 001100110000", s_out);

		// Test case #519
		y_in = 12'b001010110001; //17
		x_in = 12'b000110000110; //38
		#10;
		if(s_out != 12'b001100110111) //if 55
			$display("Error: In 17+38 s_out is %b while it should be 001100110111", s_out);

		// Test case #520
		y_in = 12'b001010110110; //17
		x_in = 12'b000110000110; //39
		#10;
		if(s_out != 12'b001101001000) //if 56
			$display("Error: In 17+39 s_out is %b while it should be 001101001000", s_out);

		// Test case #521
		y_in = 12'b001011001001; //17
		x_in = 12'b000110000110; //40
		#10;
		if(s_out != 12'b001101001111) //if 57
			$display("Error: In 17+40 s_out is %b while it should be 001101001111", s_out);

		// Test case #522
		y_in = 12'b001011001110; //17
		x_in = 12'b000110000110; //41
		#10;
		if(s_out != 12'b001101010001) //if 58
			$display("Error: In 17+41 s_out is %b while it should be 001101010001", s_out);

		// Test case #523
		y_in = 12'b001011010000; //17
		x_in = 12'b000110000110; //42
		#10;
		if(s_out != 12'b001101010110) //if 59
			$display("Error: In 17+42 s_out is %b while it should be 001101010110", s_out);

		// Test case #524
		y_in = 12'b001011010111; //17
		x_in = 12'b000110000110; //43
		#10;
		if(s_out != 12'b001101100010) //if 60
			$display("Error: In 17+43 s_out is %b while it should be 001101100010", s_out);

		// Test case #525
		y_in = 12'b001011100011; //17
		x_in = 12'b000110000110; //44
		#10;
		if(s_out != 12'b001101100101) //if 61
			$display("Error: In 17+44 s_out is %b while it should be 001101100101", s_out);

		// Test case #526
		y_in = 12'b001011100100; //17
		x_in = 12'b000110000110; //45
		#10;
		if(s_out != 12'b001101111011) //if 62
			$display("Error: In 17+45 s_out is %b while it should be 001101111011", s_out);

		// Test case #527
		y_in = 12'b001011111010; //17
		x_in = 12'b000110000110; //46
		#10;
		if(s_out != 12'b001101111100) //if 63
			$display("Error: In 17+46 s_out is %b while it should be 001101111100", s_out);

		// Test case #528
		y_in = 12'b001011111101; //17
		x_in = 12'b000110000110; //47
		#10;
		if(s_out != 12'b010010000011) //if 64
			$display("Error: In 17+47 s_out is %b while it should be 010010000011", s_out);

		// Test case #529
		y_in = 12'b001100000011; //17
		x_in = 12'b000110000110; //48
		#10;
		if(s_out != 12'b010010000100) //if 65
			$display("Error: In 17+48 s_out is %b while it should be 010010000100", s_out);

		// Test case #530
		y_in = 12'b001100000100; //17
		x_in = 12'b000110000110; //49
		#10;
		if(s_out != 12'b010010011010) //if 66
			$display("Error: In 17+49 s_out is %b while it should be 010010011010", s_out);

		// Test case #531
		y_in = 12'b001100011010; //17
		x_in = 12'b000110000110; //50
		#10;
		if(s_out != 12'b010010011101) //if 67
			$display("Error: In 17+50 s_out is %b while it should be 010010011101", s_out);

		// Test case #532
		y_in = 12'b001100011101; //17
		x_in = 12'b000110000110; //51
		#10;
		if(s_out != 12'b010010101001) //if 68
			$display("Error: In 17+51 s_out is %b while it should be 010010101001", s_out);

		// Test case #533
		y_in = 12'b001100101001; //17
		x_in = 12'b000110000110; //52
		#10;
		if(s_out != 12'b010010101110) //if 69
			$display("Error: In 17+52 s_out is %b while it should be 010010101110", s_out);

		// Test case #534
		y_in = 12'b001100101110; //17
		x_in = 12'b000110000110; //53
		#10;
		if(s_out != 12'b010010110000) //if 70
			$display("Error: In 17+53 s_out is %b while it should be 010010110000", s_out);

		// Test case #535
		y_in = 12'b001100110000; //17
		x_in = 12'b000110000110; //54
		#10;
		if(s_out != 12'b010010110111) //if 71
			$display("Error: In 17+54 s_out is %b while it should be 010010110111", s_out);

		// Test case #536
		y_in = 12'b001100110111; //17
		x_in = 12'b000110000110; //55
		#10;
		if(s_out != 12'b010011001000) //if 72
			$display("Error: In 17+55 s_out is %b while it should be 010011001000", s_out);

		// Test case #537
		y_in = 12'b001101001000; //17
		x_in = 12'b000110000110; //56
		#10;
		if(s_out != 12'b010011001111) //if 73
			$display("Error: In 17+56 s_out is %b while it should be 010011001111", s_out);

		// Test case #538
		y_in = 12'b001101001111; //17
		x_in = 12'b000110000110; //57
		#10;
		if(s_out != 12'b010011010001) //if 74
			$display("Error: In 17+57 s_out is %b while it should be 010011010001", s_out);

		// Test case #539
		y_in = 12'b001101010001; //17
		x_in = 12'b000110000110; //58
		#10;
		if(s_out != 12'b010011010110) //if 75
			$display("Error: In 17+58 s_out is %b while it should be 010011010110", s_out);

		// Test case #540
		y_in = 12'b001101010110; //17
		x_in = 12'b000110000110; //59
		#10;
		if(s_out != 12'b010011100010) //if 76
			$display("Error: In 17+59 s_out is %b while it should be 010011100010", s_out);

		// Test case #541
		y_in = 12'b001101100010; //17
		x_in = 12'b000110000110; //60
		#10;
		if(s_out != 12'b010011100101) //if 77
			$display("Error: In 17+60 s_out is %b while it should be 010011100101", s_out);

		// Test case #542
		y_in = 12'b001101100101; //17
		x_in = 12'b000110000110; //61
		#10;
		if(s_out != 12'b010011111011) //if 78
			$display("Error: In 17+61 s_out is %b while it should be 010011111011", s_out);

		// Test case #543
		y_in = 12'b001101111011; //17
		x_in = 12'b000110000110; //62
		#10;
		if(s_out != 12'b010011111100) //if 79
			$display("Error: In 17+62 s_out is %b while it should be 010011111100", s_out);

		// Test case #544
		y_in = 12'b001101111100; //17
		x_in = 12'b000110000110; //63
		#10;
		if(s_out != 12'b010100000010) //if 80
			$display("Error: In 17+63 s_out is %b while it should be 010100000010", s_out);

		// Test case #545
		y_in = 12'b010010000011; //17
		x_in = 12'b000110000110; //64
		#10;
		if(s_out != 12'b010100000101) //if 81
			$display("Error: In 17+64 s_out is %b while it should be 010100000101", s_out);

		// Test case #546
		y_in = 12'b010010000100; //17
		x_in = 12'b000110000110; //65
		#10;
		if(s_out != 12'b010100011011) //if 82
			$display("Error: In 17+65 s_out is %b while it should be 010100011011", s_out);

		// Test case #547
		y_in = 12'b010010011010; //17
		x_in = 12'b000110000110; //66
		#10;
		if(s_out != 12'b010100011100) //if 83
			$display("Error: In 17+66 s_out is %b while it should be 010100011100", s_out);

		// Test case #548
		y_in = 12'b010010011101; //17
		x_in = 12'b000110000110; //67
		#10;
		if(s_out != 12'b010100101000) //if 84
			$display("Error: In 17+67 s_out is %b while it should be 010100101000", s_out);

		// Test case #549
		y_in = 12'b010010101001; //17
		x_in = 12'b000110000110; //68
		#10;
		if(s_out != 12'b010100101111) //if 85
			$display("Error: In 17+68 s_out is %b while it should be 010100101111", s_out);

		// Test case #550
		y_in = 12'b010010101110; //17
		x_in = 12'b000110000110; //69
		#10;
		if(s_out != 12'b010100110001) //if 86
			$display("Error: In 17+69 s_out is %b while it should be 010100110001", s_out);

		// Test case #551
		y_in = 12'b010010110000; //17
		x_in = 12'b000110000110; //70
		#10;
		if(s_out != 12'b010100110110) //if 87
			$display("Error: In 17+70 s_out is %b while it should be 010100110110", s_out);

		// Test case #552
		y_in = 12'b010010110111; //17
		x_in = 12'b000110000110; //71
		#10;
		if(s_out != 12'b010101001001) //if 88
			$display("Error: In 17+71 s_out is %b while it should be 010101001001", s_out);

		// Test case #553
		y_in = 12'b010011001000; //17
		x_in = 12'b000110000110; //72
		#10;
		if(s_out != 12'b010101001110) //if 89
			$display("Error: In 17+72 s_out is %b while it should be 010101001110", s_out);

		// Test case #554
		y_in = 12'b010011001111; //17
		x_in = 12'b000110000110; //73
		#10;
		if(s_out != 12'b010101010000) //if 90
			$display("Error: In 17+73 s_out is %b while it should be 010101010000", s_out);

		// Test case #555
		y_in = 12'b010011010001; //17
		x_in = 12'b000110000110; //74
		#10;
		if(s_out != 12'b010101010111) //if 91
			$display("Error: In 17+74 s_out is %b while it should be 010101010111", s_out);

		// Test case #556
		y_in = 12'b010011010110; //17
		x_in = 12'b000110000110; //75
		#10;
		if(s_out != 12'b010101100011) //if 92
			$display("Error: In 17+75 s_out is %b while it should be 010101100011", s_out);

		// Test case #557
		y_in = 12'b010011100010; //17
		x_in = 12'b000110000110; //76
		#10;
		if(s_out != 12'b010101100100) //if 93
			$display("Error: In 17+76 s_out is %b while it should be 010101100100", s_out);

		// Test case #558
		y_in = 12'b010011100101; //17
		x_in = 12'b000110000110; //77
		#10;
		if(s_out != 12'b010101111010) //if 94
			$display("Error: In 17+77 s_out is %b while it should be 010101111010", s_out);

		// Test case #559
		y_in = 12'b010011111011; //17
		x_in = 12'b000110000110; //78
		#10;
		if(s_out != 12'b010101111101) //if 95
			$display("Error: In 17+78 s_out is %b while it should be 010101111101", s_out);

		// Test case #560
		y_in = 12'b010011111100; //17
		x_in = 12'b000110000110; //79
		#10;
		if(s_out != 12'b011000000001) //if 96
			$display("Error: In 17+79 s_out is %b while it should be 011000000001", s_out);

		// Test case #561
		y_in = 12'b010100000010; //17
		x_in = 12'b000110000110; //80
		#10;
		if(s_out != 12'b011000000110) //if 97
			$display("Error: In 17+80 s_out is %b while it should be 011000000110", s_out);

		// Test case #562
		y_in = 12'b010100000101; //17
		x_in = 12'b000110000110; //81
		#10;
		if(s_out != 12'b011000011000) //if 98
			$display("Error: In 17+81 s_out is %b while it should be 011000011000", s_out);

		// Test case #563
		y_in = 12'b010100011011; //17
		x_in = 12'b000110000110; //82
		#10;
		if(s_out != 12'b011000011111) //if 99
			$display("Error: In 17+82 s_out is %b while it should be 011000011111", s_out);

		// Test case #564
		y_in = 12'b010100011100; //17
		x_in = 12'b000110000110; //83
		#10;
		if(s_out != 12'b011000101011) //if 100
			$display("Error: In 17+83 s_out is %b while it should be 011000101011", s_out);

		// Test case #565
		y_in = 12'b010100101000; //17
		x_in = 12'b000110000110; //84
		#10;
		if(s_out != 12'b011000101100) //if 101
			$display("Error: In 17+84 s_out is %b while it should be 011000101100", s_out);

		// Test case #566
		y_in = 12'b010100101111; //17
		x_in = 12'b000110000110; //85
		#10;
		if(s_out != 12'b011000110010) //if 102
			$display("Error: In 17+85 s_out is %b while it should be 011000110010", s_out);

		// Test case #567
		y_in = 12'b010100110001; //17
		x_in = 12'b000110000110; //86
		#10;
		if(s_out != 12'b011000110101) //if 103
			$display("Error: In 17+86 s_out is %b while it should be 011000110101", s_out);

		// Test case #568
		y_in = 12'b010100110110; //17
		x_in = 12'b000110000110; //87
		#10;
		if(s_out != 12'b011001001010) //if 104
			$display("Error: In 17+87 s_out is %b while it should be 011001001010", s_out);

		// Test case #569
		y_in = 12'b010101001001; //17
		x_in = 12'b000110000110; //88
		#10;
		if(s_out != 12'b011001001101) //if 105
			$display("Error: In 17+88 s_out is %b while it should be 011001001101", s_out);

		// Test case #570
		y_in = 12'b010101001110; //17
		x_in = 12'b000110000110; //89
		#10;
		if(s_out != 12'b011001010011) //if 106
			$display("Error: In 17+89 s_out is %b while it should be 011001010011", s_out);

		// Test case #571
		y_in = 12'b010101010000; //17
		x_in = 12'b000110000110; //90
		#10;
		if(s_out != 12'b011001010100) //if 107
			$display("Error: In 17+90 s_out is %b while it should be 011001010100", s_out);

		// Test case #572
		y_in = 12'b010101010111; //17
		x_in = 12'b000110000110; //91
		#10;
		if(s_out != 12'b011001100000) //if 108
			$display("Error: In 17+91 s_out is %b while it should be 011001100000", s_out);

		// Test case #573
		y_in = 12'b010101100011; //17
		x_in = 12'b000110000110; //92
		#10;
		if(s_out != 12'b011001100111) //if 109
			$display("Error: In 17+92 s_out is %b while it should be 011001100111", s_out);

		// Test case #574
		y_in = 12'b010101100100; //17
		x_in = 12'b000110000110; //93
		#10;
		if(s_out != 12'b011001111001) //if 110
			$display("Error: In 17+93 s_out is %b while it should be 011001111001", s_out);

		// Test case #575
		y_in = 12'b010101111010; //17
		x_in = 12'b000110000110; //94
		#10;
		if(s_out != 12'b011001111110) //if 111
			$display("Error: In 17+94 s_out is %b while it should be 011001111110", s_out);

		// Test case #576
		y_in = 12'b010101111101; //17
		x_in = 12'b000110000110; //95
		#10;
		if(s_out != 12'b011110000000) //if 112
			$display("Error: In 17+95 s_out is %b while it should be 011110000000", s_out);

		// Test case #577
		y_in = 12'b011000000001; //17
		x_in = 12'b000110000110; //96
		#10;
		if(s_out != 12'b011110000111) //if 113
			$display("Error: In 17+96 s_out is %b while it should be 011110000111", s_out);

		// Test case #578
		y_in = 12'b011000000110; //17
		x_in = 12'b000110000110; //97
		#10;
		if(s_out != 12'b011110011001) //if 114
			$display("Error: In 17+97 s_out is %b while it should be 011110011001", s_out);

		// Test case #579
		y_in = 12'b011000011000; //17
		x_in = 12'b000110000110; //98
		#10;
		if(s_out != 12'b011110011110) //if 115
			$display("Error: In 17+98 s_out is %b while it should be 011110011110", s_out);

		// Test case #580
		y_in = 12'b011000011111; //17
		x_in = 12'b000110000110; //99
		#10;
		if(s_out != 12'b011110101010) //if 116
			$display("Error: In 17+99 s_out is %b while it should be 011110101010", s_out);

		// Test case #581
		y_in = 12'b011000101011; //17
		x_in = 12'b000110000110; //100
		#10;
		if(s_out != 12'b011110101101) //if 117
			$display("Error: In 17+100 s_out is %b while it should be 011110101101", s_out);

		// Test case #582
		y_in = 12'b011000101100; //17
		x_in = 12'b000110000110; //101
		#10;
		if(s_out != 12'b011110110011) //if 118
			$display("Error: In 17+101 s_out is %b while it should be 011110110011", s_out);

		// Test case #583
		y_in = 12'b011000110010; //17
		x_in = 12'b000110000110; //102
		#10;
		if(s_out != 12'b011110110100) //if 119
			$display("Error: In 17+102 s_out is %b while it should be 011110110100", s_out);

		// Test case #584
		y_in = 12'b011000110101; //17
		x_in = 12'b000110000110; //103
		#10;
		if(s_out != 12'b011111001011) //if 120
			$display("Error: In 17+103 s_out is %b while it should be 011111001011", s_out);

		// Test case #585
		y_in = 12'b011001001010; //17
		x_in = 12'b000110000110; //104
		#10;
		if(s_out != 12'b011111001100) //if 121
			$display("Error: In 17+104 s_out is %b while it should be 011111001100", s_out);

		// Test case #586
		y_in = 12'b011001001101; //17
		x_in = 12'b000110000110; //105
		#10;
		if(s_out != 12'b011111010010) //if 122
			$display("Error: In 17+105 s_out is %b while it should be 011111010010", s_out);

		// Test case #587
		y_in = 12'b011001010011; //17
		x_in = 12'b000110000110; //106
		#10;
		if(s_out != 12'b011111010101) //if 123
			$display("Error: In 17+106 s_out is %b while it should be 011111010101", s_out);

		// Test case #588
		y_in = 12'b011001010100; //17
		x_in = 12'b000110000110; //107
		#10;
		if(s_out != 12'b011111100001) //if 124
			$display("Error: In 17+107 s_out is %b while it should be 011111100001", s_out);

		// Test case #589
		y_in = 12'b011001100000; //17
		x_in = 12'b000110000110; //108
		#10;
		if(s_out != 12'b011111100110) //if 125
			$display("Error: In 17+108 s_out is %b while it should be 011111100110", s_out);

		// Test case #590
		y_in = 12'b011001100111; //17
		x_in = 12'b000110000110; //109
		#10;
		if(s_out != 12'b011111111000) //if 126
			$display("Error: In 17+109 s_out is %b while it should be 011111111000", s_out);

		// Test case #591
		y_in = 12'b011001111001; //17
		x_in = 12'b000110000110; //110
		#10;
		if(s_out != 12'b011111111111) //if 127
			$display("Error: In 17+110 s_out is %b while it should be 011111111111", s_out);

		// Test case #592
		y_in = 12'b011001111110; //17
		x_in = 12'b000110000110; //111
		#10;
		if(s_out != 12'b100010001000) //if 128
			$display("Error: In 17+111 s_out is %b while it should be 100010001000", s_out);

		// Test case #593
		y_in = 12'b011110000000; //17
		x_in = 12'b000110000110; //112
		#10;
		if(s_out != 12'b100010001111) //if 129
			$display("Error: In 17+112 s_out is %b while it should be 100010001111", s_out);

		// Test case #594
		y_in = 12'b011110000111; //17
		x_in = 12'b000110000110; //113
		#10;
		if(s_out != 12'b100010010001) //if 130
			$display("Error: In 17+113 s_out is %b while it should be 100010010001", s_out);

		// Test case #595
		y_in = 12'b011110011001; //17
		x_in = 12'b000110000110; //114
		#10;
		if(s_out != 12'b100010010110) //if 131
			$display("Error: In 17+114 s_out is %b while it should be 100010010110", s_out);

		// Test case #596
		y_in = 12'b011110011110; //17
		x_in = 12'b000110000110; //115
		#10;
		if(s_out != 12'b100010100010) //if 132
			$display("Error: In 17+115 s_out is %b while it should be 100010100010", s_out);

		// Test case #597
		y_in = 12'b011110101010; //17
		x_in = 12'b000110000110; //116
		#10;
		if(s_out != 12'b100010100101) //if 133
			$display("Error: In 17+116 s_out is %b while it should be 100010100101", s_out);

		// Test case #598
		y_in = 12'b011110101101; //17
		x_in = 12'b000110000110; //117
		#10;
		if(s_out != 12'b100010111011) //if 134
			$display("Error: In 17+117 s_out is %b while it should be 100010111011", s_out);

		// Test case #599
		y_in = 12'b011110110011; //17
		x_in = 12'b000110000110; //118
		#10;
		if(s_out != 12'b100010111100) //if 135
			$display("Error: In 17+118 s_out is %b while it should be 100010111100", s_out);

		// Test case #600
		y_in = 12'b011110110100; //17
		x_in = 12'b000110000110; //119
		#10;
		if(s_out != 12'b100011000011) //if 136
			$display("Error: In 17+119 s_out is %b while it should be 100011000011", s_out);

		// Test case #601
		y_in = 12'b011111001011; //17
		x_in = 12'b000110000110; //120
		#10;
		if(s_out != 12'b100011000100) //if 137
			$display("Error: In 17+120 s_out is %b while it should be 100011000100", s_out);

		// Test case #602
		y_in = 12'b011111001100; //17
		x_in = 12'b000110000110; //121
		#10;
		if(s_out != 12'b100011011010) //if 138
			$display("Error: In 17+121 s_out is %b while it should be 100011011010", s_out);

		// Test case #603
		y_in = 12'b011111010010; //17
		x_in = 12'b000110000110; //122
		#10;
		if(s_out != 12'b100011011101) //if 139
			$display("Error: In 17+122 s_out is %b while it should be 100011011101", s_out);

		// Test case #604
		y_in = 12'b011111010101; //17
		x_in = 12'b000110000110; //123
		#10;
		if(s_out != 12'b100011101001) //if 140
			$display("Error: In 17+123 s_out is %b while it should be 100011101001", s_out);

		// Test case #605
		y_in = 12'b011111100001; //17
		x_in = 12'b000110000110; //124
		#10;
		if(s_out != 12'b100011101110) //if 141
			$display("Error: In 17+124 s_out is %b while it should be 100011101110", s_out);

		// Test case #606
		y_in = 12'b011111100110; //17
		x_in = 12'b000110000110; //125
		#10;
		if(s_out != 12'b100011110000) //if 142
			$display("Error: In 17+125 s_out is %b while it should be 100011110000", s_out);

		// Test case #607
		y_in = 12'b011111111000; //17
		x_in = 12'b000110000110; //126
		#10;
		if(s_out != 12'b100011110111) //if 143
			$display("Error: In 17+126 s_out is %b while it should be 100011110111", s_out);

		// Test case #608
		y_in = 12'b011111111111; //17
		x_in = 12'b000110000110; //127
		#10;
		if(s_out != 12'b100100001001) //if 144
			$display("Error: In 17+127 s_out is %b while it should be 100100001001", s_out);

		// Test case #609
		y_in = 12'b100010001000; //17
		x_in = 12'b000110000110; //128
		#10;
		if(s_out != 12'b100100001110) //if 145
			$display("Error: In 17+128 s_out is %b while it should be 100100001110", s_out);

		// Test case #610
		y_in = 12'b100010001111; //17
		x_in = 12'b000110000110; //129
		#10;
		if(s_out != 12'b100100010000) //if 146
			$display("Error: In 17+129 s_out is %b while it should be 100100010000", s_out);

		// Test case #611
		y_in = 12'b100010010001; //17
		x_in = 12'b000110000110; //130
		#10;
		if(s_out != 12'b100100010111) //if 147
			$display("Error: In 17+130 s_out is %b while it should be 100100010111", s_out);

		// Test case #612
		y_in = 12'b100010010110; //17
		x_in = 12'b000110000110; //131
		#10;
		if(s_out != 12'b100100100011) //if 148
			$display("Error: In 17+131 s_out is %b while it should be 100100100011", s_out);

		// Test case #613
		y_in = 12'b100010100010; //17
		x_in = 12'b000110000110; //132
		#10;
		if(s_out != 12'b100100100100) //if 149
			$display("Error: In 17+132 s_out is %b while it should be 100100100100", s_out);

		// Test case #614
		y_in = 12'b100010100101; //17
		x_in = 12'b000110000110; //133
		#10;
		if(s_out != 12'b100100111010) //if 150
			$display("Error: In 17+133 s_out is %b while it should be 100100111010", s_out);

		// Test case #615
		y_in = 12'b100010111011; //17
		x_in = 12'b000110000110; //134
		#10;
		if(s_out != 12'b100100111101) //if 151
			$display("Error: In 17+134 s_out is %b while it should be 100100111101", s_out);

		// Test case #616
		y_in = 12'b100010111100; //17
		x_in = 12'b000110000110; //135
		#10;
		if(s_out != 12'b100101000010) //if 152
			$display("Error: In 17+135 s_out is %b while it should be 100101000010", s_out);

		// Test case #617
		y_in = 12'b100011000011; //17
		x_in = 12'b000110000110; //136
		#10;
		if(s_out != 12'b100101000101) //if 153
			$display("Error: In 17+136 s_out is %b while it should be 100101000101", s_out);

		// Test case #618
		y_in = 12'b100011000100; //17
		x_in = 12'b000110000110; //137
		#10;
		if(s_out != 12'b100101011011) //if 154
			$display("Error: In 17+137 s_out is %b while it should be 100101011011", s_out);

		// Test case #619
		y_in = 12'b100011011010; //17
		x_in = 12'b000110000110; //138
		#10;
		if(s_out != 12'b100101011100) //if 155
			$display("Error: In 17+138 s_out is %b while it should be 100101011100", s_out);

		// Test case #620
		y_in = 12'b100011011101; //17
		x_in = 12'b000110000110; //139
		#10;
		if(s_out != 12'b100101101000) //if 156
			$display("Error: In 17+139 s_out is %b while it should be 100101101000", s_out);

		// Test case #621
		y_in = 12'b100011101001; //17
		x_in = 12'b000110000110; //140
		#10;
		if(s_out != 12'b100101101111) //if 157
			$display("Error: In 17+140 s_out is %b while it should be 100101101111", s_out);

		// Test case #622
		y_in = 12'b100011101110; //17
		x_in = 12'b000110000110; //141
		#10;
		if(s_out != 12'b100101110001) //if 158
			$display("Error: In 17+141 s_out is %b while it should be 100101110001", s_out);

		// Test case #623
		y_in = 12'b100011110000; //17
		x_in = 12'b000110000110; //142
		#10;
		if(s_out != 12'b100101110110) //if 159
			$display("Error: In 17+142 s_out is %b while it should be 100101110110", s_out);

		// Test case #624
		y_in = 12'b100011110111; //17
		x_in = 12'b000110000110; //143
		#10;
		if(s_out != 12'b101000001010) //if 160
			$display("Error: In 17+143 s_out is %b while it should be 101000001010", s_out);

		// Test case #625
		y_in = 12'b100100001001; //17
		x_in = 12'b000110000110; //144
		#10;
		if(s_out != 12'b101000001101) //if 161
			$display("Error: In 17+144 s_out is %b while it should be 101000001101", s_out);

		// Test case #626
		y_in = 12'b100100001110; //17
		x_in = 12'b000110000110; //145
		#10;
		if(s_out != 12'b101000010011) //if 162
			$display("Error: In 17+145 s_out is %b while it should be 101000010011", s_out);

		// Test case #627
		y_in = 12'b100100010000; //17
		x_in = 12'b000110000110; //146
		#10;
		if(s_out != 12'b101000010100) //if 163
			$display("Error: In 17+146 s_out is %b while it should be 101000010100", s_out);

		// Test case #628
		y_in = 12'b100100010111; //17
		x_in = 12'b000110000110; //147
		#10;
		if(s_out != 12'b101000100000) //if 164
			$display("Error: In 17+147 s_out is %b while it should be 101000100000", s_out);

		// Test case #629
		y_in = 12'b100100100011; //17
		x_in = 12'b000110000110; //148
		#10;
		if(s_out != 12'b101000100111) //if 165
			$display("Error: In 17+148 s_out is %b while it should be 101000100111", s_out);

		// Test case #630
		y_in = 12'b100100100100; //17
		x_in = 12'b000110000110; //149
		#10;
		if(s_out != 12'b101000111001) //if 166
			$display("Error: In 17+149 s_out is %b while it should be 101000111001", s_out);

		// Test case #631
		y_in = 12'b100100111010; //17
		x_in = 12'b000110000110; //150
		#10;
		if(s_out != 12'b101000111110) //if 167
			$display("Error: In 17+150 s_out is %b while it should be 101000111110", s_out);

		// Test case #632
		y_in = 12'b100100111101; //17
		x_in = 12'b000110000110; //151
		#10;
		if(s_out != 12'b101001000001) //if 168
			$display("Error: In 17+151 s_out is %b while it should be 101001000001", s_out);

		// Test case #633
		y_in = 12'b100101000010; //17
		x_in = 12'b000110000110; //152
		#10;
		if(s_out != 12'b101001000110) //if 169
			$display("Error: In 17+152 s_out is %b while it should be 101001000110", s_out);

		// Test case #634
		y_in = 12'b100101000101; //17
		x_in = 12'b000110000110; //153
		#10;
		if(s_out != 12'b101001011000) //if 170
			$display("Error: In 17+153 s_out is %b while it should be 101001011000", s_out);

		// Test case #635
		y_in = 12'b100101011011; //17
		x_in = 12'b000110000110; //154
		#10;
		if(s_out != 12'b101001011111) //if 171
			$display("Error: In 17+154 s_out is %b while it should be 101001011111", s_out);

		// Test case #636
		y_in = 12'b100101011100; //17
		x_in = 12'b000110000110; //155
		#10;
		if(s_out != 12'b101001101011) //if 172
			$display("Error: In 17+155 s_out is %b while it should be 101001101011", s_out);

		// Test case #637
		y_in = 12'b100101101000; //17
		x_in = 12'b000110000110; //156
		#10;
		if(s_out != 12'b101001101100) //if 173
			$display("Error: In 17+156 s_out is %b while it should be 101001101100", s_out);

		// Test case #638
		y_in = 12'b100101101111; //17
		x_in = 12'b000110000110; //157
		#10;
		if(s_out != 12'b101001110010) //if 174
			$display("Error: In 17+157 s_out is %b while it should be 101001110010", s_out);

		// Test case #639
		y_in = 12'b100101110001; //17
		x_in = 12'b000110000110; //158
		#10;
		if(s_out != 12'b101001110101) //if 175
			$display("Error: In 17+158 s_out is %b while it should be 101001110101", s_out);

		// Test case #640
		y_in = 12'b100101110110; //17
		x_in = 12'b000110000110; //159
		#10;
		if(s_out != 12'b101110001011) //if 176
			$display("Error: In 17+159 s_out is %b while it should be 101110001011", s_out);

		// Test case #641
		y_in = 12'b101000001010; //17
		x_in = 12'b000110000110; //160
		#10;
		if(s_out != 12'b101110001100) //if 177
			$display("Error: In 17+160 s_out is %b while it should be 101110001100", s_out);

		// Test case #642
		y_in = 12'b101000001101; //17
		x_in = 12'b000110000110; //161
		#10;
		if(s_out != 12'b101110010010) //if 178
			$display("Error: In 17+161 s_out is %b while it should be 101110010010", s_out);

		// Test case #643
		y_in = 12'b101000010011; //17
		x_in = 12'b000110000110; //162
		#10;
		if(s_out != 12'b101110010101) //if 179
			$display("Error: In 17+162 s_out is %b while it should be 101110010101", s_out);

		// Test case #644
		y_in = 12'b101000010100; //17
		x_in = 12'b000110000110; //163
		#10;
		if(s_out != 12'b101110100001) //if 180
			$display("Error: In 17+163 s_out is %b while it should be 101110100001", s_out);

		// Test case #645
		y_in = 12'b101000100000; //17
		x_in = 12'b000110000110; //164
		#10;
		if(s_out != 12'b101110100110) //if 181
			$display("Error: In 17+164 s_out is %b while it should be 101110100110", s_out);

		// Test case #646
		y_in = 12'b101000100111; //17
		x_in = 12'b000110000110; //165
		#10;
		if(s_out != 12'b101110111000) //if 182
			$display("Error: In 17+165 s_out is %b while it should be 101110111000", s_out);

		// Test case #647
		y_in = 12'b101000111001; //17
		x_in = 12'b000110000110; //166
		#10;
		if(s_out != 12'b101110111111) //if 183
			$display("Error: In 17+166 s_out is %b while it should be 101110111111", s_out);

		// Test case #648
		y_in = 12'b101000111110; //17
		x_in = 12'b000110000110; //167
		#10;
		if(s_out != 12'b101111000000) //if 184
			$display("Error: In 17+167 s_out is %b while it should be 101111000000", s_out);

		// Test case #649
		y_in = 12'b101001000001; //17
		x_in = 12'b000110000110; //168
		#10;
		if(s_out != 12'b101111000111) //if 185
			$display("Error: In 17+168 s_out is %b while it should be 101111000111", s_out);

		// Test case #650
		y_in = 12'b101001000110; //17
		x_in = 12'b000110000110; //169
		#10;
		if(s_out != 12'b101111011001) //if 186
			$display("Error: In 17+169 s_out is %b while it should be 101111011001", s_out);

		// Test case #651
		y_in = 12'b101001011000; //17
		x_in = 12'b000110000110; //170
		#10;
		if(s_out != 12'b101111011110) //if 187
			$display("Error: In 17+170 s_out is %b while it should be 101111011110", s_out);

		// Test case #652
		y_in = 12'b101001011111; //17
		x_in = 12'b000110000110; //171
		#10;
		if(s_out != 12'b101111101010) //if 188
			$display("Error: In 17+171 s_out is %b while it should be 101111101010", s_out);

		// Test case #653
		y_in = 12'b101001101011; //17
		x_in = 12'b000110000110; //172
		#10;
		if(s_out != 12'b101111101101) //if 189
			$display("Error: In 17+172 s_out is %b while it should be 101111101101", s_out);

		// Test case #654
		y_in = 12'b101001101100; //17
		x_in = 12'b000110000110; //173
		#10;
		if(s_out != 12'b101111110011) //if 190
			$display("Error: In 17+173 s_out is %b while it should be 101111110011", s_out);

		// Test case #655
		y_in = 12'b101001110010; //17
		x_in = 12'b000110000110; //174
		#10;
		if(s_out != 12'b101111110100) //if 191
			$display("Error: In 17+174 s_out is %b while it should be 101111110100", s_out);

		// Test case #656
		y_in = 12'b101001110101; //17
		x_in = 12'b000110000110; //175
		#10;
		if(s_out != 12'b110000001011) //if 192
			$display("Error: In 17+175 s_out is %b while it should be 110000001011", s_out);

		// Test case #657
		y_in = 12'b101110001011; //17
		x_in = 12'b000110000110; //176
		#10;
		if(s_out != 12'b110000001100) //if 193
			$display("Error: In 17+176 s_out is %b while it should be 110000001100", s_out);

		// Test case #658
		y_in = 12'b101110001100; //17
		x_in = 12'b000110000110; //177
		#10;
		if(s_out != 12'b110000010010) //if 194
			$display("Error: In 17+177 s_out is %b while it should be 110000010010", s_out);

		// Test case #659
		y_in = 12'b101110010010; //17
		x_in = 12'b000110000110; //178
		#10;
		if(s_out != 12'b110000010101) //if 195
			$display("Error: In 17+178 s_out is %b while it should be 110000010101", s_out);

		// Test case #660
		y_in = 12'b101110010101; //17
		x_in = 12'b000110000110; //179
		#10;
		if(s_out != 12'b110000100001) //if 196
			$display("Error: In 17+179 s_out is %b while it should be 110000100001", s_out);

		// Test case #661
		y_in = 12'b101110100001; //17
		x_in = 12'b000110000110; //180
		#10;
		if(s_out != 12'b110000100110) //if 197
			$display("Error: In 17+180 s_out is %b while it should be 110000100110", s_out);

		// Test case #662
		y_in = 12'b101110100110; //17
		x_in = 12'b000110000110; //181
		#10;
		if(s_out != 12'b110000111000) //if 198
			$display("Error: In 17+181 s_out is %b while it should be 110000111000", s_out);

		// Test case #663
		y_in = 12'b101110111000; //17
		x_in = 12'b000110000110; //182
		#10;
		if(s_out != 12'b110000111111) //if 199
			$display("Error: In 17+182 s_out is %b while it should be 110000111111", s_out);

		// Test case #664
		y_in = 12'b101110111111; //17
		x_in = 12'b000110000110; //183
		#10;
		if(s_out != 12'b110001000000) //if 200
			$display("Error: In 17+183 s_out is %b while it should be 110001000000", s_out);

		// Test case #665
		y_in = 12'b101111000000; //17
		x_in = 12'b000110000110; //184
		#10;
		if(s_out != 12'b110001000111) //if 201
			$display("Error: In 17+184 s_out is %b while it should be 110001000111", s_out);

		// Test case #666
		y_in = 12'b101111000111; //17
		x_in = 12'b000110000110; //185
		#10;
		if(s_out != 12'b110001011001) //if 202
			$display("Error: In 17+185 s_out is %b while it should be 110001011001", s_out);

		// Test case #667
		y_in = 12'b101111011001; //17
		x_in = 12'b000110000110; //186
		#10;
		if(s_out != 12'b110001011110) //if 203
			$display("Error: In 17+186 s_out is %b while it should be 110001011110", s_out);

		// Test case #668
		y_in = 12'b101111011110; //17
		x_in = 12'b000110000110; //187
		#10;
		if(s_out != 12'b110001101010) //if 204
			$display("Error: In 17+187 s_out is %b while it should be 110001101010", s_out);

		// Test case #669
		y_in = 12'b101111101010; //17
		x_in = 12'b000110000110; //188
		#10;
		if(s_out != 12'b110001101101) //if 205
			$display("Error: In 17+188 s_out is %b while it should be 110001101101", s_out);

		// Test case #670
		y_in = 12'b101111101101; //17
		x_in = 12'b000110000110; //189
		#10;
		if(s_out != 12'b110001110011) //if 206
			$display("Error: In 17+189 s_out is %b while it should be 110001110011", s_out);

		// Test case #671
		y_in = 12'b101111110011; //17
		x_in = 12'b000110000110; //190
		#10;
		if(s_out != 12'b110001110100) //if 207
			$display("Error: In 17+190 s_out is %b while it should be 110001110100", s_out);

		// Test case #672
		y_in = 12'b101111110100; //17
		x_in = 12'b000110000110; //191
		#10;
		if(s_out != 12'b110110001010) //if 208
			$display("Error: In 17+191 s_out is %b while it should be 110110001010", s_out);

		// Test case #673
		y_in = 12'b110000001011; //17
		x_in = 12'b000110000110; //192
		#10;
		if(s_out != 12'b110110001101) //if 209
			$display("Error: In 17+192 s_out is %b while it should be 110110001101", s_out);

		// Test case #674
		y_in = 12'b110000001100; //17
		x_in = 12'b000110000110; //193
		#10;
		if(s_out != 12'b110110010011) //if 210
			$display("Error: In 17+193 s_out is %b while it should be 110110010011", s_out);

		// Test case #675
		y_in = 12'b110000010010; //17
		x_in = 12'b000110000110; //194
		#10;
		if(s_out != 12'b110110010100) //if 211
			$display("Error: In 17+194 s_out is %b while it should be 110110010100", s_out);

		// Test case #676
		y_in = 12'b110000010101; //17
		x_in = 12'b000110000110; //195
		#10;
		if(s_out != 12'b110110100000) //if 212
			$display("Error: In 17+195 s_out is %b while it should be 110110100000", s_out);

		// Test case #677
		y_in = 12'b110000100001; //17
		x_in = 12'b000110000110; //196
		#10;
		if(s_out != 12'b110110100111) //if 213
			$display("Error: In 17+196 s_out is %b while it should be 110110100111", s_out);

		// Test case #678
		y_in = 12'b110000100110; //17
		x_in = 12'b000110000110; //197
		#10;
		if(s_out != 12'b110110111001) //if 214
			$display("Error: In 17+197 s_out is %b while it should be 110110111001", s_out);

		// Test case #679
		y_in = 12'b110000111000; //17
		x_in = 12'b000110000110; //198
		#10;
		if(s_out != 12'b110110111110) //if 215
			$display("Error: In 17+198 s_out is %b while it should be 110110111110", s_out);

		// Test case #680
		y_in = 12'b110000111111; //17
		x_in = 12'b000110000110; //199
		#10;
		if(s_out != 12'b110111000001) //if 216
			$display("Error: In 17+199 s_out is %b while it should be 110111000001", s_out);

		// Test case #681
		y_in = 12'b110001000000; //17
		x_in = 12'b000110000110; //200
		#10;
		if(s_out != 12'b110111000110) //if 217
			$display("Error: In 17+200 s_out is %b while it should be 110111000110", s_out);

		// Test case #682
		y_in = 12'b110001000111; //17
		x_in = 12'b000110000110; //201
		#10;
		if(s_out != 12'b110111011000) //if 218
			$display("Error: In 17+201 s_out is %b while it should be 110111011000", s_out);

		// Test case #683
		y_in = 12'b110001011001; //17
		x_in = 12'b000110000110; //202
		#10;
		if(s_out != 12'b110111011111) //if 219
			$display("Error: In 17+202 s_out is %b while it should be 110111011111", s_out);

		// Test case #684
		y_in = 12'b110001011110; //17
		x_in = 12'b000110000110; //203
		#10;
		if(s_out != 12'b110111101011) //if 220
			$display("Error: In 17+203 s_out is %b while it should be 110111101011", s_out);

		// Test case #685
		y_in = 12'b110001101010; //17
		x_in = 12'b000110000110; //204
		#10;
		if(s_out != 12'b110111101100) //if 221
			$display("Error: In 17+204 s_out is %b while it should be 110111101100", s_out);

		// Test case #686
		y_in = 12'b110001101101; //17
		x_in = 12'b000110000110; //205
		#10;
		if(s_out != 12'b110111110010) //if 222
			$display("Error: In 17+205 s_out is %b while it should be 110111110010", s_out);

		// Test case #687
		y_in = 12'b110001110011; //17
		x_in = 12'b000110000110; //206
		#10;
		if(s_out != 12'b110111110101) //if 223
			$display("Error: In 17+206 s_out is %b while it should be 110111110101", s_out);

		// Test case #688
		y_in = 12'b110001110100; //17
		x_in = 12'b000110000110; //207
		#10;
		if(s_out != 12'b111010001001) //if 224
			$display("Error: In 17+207 s_out is %b while it should be 111010001001", s_out);

		// Test case #689
		y_in = 12'b110110001010; //17
		x_in = 12'b000110000110; //208
		#10;
		if(s_out != 12'b111010001110) //if 225
			$display("Error: In 17+208 s_out is %b while it should be 111010001110", s_out);

		// Test case #690
		y_in = 12'b110110001101; //17
		x_in = 12'b000110000110; //209
		#10;
		if(s_out != 12'b111010010000) //if 226
			$display("Error: In 17+209 s_out is %b while it should be 111010010000", s_out);

		// Test case #691
		y_in = 12'b110110010011; //17
		x_in = 12'b000110000110; //210
		#10;
		if(s_out != 12'b111010010111) //if 227
			$display("Error: In 17+210 s_out is %b while it should be 111010010111", s_out);

		// Test case #692
		y_in = 12'b110110010100; //17
		x_in = 12'b000110000110; //211
		#10;
		if(s_out != 12'b111010100011) //if 228
			$display("Error: In 17+211 s_out is %b while it should be 111010100011", s_out);

		// Test case #693
		y_in = 12'b110110100000; //17
		x_in = 12'b000110000110; //212
		#10;
		if(s_out != 12'b111010100100) //if 229
			$display("Error: In 17+212 s_out is %b while it should be 111010100100", s_out);

		// Test case #694
		y_in = 12'b110110100111; //17
		x_in = 12'b000110000110; //213
		#10;
		if(s_out != 12'b111010111010) //if 230
			$display("Error: In 17+213 s_out is %b while it should be 111010111010", s_out);

		// Test case #695
		y_in = 12'b110110111001; //17
		x_in = 12'b000110000110; //214
		#10;
		if(s_out != 12'b111010111101) //if 231
			$display("Error: In 17+214 s_out is %b while it should be 111010111101", s_out);

		// Test case #696
		y_in = 12'b110110111110; //17
		x_in = 12'b000110000110; //215
		#10;
		if(s_out != 12'b111011000010) //if 232
			$display("Error: In 17+215 s_out is %b while it should be 111011000010", s_out);

		// Test case #697
		y_in = 12'b110111000001; //17
		x_in = 12'b000110000110; //216
		#10;
		if(s_out != 12'b111011000101) //if 233
			$display("Error: In 17+216 s_out is %b while it should be 111011000101", s_out);

		// Test case #698
		y_in = 12'b110111000110; //17
		x_in = 12'b000110000110; //217
		#10;
		if(s_out != 12'b111011011011) //if 234
			$display("Error: In 17+217 s_out is %b while it should be 111011011011", s_out);

		// Test case #699
		y_in = 12'b110111011000; //17
		x_in = 12'b000110000110; //218
		#10;
		if(s_out != 12'b111011011100) //if 235
			$display("Error: In 17+218 s_out is %b while it should be 111011011100", s_out);

		// Test case #700
		y_in = 12'b110111011111; //17
		x_in = 12'b000110000110; //219
		#10;
		if(s_out != 12'b111011101000) //if 236
			$display("Error: In 17+219 s_out is %b while it should be 111011101000", s_out);

		// Test case #701
		y_in = 12'b110111101011; //17
		x_in = 12'b000110000110; //220
		#10;
		if(s_out != 12'b111011101111) //if 237
			$display("Error: In 17+220 s_out is %b while it should be 111011101111", s_out);

		// Test case #702
		y_in = 12'b110111101100; //17
		x_in = 12'b000110000110; //221
		#10;
		if(s_out != 12'b111011110001) //if 238
			$display("Error: In 17+221 s_out is %b while it should be 111011110001", s_out);

		// Test case #703
		y_in = 12'b110111110010; //17
		x_in = 12'b000110000110; //222
		#10;
		if(s_out != 12'b111011110110) //if 239
			$display("Error: In 17+222 s_out is %b while it should be 111011110110", s_out);

		// Test case #704
		y_in = 12'b110111110101; //17
		x_in = 12'b000110000110; //223
		#10;
		if(s_out != 12'b111100001000) //if 240
			$display("Error: In 17+223 s_out is %b while it should be 111100001000", s_out);

		// Test case #705
		y_in = 12'b111010001001; //17
		x_in = 12'b000110000110; //224
		#10;
		if(s_out != 12'b111100001111) //if 241
			$display("Error: In 17+224 s_out is %b while it should be 111100001111", s_out);

		// Test case #706
		y_in = 12'b111010001110; //17
		x_in = 12'b000110000110; //225
		#10;
		if(s_out != 12'b111100010001) //if 242
			$display("Error: In 17+225 s_out is %b while it should be 111100010001", s_out);

		// Test case #707
		y_in = 12'b111010010000; //17
		x_in = 12'b000110000110; //226
		#10;
		if(s_out != 12'b111100010110) //if 243
			$display("Error: In 17+226 s_out is %b while it should be 111100010110", s_out);

		// Test case #708
		y_in = 12'b111010010111; //17
		x_in = 12'b000110000110; //227
		#10;
		if(s_out != 12'b111100100010) //if 244
			$display("Error: In 17+227 s_out is %b while it should be 111100100010", s_out);

		// Test case #709
		y_in = 12'b111010100011; //17
		x_in = 12'b000110000110; //228
		#10;
		if(s_out != 12'b111100100101) //if 245
			$display("Error: In 17+228 s_out is %b while it should be 111100100101", s_out);

		// Test case #710
		y_in = 12'b111010100100; //17
		x_in = 12'b000110000110; //229
		#10;
		if(s_out != 12'b111100111011) //if 246
			$display("Error: In 17+229 s_out is %b while it should be 111100111011", s_out);

		// Test case #711
		y_in = 12'b111010111010; //17
		x_in = 12'b000110000110; //230
		#10;
		if(s_out != 12'b111100111100) //if 247
			$display("Error: In 17+230 s_out is %b while it should be 111100111100", s_out);

		// Test case #712
		y_in = 12'b111010111101; //17
		x_in = 12'b000110000110; //231
		#10;
		if(s_out != 12'b111101000011) //if 248
			$display("Error: In 17+231 s_out is %b while it should be 111101000011", s_out);

		// Test case #713
		y_in = 12'b111011000010; //17
		x_in = 12'b000110000110; //232
		#10;
		if(s_out != 12'b111101000100) //if 249
			$display("Error: In 17+232 s_out is %b while it should be 111101000100", s_out);

		// Test case #714
		y_in = 12'b111011000101; //17
		x_in = 12'b000110000110; //233
		#10;
		if(s_out != 12'b111101011010) //if 250
			$display("Error: In 17+233 s_out is %b while it should be 111101011010", s_out);

		// Test case #715
		y_in = 12'b111011011011; //17
		x_in = 12'b000110000110; //234
		#10;
		if(s_out != 12'b111101011101) //if 251
			$display("Error: In 17+234 s_out is %b while it should be 111101011101", s_out);

		// Test case #716
		y_in = 12'b111011011100; //17
		x_in = 12'b000110000110; //235
		#10;
		if(s_out != 12'b111101101001) //if 252
			$display("Error: In 17+235 s_out is %b while it should be 111101101001", s_out);

		// Test case #717
		y_in = 12'b111011101000; //17
		x_in = 12'b000110000110; //236
		#10;
		if(s_out != 12'b111101101110) //if 253
			$display("Error: In 17+236 s_out is %b while it should be 111101101110", s_out);

		// Test case #718
		y_in = 12'b111011101111; //17
		x_in = 12'b000110000110; //237
		#10;
		if(s_out != 12'b111101110000) //if 254
			$display("Error: In 17+237 s_out is %b while it should be 111101110000", s_out);

		// Test case #719
		y_in = 12'b111011110001; //17
		x_in = 12'b000110000110; //238
		#10;
		if(s_out != 12'b111101110111) //if 255
			$display("Error: In 17+238 s_out is %b while it should be 111101110111", s_out);

		// Test case #720
		y_in = 12'b000000000000; //18
		x_in = 12'b000110011000; //0
		#10;
		if(s_out != 12'b000110011000) //if 18
			$display("Error: In 18+0 s_out is %b while it should be 000110011000", s_out);

		// Test case #721
		y_in = 12'b000000000111; //18
		x_in = 12'b000110011000; //1
		#10;
		if(s_out != 12'b000110011111) //if 19
			$display("Error: In 18+1 s_out is %b while it should be 000110011111", s_out);

		// Test case #722
		y_in = 12'b000000011001; //18
		x_in = 12'b000110011000; //2
		#10;
		if(s_out != 12'b000110101011) //if 20
			$display("Error: In 18+2 s_out is %b while it should be 000110101011", s_out);

		// Test case #723
		y_in = 12'b000000011110; //18
		x_in = 12'b000110011000; //3
		#10;
		if(s_out != 12'b000110101100) //if 21
			$display("Error: In 18+3 s_out is %b while it should be 000110101100", s_out);

		// Test case #724
		y_in = 12'b000000101010; //18
		x_in = 12'b000110011000; //4
		#10;
		if(s_out != 12'b000110110010) //if 22
			$display("Error: In 18+4 s_out is %b while it should be 000110110010", s_out);

		// Test case #725
		y_in = 12'b000000101101; //18
		x_in = 12'b000110011000; //5
		#10;
		if(s_out != 12'b000110110101) //if 23
			$display("Error: In 18+5 s_out is %b while it should be 000110110101", s_out);

		// Test case #726
		y_in = 12'b000000110011; //18
		x_in = 12'b000110011000; //6
		#10;
		if(s_out != 12'b000111001010) //if 24
			$display("Error: In 18+6 s_out is %b while it should be 000111001010", s_out);

		// Test case #727
		y_in = 12'b000000110100; //18
		x_in = 12'b000110011000; //7
		#10;
		if(s_out != 12'b000111001101) //if 25
			$display("Error: In 18+7 s_out is %b while it should be 000111001101", s_out);

		// Test case #728
		y_in = 12'b000001001011; //18
		x_in = 12'b000110011000; //8
		#10;
		if(s_out != 12'b000111010011) //if 26
			$display("Error: In 18+8 s_out is %b while it should be 000111010011", s_out);

		// Test case #729
		y_in = 12'b000001001100; //18
		x_in = 12'b000110011000; //9
		#10;
		if(s_out != 12'b000111010100) //if 27
			$display("Error: In 18+9 s_out is %b while it should be 000111010100", s_out);

		// Test case #730
		y_in = 12'b000001010010; //18
		x_in = 12'b000110011000; //10
		#10;
		if(s_out != 12'b000111100000) //if 28
			$display("Error: In 18+10 s_out is %b while it should be 000111100000", s_out);

		// Test case #731
		y_in = 12'b000001010101; //18
		x_in = 12'b000110011000; //11
		#10;
		if(s_out != 12'b000111100111) //if 29
			$display("Error: In 18+11 s_out is %b while it should be 000111100111", s_out);

		// Test case #732
		y_in = 12'b000001100001; //18
		x_in = 12'b000110011000; //12
		#10;
		if(s_out != 12'b000111111001) //if 30
			$display("Error: In 18+12 s_out is %b while it should be 000111111001", s_out);

		// Test case #733
		y_in = 12'b000001100110; //18
		x_in = 12'b000110011000; //13
		#10;
		if(s_out != 12'b000111111110) //if 31
			$display("Error: In 18+13 s_out is %b while it should be 000111111110", s_out);

		// Test case #734
		y_in = 12'b000001111000; //18
		x_in = 12'b000110011000; //14
		#10;
		if(s_out != 12'b001010000010) //if 32
			$display("Error: In 18+14 s_out is %b while it should be 001010000010", s_out);

		// Test case #735
		y_in = 12'b000001111111; //18
		x_in = 12'b000110011000; //15
		#10;
		if(s_out != 12'b001010000101) //if 33
			$display("Error: In 18+15 s_out is %b while it should be 001010000101", s_out);

		// Test case #736
		y_in = 12'b000110000001; //18
		x_in = 12'b000110011000; //16
		#10;
		if(s_out != 12'b001010011011) //if 34
			$display("Error: In 18+16 s_out is %b while it should be 001010011011", s_out);

		// Test case #737
		y_in = 12'b000110000110; //18
		x_in = 12'b000110011000; //17
		#10;
		if(s_out != 12'b001010011100) //if 35
			$display("Error: In 18+17 s_out is %b while it should be 001010011100", s_out);

		// Test case #738
		y_in = 12'b000110011000; //18
		x_in = 12'b000110011000; //18
		#10;
		if(s_out != 12'b001010101000) //if 36
			$display("Error: In 18+18 s_out is %b while it should be 001010101000", s_out);

		// Test case #739
		y_in = 12'b000110011111; //18
		x_in = 12'b000110011000; //19
		#10;
		if(s_out != 12'b001010101111) //if 37
			$display("Error: In 18+19 s_out is %b while it should be 001010101111", s_out);

		// Test case #740
		y_in = 12'b000110101011; //18
		x_in = 12'b000110011000; //20
		#10;
		if(s_out != 12'b001010110001) //if 38
			$display("Error: In 18+20 s_out is %b while it should be 001010110001", s_out);

		// Test case #741
		y_in = 12'b000110101100; //18
		x_in = 12'b000110011000; //21
		#10;
		if(s_out != 12'b001010110110) //if 39
			$display("Error: In 18+21 s_out is %b while it should be 001010110110", s_out);

		// Test case #742
		y_in = 12'b000110110010; //18
		x_in = 12'b000110011000; //22
		#10;
		if(s_out != 12'b001011001001) //if 40
			$display("Error: In 18+22 s_out is %b while it should be 001011001001", s_out);

		// Test case #743
		y_in = 12'b000110110101; //18
		x_in = 12'b000110011000; //23
		#10;
		if(s_out != 12'b001011001110) //if 41
			$display("Error: In 18+23 s_out is %b while it should be 001011001110", s_out);

		// Test case #744
		y_in = 12'b000111001010; //18
		x_in = 12'b000110011000; //24
		#10;
		if(s_out != 12'b001011010000) //if 42
			$display("Error: In 18+24 s_out is %b while it should be 001011010000", s_out);

		// Test case #745
		y_in = 12'b000111001101; //18
		x_in = 12'b000110011000; //25
		#10;
		if(s_out != 12'b001011010111) //if 43
			$display("Error: In 18+25 s_out is %b while it should be 001011010111", s_out);

		// Test case #746
		y_in = 12'b000111010011; //18
		x_in = 12'b000110011000; //26
		#10;
		if(s_out != 12'b001011100011) //if 44
			$display("Error: In 18+26 s_out is %b while it should be 001011100011", s_out);

		// Test case #747
		y_in = 12'b000111010100; //18
		x_in = 12'b000110011000; //27
		#10;
		if(s_out != 12'b001011100100) //if 45
			$display("Error: In 18+27 s_out is %b while it should be 001011100100", s_out);

		// Test case #748
		y_in = 12'b000111100000; //18
		x_in = 12'b000110011000; //28
		#10;
		if(s_out != 12'b001011111010) //if 46
			$display("Error: In 18+28 s_out is %b while it should be 001011111010", s_out);

		// Test case #749
		y_in = 12'b000111100111; //18
		x_in = 12'b000110011000; //29
		#10;
		if(s_out != 12'b001011111101) //if 47
			$display("Error: In 18+29 s_out is %b while it should be 001011111101", s_out);

		// Test case #750
		y_in = 12'b000111111001; //18
		x_in = 12'b000110011000; //30
		#10;
		if(s_out != 12'b001100000011) //if 48
			$display("Error: In 18+30 s_out is %b while it should be 001100000011", s_out);

		// Test case #751
		y_in = 12'b000111111110; //18
		x_in = 12'b000110011000; //31
		#10;
		if(s_out != 12'b001100000100) //if 49
			$display("Error: In 18+31 s_out is %b while it should be 001100000100", s_out);

		// Test case #752
		y_in = 12'b001010000010; //18
		x_in = 12'b000110011000; //32
		#10;
		if(s_out != 12'b001100011010) //if 50
			$display("Error: In 18+32 s_out is %b while it should be 001100011010", s_out);

		// Test case #753
		y_in = 12'b001010000101; //18
		x_in = 12'b000110011000; //33
		#10;
		if(s_out != 12'b001100011101) //if 51
			$display("Error: In 18+33 s_out is %b while it should be 001100011101", s_out);

		// Test case #754
		y_in = 12'b001010011011; //18
		x_in = 12'b000110011000; //34
		#10;
		if(s_out != 12'b001100101001) //if 52
			$display("Error: In 18+34 s_out is %b while it should be 001100101001", s_out);

		// Test case #755
		y_in = 12'b001010011100; //18
		x_in = 12'b000110011000; //35
		#10;
		if(s_out != 12'b001100101110) //if 53
			$display("Error: In 18+35 s_out is %b while it should be 001100101110", s_out);

		// Test case #756
		y_in = 12'b001010101000; //18
		x_in = 12'b000110011000; //36
		#10;
		if(s_out != 12'b001100110000) //if 54
			$display("Error: In 18+36 s_out is %b while it should be 001100110000", s_out);

		// Test case #757
		y_in = 12'b001010101111; //18
		x_in = 12'b000110011000; //37
		#10;
		if(s_out != 12'b001100110111) //if 55
			$display("Error: In 18+37 s_out is %b while it should be 001100110111", s_out);

		// Test case #758
		y_in = 12'b001010110001; //18
		x_in = 12'b000110011000; //38
		#10;
		if(s_out != 12'b001101001000) //if 56
			$display("Error: In 18+38 s_out is %b while it should be 001101001000", s_out);

		// Test case #759
		y_in = 12'b001010110110; //18
		x_in = 12'b000110011000; //39
		#10;
		if(s_out != 12'b001101001111) //if 57
			$display("Error: In 18+39 s_out is %b while it should be 001101001111", s_out);

		// Test case #760
		y_in = 12'b001011001001; //18
		x_in = 12'b000110011000; //40
		#10;
		if(s_out != 12'b001101010001) //if 58
			$display("Error: In 18+40 s_out is %b while it should be 001101010001", s_out);

		// Test case #761
		y_in = 12'b001011001110; //18
		x_in = 12'b000110011000; //41
		#10;
		if(s_out != 12'b001101010110) //if 59
			$display("Error: In 18+41 s_out is %b while it should be 001101010110", s_out);

		// Test case #762
		y_in = 12'b001011010000; //18
		x_in = 12'b000110011000; //42
		#10;
		if(s_out != 12'b001101100010) //if 60
			$display("Error: In 18+42 s_out is %b while it should be 001101100010", s_out);

		// Test case #763
		y_in = 12'b001011010111; //18
		x_in = 12'b000110011000; //43
		#10;
		if(s_out != 12'b001101100101) //if 61
			$display("Error: In 18+43 s_out is %b while it should be 001101100101", s_out);

		// Test case #764
		y_in = 12'b001011100011; //18
		x_in = 12'b000110011000; //44
		#10;
		if(s_out != 12'b001101111011) //if 62
			$display("Error: In 18+44 s_out is %b while it should be 001101111011", s_out);

		// Test case #765
		y_in = 12'b001011100100; //18
		x_in = 12'b000110011000; //45
		#10;
		if(s_out != 12'b001101111100) //if 63
			$display("Error: In 18+45 s_out is %b while it should be 001101111100", s_out);

		// Test case #766
		y_in = 12'b001011111010; //18
		x_in = 12'b000110011000; //46
		#10;
		if(s_out != 12'b010010000011) //if 64
			$display("Error: In 18+46 s_out is %b while it should be 010010000011", s_out);

		// Test case #767
		y_in = 12'b001011111101; //18
		x_in = 12'b000110011000; //47
		#10;
		if(s_out != 12'b010010000100) //if 65
			$display("Error: In 18+47 s_out is %b while it should be 010010000100", s_out);

		// Test case #768
		y_in = 12'b001100000011; //18
		x_in = 12'b000110011000; //48
		#10;
		if(s_out != 12'b010010011010) //if 66
			$display("Error: In 18+48 s_out is %b while it should be 010010011010", s_out);

		// Test case #769
		y_in = 12'b001100000100; //18
		x_in = 12'b000110011000; //49
		#10;
		if(s_out != 12'b010010011101) //if 67
			$display("Error: In 18+49 s_out is %b while it should be 010010011101", s_out);

		// Test case #770
		y_in = 12'b001100011010; //18
		x_in = 12'b000110011000; //50
		#10;
		if(s_out != 12'b010010101001) //if 68
			$display("Error: In 18+50 s_out is %b while it should be 010010101001", s_out);

		// Test case #771
		y_in = 12'b001100011101; //18
		x_in = 12'b000110011000; //51
		#10;
		if(s_out != 12'b010010101110) //if 69
			$display("Error: In 18+51 s_out is %b while it should be 010010101110", s_out);

		// Test case #772
		y_in = 12'b001100101001; //18
		x_in = 12'b000110011000; //52
		#10;
		if(s_out != 12'b010010110000) //if 70
			$display("Error: In 18+52 s_out is %b while it should be 010010110000", s_out);

		// Test case #773
		y_in = 12'b001100101110; //18
		x_in = 12'b000110011000; //53
		#10;
		if(s_out != 12'b010010110111) //if 71
			$display("Error: In 18+53 s_out is %b while it should be 010010110111", s_out);

		// Test case #774
		y_in = 12'b001100110000; //18
		x_in = 12'b000110011000; //54
		#10;
		if(s_out != 12'b010011001000) //if 72
			$display("Error: In 18+54 s_out is %b while it should be 010011001000", s_out);

		// Test case #775
		y_in = 12'b001100110111; //18
		x_in = 12'b000110011000; //55
		#10;
		if(s_out != 12'b010011001111) //if 73
			$display("Error: In 18+55 s_out is %b while it should be 010011001111", s_out);

		// Test case #776
		y_in = 12'b001101001000; //18
		x_in = 12'b000110011000; //56
		#10;
		if(s_out != 12'b010011010001) //if 74
			$display("Error: In 18+56 s_out is %b while it should be 010011010001", s_out);

		// Test case #777
		y_in = 12'b001101001111; //18
		x_in = 12'b000110011000; //57
		#10;
		if(s_out != 12'b010011010110) //if 75
			$display("Error: In 18+57 s_out is %b while it should be 010011010110", s_out);

		// Test case #778
		y_in = 12'b001101010001; //18
		x_in = 12'b000110011000; //58
		#10;
		if(s_out != 12'b010011100010) //if 76
			$display("Error: In 18+58 s_out is %b while it should be 010011100010", s_out);

		// Test case #779
		y_in = 12'b001101010110; //18
		x_in = 12'b000110011000; //59
		#10;
		if(s_out != 12'b010011100101) //if 77
			$display("Error: In 18+59 s_out is %b while it should be 010011100101", s_out);

		// Test case #780
		y_in = 12'b001101100010; //18
		x_in = 12'b000110011000; //60
		#10;
		if(s_out != 12'b010011111011) //if 78
			$display("Error: In 18+60 s_out is %b while it should be 010011111011", s_out);

		// Test case #781
		y_in = 12'b001101100101; //18
		x_in = 12'b000110011000; //61
		#10;
		if(s_out != 12'b010011111100) //if 79
			$display("Error: In 18+61 s_out is %b while it should be 010011111100", s_out);

		// Test case #782
		y_in = 12'b001101111011; //18
		x_in = 12'b000110011000; //62
		#10;
		if(s_out != 12'b010100000010) //if 80
			$display("Error: In 18+62 s_out is %b while it should be 010100000010", s_out);

		// Test case #783
		y_in = 12'b001101111100; //18
		x_in = 12'b000110011000; //63
		#10;
		if(s_out != 12'b010100000101) //if 81
			$display("Error: In 18+63 s_out is %b while it should be 010100000101", s_out);

		// Test case #784
		y_in = 12'b010010000011; //18
		x_in = 12'b000110011000; //64
		#10;
		if(s_out != 12'b010100011011) //if 82
			$display("Error: In 18+64 s_out is %b while it should be 010100011011", s_out);

		// Test case #785
		y_in = 12'b010010000100; //18
		x_in = 12'b000110011000; //65
		#10;
		if(s_out != 12'b010100011100) //if 83
			$display("Error: In 18+65 s_out is %b while it should be 010100011100", s_out);

		// Test case #786
		y_in = 12'b010010011010; //18
		x_in = 12'b000110011000; //66
		#10;
		if(s_out != 12'b010100101000) //if 84
			$display("Error: In 18+66 s_out is %b while it should be 010100101000", s_out);

		// Test case #787
		y_in = 12'b010010011101; //18
		x_in = 12'b000110011000; //67
		#10;
		if(s_out != 12'b010100101111) //if 85
			$display("Error: In 18+67 s_out is %b while it should be 010100101111", s_out);

		// Test case #788
		y_in = 12'b010010101001; //18
		x_in = 12'b000110011000; //68
		#10;
		if(s_out != 12'b010100110001) //if 86
			$display("Error: In 18+68 s_out is %b while it should be 010100110001", s_out);

		// Test case #789
		y_in = 12'b010010101110; //18
		x_in = 12'b000110011000; //69
		#10;
		if(s_out != 12'b010100110110) //if 87
			$display("Error: In 18+69 s_out is %b while it should be 010100110110", s_out);

		// Test case #790
		y_in = 12'b010010110000; //18
		x_in = 12'b000110011000; //70
		#10;
		if(s_out != 12'b010101001001) //if 88
			$display("Error: In 18+70 s_out is %b while it should be 010101001001", s_out);

		// Test case #791
		y_in = 12'b010010110111; //18
		x_in = 12'b000110011000; //71
		#10;
		if(s_out != 12'b010101001110) //if 89
			$display("Error: In 18+71 s_out is %b while it should be 010101001110", s_out);

		// Test case #792
		y_in = 12'b010011001000; //18
		x_in = 12'b000110011000; //72
		#10;
		if(s_out != 12'b010101010000) //if 90
			$display("Error: In 18+72 s_out is %b while it should be 010101010000", s_out);

		// Test case #793
		y_in = 12'b010011001111; //18
		x_in = 12'b000110011000; //73
		#10;
		if(s_out != 12'b010101010111) //if 91
			$display("Error: In 18+73 s_out is %b while it should be 010101010111", s_out);

		// Test case #794
		y_in = 12'b010011010001; //18
		x_in = 12'b000110011000; //74
		#10;
		if(s_out != 12'b010101100011) //if 92
			$display("Error: In 18+74 s_out is %b while it should be 010101100011", s_out);

		// Test case #795
		y_in = 12'b010011010110; //18
		x_in = 12'b000110011000; //75
		#10;
		if(s_out != 12'b010101100100) //if 93
			$display("Error: In 18+75 s_out is %b while it should be 010101100100", s_out);

		// Test case #796
		y_in = 12'b010011100010; //18
		x_in = 12'b000110011000; //76
		#10;
		if(s_out != 12'b010101111010) //if 94
			$display("Error: In 18+76 s_out is %b while it should be 010101111010", s_out);

		// Test case #797
		y_in = 12'b010011100101; //18
		x_in = 12'b000110011000; //77
		#10;
		if(s_out != 12'b010101111101) //if 95
			$display("Error: In 18+77 s_out is %b while it should be 010101111101", s_out);

		// Test case #798
		y_in = 12'b010011111011; //18
		x_in = 12'b000110011000; //78
		#10;
		if(s_out != 12'b011000000001) //if 96
			$display("Error: In 18+78 s_out is %b while it should be 011000000001", s_out);

		// Test case #799
		y_in = 12'b010011111100; //18
		x_in = 12'b000110011000; //79
		#10;
		if(s_out != 12'b011000000110) //if 97
			$display("Error: In 18+79 s_out is %b while it should be 011000000110", s_out);

		// Test case #800
		y_in = 12'b010100000010; //18
		x_in = 12'b000110011000; //80
		#10;
		if(s_out != 12'b011000011000) //if 98
			$display("Error: In 18+80 s_out is %b while it should be 011000011000", s_out);

		// Test case #801
		y_in = 12'b010100000101; //18
		x_in = 12'b000110011000; //81
		#10;
		if(s_out != 12'b011000011111) //if 99
			$display("Error: In 18+81 s_out is %b while it should be 011000011111", s_out);

		// Test case #802
		y_in = 12'b010100011011; //18
		x_in = 12'b000110011000; //82
		#10;
		if(s_out != 12'b011000101011) //if 100
			$display("Error: In 18+82 s_out is %b while it should be 011000101011", s_out);

		// Test case #803
		y_in = 12'b010100011100; //18
		x_in = 12'b000110011000; //83
		#10;
		if(s_out != 12'b011000101100) //if 101
			$display("Error: In 18+83 s_out is %b while it should be 011000101100", s_out);

		// Test case #804
		y_in = 12'b010100101000; //18
		x_in = 12'b000110011000; //84
		#10;
		if(s_out != 12'b011000110010) //if 102
			$display("Error: In 18+84 s_out is %b while it should be 011000110010", s_out);

		// Test case #805
		y_in = 12'b010100101111; //18
		x_in = 12'b000110011000; //85
		#10;
		if(s_out != 12'b011000110101) //if 103
			$display("Error: In 18+85 s_out is %b while it should be 011000110101", s_out);

		// Test case #806
		y_in = 12'b010100110001; //18
		x_in = 12'b000110011000; //86
		#10;
		if(s_out != 12'b011001001010) //if 104
			$display("Error: In 18+86 s_out is %b while it should be 011001001010", s_out);

		// Test case #807
		y_in = 12'b010100110110; //18
		x_in = 12'b000110011000; //87
		#10;
		if(s_out != 12'b011001001101) //if 105
			$display("Error: In 18+87 s_out is %b while it should be 011001001101", s_out);

		// Test case #808
		y_in = 12'b010101001001; //18
		x_in = 12'b000110011000; //88
		#10;
		if(s_out != 12'b011001010011) //if 106
			$display("Error: In 18+88 s_out is %b while it should be 011001010011", s_out);

		// Test case #809
		y_in = 12'b010101001110; //18
		x_in = 12'b000110011000; //89
		#10;
		if(s_out != 12'b011001010100) //if 107
			$display("Error: In 18+89 s_out is %b while it should be 011001010100", s_out);

		// Test case #810
		y_in = 12'b010101010000; //18
		x_in = 12'b000110011000; //90
		#10;
		if(s_out != 12'b011001100000) //if 108
			$display("Error: In 18+90 s_out is %b while it should be 011001100000", s_out);

		// Test case #811
		y_in = 12'b010101010111; //18
		x_in = 12'b000110011000; //91
		#10;
		if(s_out != 12'b011001100111) //if 109
			$display("Error: In 18+91 s_out is %b while it should be 011001100111", s_out);

		// Test case #812
		y_in = 12'b010101100011; //18
		x_in = 12'b000110011000; //92
		#10;
		if(s_out != 12'b011001111001) //if 110
			$display("Error: In 18+92 s_out is %b while it should be 011001111001", s_out);

		// Test case #813
		y_in = 12'b010101100100; //18
		x_in = 12'b000110011000; //93
		#10;
		if(s_out != 12'b011001111110) //if 111
			$display("Error: In 18+93 s_out is %b while it should be 011001111110", s_out);

		// Test case #814
		y_in = 12'b010101111010; //18
		x_in = 12'b000110011000; //94
		#10;
		if(s_out != 12'b011110000000) //if 112
			$display("Error: In 18+94 s_out is %b while it should be 011110000000", s_out);

		// Test case #815
		y_in = 12'b010101111101; //18
		x_in = 12'b000110011000; //95
		#10;
		if(s_out != 12'b011110000111) //if 113
			$display("Error: In 18+95 s_out is %b while it should be 011110000111", s_out);

		// Test case #816
		y_in = 12'b011000000001; //18
		x_in = 12'b000110011000; //96
		#10;
		if(s_out != 12'b011110011001) //if 114
			$display("Error: In 18+96 s_out is %b while it should be 011110011001", s_out);

		// Test case #817
		y_in = 12'b011000000110; //18
		x_in = 12'b000110011000; //97
		#10;
		if(s_out != 12'b011110011110) //if 115
			$display("Error: In 18+97 s_out is %b while it should be 011110011110", s_out);

		// Test case #818
		y_in = 12'b011000011000; //18
		x_in = 12'b000110011000; //98
		#10;
		if(s_out != 12'b011110101010) //if 116
			$display("Error: In 18+98 s_out is %b while it should be 011110101010", s_out);

		// Test case #819
		y_in = 12'b011000011111; //18
		x_in = 12'b000110011000; //99
		#10;
		if(s_out != 12'b011110101101) //if 117
			$display("Error: In 18+99 s_out is %b while it should be 011110101101", s_out);

		// Test case #820
		y_in = 12'b011000101011; //18
		x_in = 12'b000110011000; //100
		#10;
		if(s_out != 12'b011110110011) //if 118
			$display("Error: In 18+100 s_out is %b while it should be 011110110011", s_out);

		// Test case #821
		y_in = 12'b011000101100; //18
		x_in = 12'b000110011000; //101
		#10;
		if(s_out != 12'b011110110100) //if 119
			$display("Error: In 18+101 s_out is %b while it should be 011110110100", s_out);

		// Test case #822
		y_in = 12'b011000110010; //18
		x_in = 12'b000110011000; //102
		#10;
		if(s_out != 12'b011111001011) //if 120
			$display("Error: In 18+102 s_out is %b while it should be 011111001011", s_out);

		// Test case #823
		y_in = 12'b011000110101; //18
		x_in = 12'b000110011000; //103
		#10;
		if(s_out != 12'b011111001100) //if 121
			$display("Error: In 18+103 s_out is %b while it should be 011111001100", s_out);

		// Test case #824
		y_in = 12'b011001001010; //18
		x_in = 12'b000110011000; //104
		#10;
		if(s_out != 12'b011111010010) //if 122
			$display("Error: In 18+104 s_out is %b while it should be 011111010010", s_out);

		// Test case #825
		y_in = 12'b011001001101; //18
		x_in = 12'b000110011000; //105
		#10;
		if(s_out != 12'b011111010101) //if 123
			$display("Error: In 18+105 s_out is %b while it should be 011111010101", s_out);

		// Test case #826
		y_in = 12'b011001010011; //18
		x_in = 12'b000110011000; //106
		#10;
		if(s_out != 12'b011111100001) //if 124
			$display("Error: In 18+106 s_out is %b while it should be 011111100001", s_out);

		// Test case #827
		y_in = 12'b011001010100; //18
		x_in = 12'b000110011000; //107
		#10;
		if(s_out != 12'b011111100110) //if 125
			$display("Error: In 18+107 s_out is %b while it should be 011111100110", s_out);

		// Test case #828
		y_in = 12'b011001100000; //18
		x_in = 12'b000110011000; //108
		#10;
		if(s_out != 12'b011111111000) //if 126
			$display("Error: In 18+108 s_out is %b while it should be 011111111000", s_out);

		// Test case #829
		y_in = 12'b011001100111; //18
		x_in = 12'b000110011000; //109
		#10;
		if(s_out != 12'b011111111111) //if 127
			$display("Error: In 18+109 s_out is %b while it should be 011111111111", s_out);

		// Test case #830
		y_in = 12'b011001111001; //18
		x_in = 12'b000110011000; //110
		#10;
		if(s_out != 12'b100010001000) //if 128
			$display("Error: In 18+110 s_out is %b while it should be 100010001000", s_out);

		// Test case #831
		y_in = 12'b011001111110; //18
		x_in = 12'b000110011000; //111
		#10;
		if(s_out != 12'b100010001111) //if 129
			$display("Error: In 18+111 s_out is %b while it should be 100010001111", s_out);

		// Test case #832
		y_in = 12'b011110000000; //18
		x_in = 12'b000110011000; //112
		#10;
		if(s_out != 12'b100010010001) //if 130
			$display("Error: In 18+112 s_out is %b while it should be 100010010001", s_out);

		// Test case #833
		y_in = 12'b011110000111; //18
		x_in = 12'b000110011000; //113
		#10;
		if(s_out != 12'b100010010110) //if 131
			$display("Error: In 18+113 s_out is %b while it should be 100010010110", s_out);

		// Test case #834
		y_in = 12'b011110011001; //18
		x_in = 12'b000110011000; //114
		#10;
		if(s_out != 12'b100010100010) //if 132
			$display("Error: In 18+114 s_out is %b while it should be 100010100010", s_out);

		// Test case #835
		y_in = 12'b011110011110; //18
		x_in = 12'b000110011000; //115
		#10;
		if(s_out != 12'b100010100101) //if 133
			$display("Error: In 18+115 s_out is %b while it should be 100010100101", s_out);

		// Test case #836
		y_in = 12'b011110101010; //18
		x_in = 12'b000110011000; //116
		#10;
		if(s_out != 12'b100010111011) //if 134
			$display("Error: In 18+116 s_out is %b while it should be 100010111011", s_out);

		// Test case #837
		y_in = 12'b011110101101; //18
		x_in = 12'b000110011000; //117
		#10;
		if(s_out != 12'b100010111100) //if 135
			$display("Error: In 18+117 s_out is %b while it should be 100010111100", s_out);

		// Test case #838
		y_in = 12'b011110110011; //18
		x_in = 12'b000110011000; //118
		#10;
		if(s_out != 12'b100011000011) //if 136
			$display("Error: In 18+118 s_out is %b while it should be 100011000011", s_out);

		// Test case #839
		y_in = 12'b011110110100; //18
		x_in = 12'b000110011000; //119
		#10;
		if(s_out != 12'b100011000100) //if 137
			$display("Error: In 18+119 s_out is %b while it should be 100011000100", s_out);

		// Test case #840
		y_in = 12'b011111001011; //18
		x_in = 12'b000110011000; //120
		#10;
		if(s_out != 12'b100011011010) //if 138
			$display("Error: In 18+120 s_out is %b while it should be 100011011010", s_out);

		// Test case #841
		y_in = 12'b011111001100; //18
		x_in = 12'b000110011000; //121
		#10;
		if(s_out != 12'b100011011101) //if 139
			$display("Error: In 18+121 s_out is %b while it should be 100011011101", s_out);

		// Test case #842
		y_in = 12'b011111010010; //18
		x_in = 12'b000110011000; //122
		#10;
		if(s_out != 12'b100011101001) //if 140
			$display("Error: In 18+122 s_out is %b while it should be 100011101001", s_out);

		// Test case #843
		y_in = 12'b011111010101; //18
		x_in = 12'b000110011000; //123
		#10;
		if(s_out != 12'b100011101110) //if 141
			$display("Error: In 18+123 s_out is %b while it should be 100011101110", s_out);

		// Test case #844
		y_in = 12'b011111100001; //18
		x_in = 12'b000110011000; //124
		#10;
		if(s_out != 12'b100011110000) //if 142
			$display("Error: In 18+124 s_out is %b while it should be 100011110000", s_out);

		// Test case #845
		y_in = 12'b011111100110; //18
		x_in = 12'b000110011000; //125
		#10;
		if(s_out != 12'b100011110111) //if 143
			$display("Error: In 18+125 s_out is %b while it should be 100011110111", s_out);

		// Test case #846
		y_in = 12'b011111111000; //18
		x_in = 12'b000110011000; //126
		#10;
		if(s_out != 12'b100100001001) //if 144
			$display("Error: In 18+126 s_out is %b while it should be 100100001001", s_out);

		// Test case #847
		y_in = 12'b011111111111; //18
		x_in = 12'b000110011000; //127
		#10;
		if(s_out != 12'b100100001110) //if 145
			$display("Error: In 18+127 s_out is %b while it should be 100100001110", s_out);

		// Test case #848
		y_in = 12'b100010001000; //18
		x_in = 12'b000110011000; //128
		#10;
		if(s_out != 12'b100100010000) //if 146
			$display("Error: In 18+128 s_out is %b while it should be 100100010000", s_out);

		// Test case #849
		y_in = 12'b100010001111; //18
		x_in = 12'b000110011000; //129
		#10;
		if(s_out != 12'b100100010111) //if 147
			$display("Error: In 18+129 s_out is %b while it should be 100100010111", s_out);

		// Test case #850
		y_in = 12'b100010010001; //18
		x_in = 12'b000110011000; //130
		#10;
		if(s_out != 12'b100100100011) //if 148
			$display("Error: In 18+130 s_out is %b while it should be 100100100011", s_out);

		// Test case #851
		y_in = 12'b100010010110; //18
		x_in = 12'b000110011000; //131
		#10;
		if(s_out != 12'b100100100100) //if 149
			$display("Error: In 18+131 s_out is %b while it should be 100100100100", s_out);

		// Test case #852
		y_in = 12'b100010100010; //18
		x_in = 12'b000110011000; //132
		#10;
		if(s_out != 12'b100100111010) //if 150
			$display("Error: In 18+132 s_out is %b while it should be 100100111010", s_out);

		// Test case #853
		y_in = 12'b100010100101; //18
		x_in = 12'b000110011000; //133
		#10;
		if(s_out != 12'b100100111101) //if 151
			$display("Error: In 18+133 s_out is %b while it should be 100100111101", s_out);

		// Test case #854
		y_in = 12'b100010111011; //18
		x_in = 12'b000110011000; //134
		#10;
		if(s_out != 12'b100101000010) //if 152
			$display("Error: In 18+134 s_out is %b while it should be 100101000010", s_out);

		// Test case #855
		y_in = 12'b100010111100; //18
		x_in = 12'b000110011000; //135
		#10;
		if(s_out != 12'b100101000101) //if 153
			$display("Error: In 18+135 s_out is %b while it should be 100101000101", s_out);

		// Test case #856
		y_in = 12'b100011000011; //18
		x_in = 12'b000110011000; //136
		#10;
		if(s_out != 12'b100101011011) //if 154
			$display("Error: In 18+136 s_out is %b while it should be 100101011011", s_out);

		// Test case #857
		y_in = 12'b100011000100; //18
		x_in = 12'b000110011000; //137
		#10;
		if(s_out != 12'b100101011100) //if 155
			$display("Error: In 18+137 s_out is %b while it should be 100101011100", s_out);

		// Test case #858
		y_in = 12'b100011011010; //18
		x_in = 12'b000110011000; //138
		#10;
		if(s_out != 12'b100101101000) //if 156
			$display("Error: In 18+138 s_out is %b while it should be 100101101000", s_out);

		// Test case #859
		y_in = 12'b100011011101; //18
		x_in = 12'b000110011000; //139
		#10;
		if(s_out != 12'b100101101111) //if 157
			$display("Error: In 18+139 s_out is %b while it should be 100101101111", s_out);

		// Test case #860
		y_in = 12'b100011101001; //18
		x_in = 12'b000110011000; //140
		#10;
		if(s_out != 12'b100101110001) //if 158
			$display("Error: In 18+140 s_out is %b while it should be 100101110001", s_out);

		// Test case #861
		y_in = 12'b100011101110; //18
		x_in = 12'b000110011000; //141
		#10;
		if(s_out != 12'b100101110110) //if 159
			$display("Error: In 18+141 s_out is %b while it should be 100101110110", s_out);

		// Test case #862
		y_in = 12'b100011110000; //18
		x_in = 12'b000110011000; //142
		#10;
		if(s_out != 12'b101000001010) //if 160
			$display("Error: In 18+142 s_out is %b while it should be 101000001010", s_out);

		// Test case #863
		y_in = 12'b100011110111; //18
		x_in = 12'b000110011000; //143
		#10;
		if(s_out != 12'b101000001101) //if 161
			$display("Error: In 18+143 s_out is %b while it should be 101000001101", s_out);

		// Test case #864
		y_in = 12'b100100001001; //18
		x_in = 12'b000110011000; //144
		#10;
		if(s_out != 12'b101000010011) //if 162
			$display("Error: In 18+144 s_out is %b while it should be 101000010011", s_out);

		// Test case #865
		y_in = 12'b100100001110; //18
		x_in = 12'b000110011000; //145
		#10;
		if(s_out != 12'b101000010100) //if 163
			$display("Error: In 18+145 s_out is %b while it should be 101000010100", s_out);

		// Test case #866
		y_in = 12'b100100010000; //18
		x_in = 12'b000110011000; //146
		#10;
		if(s_out != 12'b101000100000) //if 164
			$display("Error: In 18+146 s_out is %b while it should be 101000100000", s_out);

		// Test case #867
		y_in = 12'b100100010111; //18
		x_in = 12'b000110011000; //147
		#10;
		if(s_out != 12'b101000100111) //if 165
			$display("Error: In 18+147 s_out is %b while it should be 101000100111", s_out);

		// Test case #868
		y_in = 12'b100100100011; //18
		x_in = 12'b000110011000; //148
		#10;
		if(s_out != 12'b101000111001) //if 166
			$display("Error: In 18+148 s_out is %b while it should be 101000111001", s_out);

		// Test case #869
		y_in = 12'b100100100100; //18
		x_in = 12'b000110011000; //149
		#10;
		if(s_out != 12'b101000111110) //if 167
			$display("Error: In 18+149 s_out is %b while it should be 101000111110", s_out);

		// Test case #870
		y_in = 12'b100100111010; //18
		x_in = 12'b000110011000; //150
		#10;
		if(s_out != 12'b101001000001) //if 168
			$display("Error: In 18+150 s_out is %b while it should be 101001000001", s_out);

		// Test case #871
		y_in = 12'b100100111101; //18
		x_in = 12'b000110011000; //151
		#10;
		if(s_out != 12'b101001000110) //if 169
			$display("Error: In 18+151 s_out is %b while it should be 101001000110", s_out);

		// Test case #872
		y_in = 12'b100101000010; //18
		x_in = 12'b000110011000; //152
		#10;
		if(s_out != 12'b101001011000) //if 170
			$display("Error: In 18+152 s_out is %b while it should be 101001011000", s_out);

		// Test case #873
		y_in = 12'b100101000101; //18
		x_in = 12'b000110011000; //153
		#10;
		if(s_out != 12'b101001011111) //if 171
			$display("Error: In 18+153 s_out is %b while it should be 101001011111", s_out);

		// Test case #874
		y_in = 12'b100101011011; //18
		x_in = 12'b000110011000; //154
		#10;
		if(s_out != 12'b101001101011) //if 172
			$display("Error: In 18+154 s_out is %b while it should be 101001101011", s_out);

		// Test case #875
		y_in = 12'b100101011100; //18
		x_in = 12'b000110011000; //155
		#10;
		if(s_out != 12'b101001101100) //if 173
			$display("Error: In 18+155 s_out is %b while it should be 101001101100", s_out);

		// Test case #876
		y_in = 12'b100101101000; //18
		x_in = 12'b000110011000; //156
		#10;
		if(s_out != 12'b101001110010) //if 174
			$display("Error: In 18+156 s_out is %b while it should be 101001110010", s_out);

		// Test case #877
		y_in = 12'b100101101111; //18
		x_in = 12'b000110011000; //157
		#10;
		if(s_out != 12'b101001110101) //if 175
			$display("Error: In 18+157 s_out is %b while it should be 101001110101", s_out);

		// Test case #878
		y_in = 12'b100101110001; //18
		x_in = 12'b000110011000; //158
		#10;
		if(s_out != 12'b101110001011) //if 176
			$display("Error: In 18+158 s_out is %b while it should be 101110001011", s_out);

		// Test case #879
		y_in = 12'b100101110110; //18
		x_in = 12'b000110011000; //159
		#10;
		if(s_out != 12'b101110001100) //if 177
			$display("Error: In 18+159 s_out is %b while it should be 101110001100", s_out);

		// Test case #880
		y_in = 12'b101000001010; //18
		x_in = 12'b000110011000; //160
		#10;
		if(s_out != 12'b101110010010) //if 178
			$display("Error: In 18+160 s_out is %b while it should be 101110010010", s_out);

		// Test case #881
		y_in = 12'b101000001101; //18
		x_in = 12'b000110011000; //161
		#10;
		if(s_out != 12'b101110010101) //if 179
			$display("Error: In 18+161 s_out is %b while it should be 101110010101", s_out);

		// Test case #882
		y_in = 12'b101000010011; //18
		x_in = 12'b000110011000; //162
		#10;
		if(s_out != 12'b101110100001) //if 180
			$display("Error: In 18+162 s_out is %b while it should be 101110100001", s_out);

		// Test case #883
		y_in = 12'b101000010100; //18
		x_in = 12'b000110011000; //163
		#10;
		if(s_out != 12'b101110100110) //if 181
			$display("Error: In 18+163 s_out is %b while it should be 101110100110", s_out);

		// Test case #884
		y_in = 12'b101000100000; //18
		x_in = 12'b000110011000; //164
		#10;
		if(s_out != 12'b101110111000) //if 182
			$display("Error: In 18+164 s_out is %b while it should be 101110111000", s_out);

		// Test case #885
		y_in = 12'b101000100111; //18
		x_in = 12'b000110011000; //165
		#10;
		if(s_out != 12'b101110111111) //if 183
			$display("Error: In 18+165 s_out is %b while it should be 101110111111", s_out);

		// Test case #886
		y_in = 12'b101000111001; //18
		x_in = 12'b000110011000; //166
		#10;
		if(s_out != 12'b101111000000) //if 184
			$display("Error: In 18+166 s_out is %b while it should be 101111000000", s_out);

		// Test case #887
		y_in = 12'b101000111110; //18
		x_in = 12'b000110011000; //167
		#10;
		if(s_out != 12'b101111000111) //if 185
			$display("Error: In 18+167 s_out is %b while it should be 101111000111", s_out);

		// Test case #888
		y_in = 12'b101001000001; //18
		x_in = 12'b000110011000; //168
		#10;
		if(s_out != 12'b101111011001) //if 186
			$display("Error: In 18+168 s_out is %b while it should be 101111011001", s_out);

		// Test case #889
		y_in = 12'b101001000110; //18
		x_in = 12'b000110011000; //169
		#10;
		if(s_out != 12'b101111011110) //if 187
			$display("Error: In 18+169 s_out is %b while it should be 101111011110", s_out);

		// Test case #890
		y_in = 12'b101001011000; //18
		x_in = 12'b000110011000; //170
		#10;
		if(s_out != 12'b101111101010) //if 188
			$display("Error: In 18+170 s_out is %b while it should be 101111101010", s_out);

		// Test case #891
		y_in = 12'b101001011111; //18
		x_in = 12'b000110011000; //171
		#10;
		if(s_out != 12'b101111101101) //if 189
			$display("Error: In 18+171 s_out is %b while it should be 101111101101", s_out);

		// Test case #892
		y_in = 12'b101001101011; //18
		x_in = 12'b000110011000; //172
		#10;
		if(s_out != 12'b101111110011) //if 190
			$display("Error: In 18+172 s_out is %b while it should be 101111110011", s_out);

		// Test case #893
		y_in = 12'b101001101100; //18
		x_in = 12'b000110011000; //173
		#10;
		if(s_out != 12'b101111110100) //if 191
			$display("Error: In 18+173 s_out is %b while it should be 101111110100", s_out);

		// Test case #894
		y_in = 12'b101001110010; //18
		x_in = 12'b000110011000; //174
		#10;
		if(s_out != 12'b110000001011) //if 192
			$display("Error: In 18+174 s_out is %b while it should be 110000001011", s_out);

		// Test case #895
		y_in = 12'b101001110101; //18
		x_in = 12'b000110011000; //175
		#10;
		if(s_out != 12'b110000001100) //if 193
			$display("Error: In 18+175 s_out is %b while it should be 110000001100", s_out);

		// Test case #896
		y_in = 12'b101110001011; //18
		x_in = 12'b000110011000; //176
		#10;
		if(s_out != 12'b110000010010) //if 194
			$display("Error: In 18+176 s_out is %b while it should be 110000010010", s_out);

		// Test case #897
		y_in = 12'b101110001100; //18
		x_in = 12'b000110011000; //177
		#10;
		if(s_out != 12'b110000010101) //if 195
			$display("Error: In 18+177 s_out is %b while it should be 110000010101", s_out);

		// Test case #898
		y_in = 12'b101110010010; //18
		x_in = 12'b000110011000; //178
		#10;
		if(s_out != 12'b110000100001) //if 196
			$display("Error: In 18+178 s_out is %b while it should be 110000100001", s_out);

		// Test case #899
		y_in = 12'b101110010101; //18
		x_in = 12'b000110011000; //179
		#10;
		if(s_out != 12'b110000100110) //if 197
			$display("Error: In 18+179 s_out is %b while it should be 110000100110", s_out);

		// Test case #900
		y_in = 12'b101110100001; //18
		x_in = 12'b000110011000; //180
		#10;
		if(s_out != 12'b110000111000) //if 198
			$display("Error: In 18+180 s_out is %b while it should be 110000111000", s_out);

		// Test case #901
		y_in = 12'b101110100110; //18
		x_in = 12'b000110011000; //181
		#10;
		if(s_out != 12'b110000111111) //if 199
			$display("Error: In 18+181 s_out is %b while it should be 110000111111", s_out);

		// Test case #902
		y_in = 12'b101110111000; //18
		x_in = 12'b000110011000; //182
		#10;
		if(s_out != 12'b110001000000) //if 200
			$display("Error: In 18+182 s_out is %b while it should be 110001000000", s_out);

		// Test case #903
		y_in = 12'b101110111111; //18
		x_in = 12'b000110011000; //183
		#10;
		if(s_out != 12'b110001000111) //if 201
			$display("Error: In 18+183 s_out is %b while it should be 110001000111", s_out);

		// Test case #904
		y_in = 12'b101111000000; //18
		x_in = 12'b000110011000; //184
		#10;
		if(s_out != 12'b110001011001) //if 202
			$display("Error: In 18+184 s_out is %b while it should be 110001011001", s_out);

		// Test case #905
		y_in = 12'b101111000111; //18
		x_in = 12'b000110011000; //185
		#10;
		if(s_out != 12'b110001011110) //if 203
			$display("Error: In 18+185 s_out is %b while it should be 110001011110", s_out);

		// Test case #906
		y_in = 12'b101111011001; //18
		x_in = 12'b000110011000; //186
		#10;
		if(s_out != 12'b110001101010) //if 204
			$display("Error: In 18+186 s_out is %b while it should be 110001101010", s_out);

		// Test case #907
		y_in = 12'b101111011110; //18
		x_in = 12'b000110011000; //187
		#10;
		if(s_out != 12'b110001101101) //if 205
			$display("Error: In 18+187 s_out is %b while it should be 110001101101", s_out);

		// Test case #908
		y_in = 12'b101111101010; //18
		x_in = 12'b000110011000; //188
		#10;
		if(s_out != 12'b110001110011) //if 206
			$display("Error: In 18+188 s_out is %b while it should be 110001110011", s_out);

		// Test case #909
		y_in = 12'b101111101101; //18
		x_in = 12'b000110011000; //189
		#10;
		if(s_out != 12'b110001110100) //if 207
			$display("Error: In 18+189 s_out is %b while it should be 110001110100", s_out);

		// Test case #910
		y_in = 12'b101111110011; //18
		x_in = 12'b000110011000; //190
		#10;
		if(s_out != 12'b110110001010) //if 208
			$display("Error: In 18+190 s_out is %b while it should be 110110001010", s_out);

		// Test case #911
		y_in = 12'b101111110100; //18
		x_in = 12'b000110011000; //191
		#10;
		if(s_out != 12'b110110001101) //if 209
			$display("Error: In 18+191 s_out is %b while it should be 110110001101", s_out);

		// Test case #912
		y_in = 12'b110000001011; //18
		x_in = 12'b000110011000; //192
		#10;
		if(s_out != 12'b110110010011) //if 210
			$display("Error: In 18+192 s_out is %b while it should be 110110010011", s_out);

		// Test case #913
		y_in = 12'b110000001100; //18
		x_in = 12'b000110011000; //193
		#10;
		if(s_out != 12'b110110010100) //if 211
			$display("Error: In 18+193 s_out is %b while it should be 110110010100", s_out);

		// Test case #914
		y_in = 12'b110000010010; //18
		x_in = 12'b000110011000; //194
		#10;
		if(s_out != 12'b110110100000) //if 212
			$display("Error: In 18+194 s_out is %b while it should be 110110100000", s_out);

		// Test case #915
		y_in = 12'b110000010101; //18
		x_in = 12'b000110011000; //195
		#10;
		if(s_out != 12'b110110100111) //if 213
			$display("Error: In 18+195 s_out is %b while it should be 110110100111", s_out);

		// Test case #916
		y_in = 12'b110000100001; //18
		x_in = 12'b000110011000; //196
		#10;
		if(s_out != 12'b110110111001) //if 214
			$display("Error: In 18+196 s_out is %b while it should be 110110111001", s_out);

		// Test case #917
		y_in = 12'b110000100110; //18
		x_in = 12'b000110011000; //197
		#10;
		if(s_out != 12'b110110111110) //if 215
			$display("Error: In 18+197 s_out is %b while it should be 110110111110", s_out);

		// Test case #918
		y_in = 12'b110000111000; //18
		x_in = 12'b000110011000; //198
		#10;
		if(s_out != 12'b110111000001) //if 216
			$display("Error: In 18+198 s_out is %b while it should be 110111000001", s_out);

		// Test case #919
		y_in = 12'b110000111111; //18
		x_in = 12'b000110011000; //199
		#10;
		if(s_out != 12'b110111000110) //if 217
			$display("Error: In 18+199 s_out is %b while it should be 110111000110", s_out);

		// Test case #920
		y_in = 12'b110001000000; //18
		x_in = 12'b000110011000; //200
		#10;
		if(s_out != 12'b110111011000) //if 218
			$display("Error: In 18+200 s_out is %b while it should be 110111011000", s_out);

		// Test case #921
		y_in = 12'b110001000111; //18
		x_in = 12'b000110011000; //201
		#10;
		if(s_out != 12'b110111011111) //if 219
			$display("Error: In 18+201 s_out is %b while it should be 110111011111", s_out);

		// Test case #922
		y_in = 12'b110001011001; //18
		x_in = 12'b000110011000; //202
		#10;
		if(s_out != 12'b110111101011) //if 220
			$display("Error: In 18+202 s_out is %b while it should be 110111101011", s_out);

		// Test case #923
		y_in = 12'b110001011110; //18
		x_in = 12'b000110011000; //203
		#10;
		if(s_out != 12'b110111101100) //if 221
			$display("Error: In 18+203 s_out is %b while it should be 110111101100", s_out);

		// Test case #924
		y_in = 12'b110001101010; //18
		x_in = 12'b000110011000; //204
		#10;
		if(s_out != 12'b110111110010) //if 222
			$display("Error: In 18+204 s_out is %b while it should be 110111110010", s_out);

		// Test case #925
		y_in = 12'b110001101101; //18
		x_in = 12'b000110011000; //205
		#10;
		if(s_out != 12'b110111110101) //if 223
			$display("Error: In 18+205 s_out is %b while it should be 110111110101", s_out);

		// Test case #926
		y_in = 12'b110001110011; //18
		x_in = 12'b000110011000; //206
		#10;
		if(s_out != 12'b111010001001) //if 224
			$display("Error: In 18+206 s_out is %b while it should be 111010001001", s_out);

		// Test case #927
		y_in = 12'b110001110100; //18
		x_in = 12'b000110011000; //207
		#10;
		if(s_out != 12'b111010001110) //if 225
			$display("Error: In 18+207 s_out is %b while it should be 111010001110", s_out);

		// Test case #928
		y_in = 12'b110110001010; //18
		x_in = 12'b000110011000; //208
		#10;
		if(s_out != 12'b111010010000) //if 226
			$display("Error: In 18+208 s_out is %b while it should be 111010010000", s_out);

		// Test case #929
		y_in = 12'b110110001101; //18
		x_in = 12'b000110011000; //209
		#10;
		if(s_out != 12'b111010010111) //if 227
			$display("Error: In 18+209 s_out is %b while it should be 111010010111", s_out);

		// Test case #930
		y_in = 12'b110110010011; //18
		x_in = 12'b000110011000; //210
		#10;
		if(s_out != 12'b111010100011) //if 228
			$display("Error: In 18+210 s_out is %b while it should be 111010100011", s_out);

		// Test case #931
		y_in = 12'b110110010100; //18
		x_in = 12'b000110011000; //211
		#10;
		if(s_out != 12'b111010100100) //if 229
			$display("Error: In 18+211 s_out is %b while it should be 111010100100", s_out);

		// Test case #932
		y_in = 12'b110110100000; //18
		x_in = 12'b000110011000; //212
		#10;
		if(s_out != 12'b111010111010) //if 230
			$display("Error: In 18+212 s_out is %b while it should be 111010111010", s_out);

		// Test case #933
		y_in = 12'b110110100111; //18
		x_in = 12'b000110011000; //213
		#10;
		if(s_out != 12'b111010111101) //if 231
			$display("Error: In 18+213 s_out is %b while it should be 111010111101", s_out);

		// Test case #934
		y_in = 12'b110110111001; //18
		x_in = 12'b000110011000; //214
		#10;
		if(s_out != 12'b111011000010) //if 232
			$display("Error: In 18+214 s_out is %b while it should be 111011000010", s_out);

		// Test case #935
		y_in = 12'b110110111110; //18
		x_in = 12'b000110011000; //215
		#10;
		if(s_out != 12'b111011000101) //if 233
			$display("Error: In 18+215 s_out is %b while it should be 111011000101", s_out);

		// Test case #936
		y_in = 12'b110111000001; //18
		x_in = 12'b000110011000; //216
		#10;
		if(s_out != 12'b111011011011) //if 234
			$display("Error: In 18+216 s_out is %b while it should be 111011011011", s_out);

		// Test case #937
		y_in = 12'b110111000110; //18
		x_in = 12'b000110011000; //217
		#10;
		if(s_out != 12'b111011011100) //if 235
			$display("Error: In 18+217 s_out is %b while it should be 111011011100", s_out);

		// Test case #938
		y_in = 12'b110111011000; //18
		x_in = 12'b000110011000; //218
		#10;
		if(s_out != 12'b111011101000) //if 236
			$display("Error: In 18+218 s_out is %b while it should be 111011101000", s_out);

		// Test case #939
		y_in = 12'b110111011111; //18
		x_in = 12'b000110011000; //219
		#10;
		if(s_out != 12'b111011101111) //if 237
			$display("Error: In 18+219 s_out is %b while it should be 111011101111", s_out);

		// Test case #940
		y_in = 12'b110111101011; //18
		x_in = 12'b000110011000; //220
		#10;
		if(s_out != 12'b111011110001) //if 238
			$display("Error: In 18+220 s_out is %b while it should be 111011110001", s_out);

		// Test case #941
		y_in = 12'b110111101100; //18
		x_in = 12'b000110011000; //221
		#10;
		if(s_out != 12'b111011110110) //if 239
			$display("Error: In 18+221 s_out is %b while it should be 111011110110", s_out);

		// Test case #942
		y_in = 12'b110111110010; //18
		x_in = 12'b000110011000; //222
		#10;
		if(s_out != 12'b111100001000) //if 240
			$display("Error: In 18+222 s_out is %b while it should be 111100001000", s_out);

		// Test case #943
		y_in = 12'b110111110101; //18
		x_in = 12'b000110011000; //223
		#10;
		if(s_out != 12'b111100001111) //if 241
			$display("Error: In 18+223 s_out is %b while it should be 111100001111", s_out);

		// Test case #944
		y_in = 12'b111010001001; //18
		x_in = 12'b000110011000; //224
		#10;
		if(s_out != 12'b111100010001) //if 242
			$display("Error: In 18+224 s_out is %b while it should be 111100010001", s_out);

		// Test case #945
		y_in = 12'b111010001110; //18
		x_in = 12'b000110011000; //225
		#10;
		if(s_out != 12'b111100010110) //if 243
			$display("Error: In 18+225 s_out is %b while it should be 111100010110", s_out);

		// Test case #946
		y_in = 12'b111010010000; //18
		x_in = 12'b000110011000; //226
		#10;
		if(s_out != 12'b111100100010) //if 244
			$display("Error: In 18+226 s_out is %b while it should be 111100100010", s_out);

		// Test case #947
		y_in = 12'b111010010111; //18
		x_in = 12'b000110011000; //227
		#10;
		if(s_out != 12'b111100100101) //if 245
			$display("Error: In 18+227 s_out is %b while it should be 111100100101", s_out);

		// Test case #948
		y_in = 12'b111010100011; //18
		x_in = 12'b000110011000; //228
		#10;
		if(s_out != 12'b111100111011) //if 246
			$display("Error: In 18+228 s_out is %b while it should be 111100111011", s_out);

		// Test case #949
		y_in = 12'b111010100100; //18
		x_in = 12'b000110011000; //229
		#10;
		if(s_out != 12'b111100111100) //if 247
			$display("Error: In 18+229 s_out is %b while it should be 111100111100", s_out);

		// Test case #950
		y_in = 12'b111010111010; //18
		x_in = 12'b000110011000; //230
		#10;
		if(s_out != 12'b111101000011) //if 248
			$display("Error: In 18+230 s_out is %b while it should be 111101000011", s_out);

		// Test case #951
		y_in = 12'b111010111101; //18
		x_in = 12'b000110011000; //231
		#10;
		if(s_out != 12'b111101000100) //if 249
			$display("Error: In 18+231 s_out is %b while it should be 111101000100", s_out);

		// Test case #952
		y_in = 12'b111011000010; //18
		x_in = 12'b000110011000; //232
		#10;
		if(s_out != 12'b111101011010) //if 250
			$display("Error: In 18+232 s_out is %b while it should be 111101011010", s_out);

		// Test case #953
		y_in = 12'b111011000101; //18
		x_in = 12'b000110011000; //233
		#10;
		if(s_out != 12'b111101011101) //if 251
			$display("Error: In 18+233 s_out is %b while it should be 111101011101", s_out);

		// Test case #954
		y_in = 12'b111011011011; //18
		x_in = 12'b000110011000; //234
		#10;
		if(s_out != 12'b111101101001) //if 252
			$display("Error: In 18+234 s_out is %b while it should be 111101101001", s_out);

		// Test case #955
		y_in = 12'b111011011100; //18
		x_in = 12'b000110011000; //235
		#10;
		if(s_out != 12'b111101101110) //if 253
			$display("Error: In 18+235 s_out is %b while it should be 111101101110", s_out);

		// Test case #956
		y_in = 12'b111011101000; //18
		x_in = 12'b000110011000; //236
		#10;
		if(s_out != 12'b111101110000) //if 254
			$display("Error: In 18+236 s_out is %b while it should be 111101110000", s_out);

		// Test case #957
		y_in = 12'b111011101111; //18
		x_in = 12'b000110011000; //237
		#10;
		if(s_out != 12'b111101110111) //if 255
			$display("Error: In 18+237 s_out is %b while it should be 111101110111", s_out);

		// Test case #958
		y_in = 12'b000000000000; //19
		x_in = 12'b000110011111; //0
		#10;
		if(s_out != 12'b000110011111) //if 19
			$display("Error: In 19+0 s_out is %b while it should be 000110011111", s_out);

		// Test case #959
		y_in = 12'b000000000111; //19
		x_in = 12'b000110011111; //1
		#10;
		if(s_out != 12'b000110101011) //if 20
			$display("Error: In 19+1 s_out is %b while it should be 000110101011", s_out);

		// Test case #960
		y_in = 12'b000000011001; //19
		x_in = 12'b000110011111; //2
		#10;
		if(s_out != 12'b000110101100) //if 21
			$display("Error: In 19+2 s_out is %b while it should be 000110101100", s_out);

		// Test case #961
		y_in = 12'b000000011110; //19
		x_in = 12'b000110011111; //3
		#10;
		if(s_out != 12'b000110110010) //if 22
			$display("Error: In 19+3 s_out is %b while it should be 000110110010", s_out);

		// Test case #962
		y_in = 12'b000000101010; //19
		x_in = 12'b000110011111; //4
		#10;
		if(s_out != 12'b000110110101) //if 23
			$display("Error: In 19+4 s_out is %b while it should be 000110110101", s_out);

		// Test case #963
		y_in = 12'b000000101101; //19
		x_in = 12'b000110011111; //5
		#10;
		if(s_out != 12'b000111001010) //if 24
			$display("Error: In 19+5 s_out is %b while it should be 000111001010", s_out);

		// Test case #964
		y_in = 12'b000000110011; //19
		x_in = 12'b000110011111; //6
		#10;
		if(s_out != 12'b000111001101) //if 25
			$display("Error: In 19+6 s_out is %b while it should be 000111001101", s_out);

		// Test case #965
		y_in = 12'b000000110100; //19
		x_in = 12'b000110011111; //7
		#10;
		if(s_out != 12'b000111010011) //if 26
			$display("Error: In 19+7 s_out is %b while it should be 000111010011", s_out);

		// Test case #966
		y_in = 12'b000001001011; //19
		x_in = 12'b000110011111; //8
		#10;
		if(s_out != 12'b000111010100) //if 27
			$display("Error: In 19+8 s_out is %b while it should be 000111010100", s_out);

		// Test case #967
		y_in = 12'b000001001100; //19
		x_in = 12'b000110011111; //9
		#10;
		if(s_out != 12'b000111100000) //if 28
			$display("Error: In 19+9 s_out is %b while it should be 000111100000", s_out);

		// Test case #968
		y_in = 12'b000001010010; //19
		x_in = 12'b000110011111; //10
		#10;
		if(s_out != 12'b000111100111) //if 29
			$display("Error: In 19+10 s_out is %b while it should be 000111100111", s_out);

		// Test case #969
		y_in = 12'b000001010101; //19
		x_in = 12'b000110011111; //11
		#10;
		if(s_out != 12'b000111111001) //if 30
			$display("Error: In 19+11 s_out is %b while it should be 000111111001", s_out);

		// Test case #970
		y_in = 12'b000001100001; //19
		x_in = 12'b000110011111; //12
		#10;
		if(s_out != 12'b000111111110) //if 31
			$display("Error: In 19+12 s_out is %b while it should be 000111111110", s_out);

		// Test case #971
		y_in = 12'b000001100110; //19
		x_in = 12'b000110011111; //13
		#10;
		if(s_out != 12'b001010000010) //if 32
			$display("Error: In 19+13 s_out is %b while it should be 001010000010", s_out);

		// Test case #972
		y_in = 12'b000001111000; //19
		x_in = 12'b000110011111; //14
		#10;
		if(s_out != 12'b001010000101) //if 33
			$display("Error: In 19+14 s_out is %b while it should be 001010000101", s_out);

		// Test case #973
		y_in = 12'b000001111111; //19
		x_in = 12'b000110011111; //15
		#10;
		if(s_out != 12'b001010011011) //if 34
			$display("Error: In 19+15 s_out is %b while it should be 001010011011", s_out);

		// Test case #974
		y_in = 12'b000110000001; //19
		x_in = 12'b000110011111; //16
		#10;
		if(s_out != 12'b001010011100) //if 35
			$display("Error: In 19+16 s_out is %b while it should be 001010011100", s_out);

		// Test case #975
		y_in = 12'b000110000110; //19
		x_in = 12'b000110011111; //17
		#10;
		if(s_out != 12'b001010101000) //if 36
			$display("Error: In 19+17 s_out is %b while it should be 001010101000", s_out);

		// Test case #976
		y_in = 12'b000110011000; //19
		x_in = 12'b000110011111; //18
		#10;
		if(s_out != 12'b001010101111) //if 37
			$display("Error: In 19+18 s_out is %b while it should be 001010101111", s_out);

		// Test case #977
		y_in = 12'b000110011111; //19
		x_in = 12'b000110011111; //19
		#10;
		if(s_out != 12'b001010110001) //if 38
			$display("Error: In 19+19 s_out is %b while it should be 001010110001", s_out);

		// Test case #978
		y_in = 12'b000110101011; //19
		x_in = 12'b000110011111; //20
		#10;
		if(s_out != 12'b001010110110) //if 39
			$display("Error: In 19+20 s_out is %b while it should be 001010110110", s_out);

		// Test case #979
		y_in = 12'b000110101100; //19
		x_in = 12'b000110011111; //21
		#10;
		if(s_out != 12'b001011001001) //if 40
			$display("Error: In 19+21 s_out is %b while it should be 001011001001", s_out);

		// Test case #980
		y_in = 12'b000110110010; //19
		x_in = 12'b000110011111; //22
		#10;
		if(s_out != 12'b001011001110) //if 41
			$display("Error: In 19+22 s_out is %b while it should be 001011001110", s_out);

		// Test case #981
		y_in = 12'b000110110101; //19
		x_in = 12'b000110011111; //23
		#10;
		if(s_out != 12'b001011010000) //if 42
			$display("Error: In 19+23 s_out is %b while it should be 001011010000", s_out);

		// Test case #982
		y_in = 12'b000111001010; //19
		x_in = 12'b000110011111; //24
		#10;
		if(s_out != 12'b001011010111) //if 43
			$display("Error: In 19+24 s_out is %b while it should be 001011010111", s_out);

		// Test case #983
		y_in = 12'b000111001101; //19
		x_in = 12'b000110011111; //25
		#10;
		if(s_out != 12'b001011100011) //if 44
			$display("Error: In 19+25 s_out is %b while it should be 001011100011", s_out);

		// Test case #984
		y_in = 12'b000111010011; //19
		x_in = 12'b000110011111; //26
		#10;
		if(s_out != 12'b001011100100) //if 45
			$display("Error: In 19+26 s_out is %b while it should be 001011100100", s_out);

		// Test case #985
		y_in = 12'b000111010100; //19
		x_in = 12'b000110011111; //27
		#10;
		if(s_out != 12'b001011111010) //if 46
			$display("Error: In 19+27 s_out is %b while it should be 001011111010", s_out);

		// Test case #986
		y_in = 12'b000111100000; //19
		x_in = 12'b000110011111; //28
		#10;
		if(s_out != 12'b001011111101) //if 47
			$display("Error: In 19+28 s_out is %b while it should be 001011111101", s_out);

		// Test case #987
		y_in = 12'b000111100111; //19
		x_in = 12'b000110011111; //29
		#10;
		if(s_out != 12'b001100000011) //if 48
			$display("Error: In 19+29 s_out is %b while it should be 001100000011", s_out);

		// Test case #988
		y_in = 12'b000111111001; //19
		x_in = 12'b000110011111; //30
		#10;
		if(s_out != 12'b001100000100) //if 49
			$display("Error: In 19+30 s_out is %b while it should be 001100000100", s_out);

		// Test case #989
		y_in = 12'b000111111110; //19
		x_in = 12'b000110011111; //31
		#10;
		if(s_out != 12'b001100011010) //if 50
			$display("Error: In 19+31 s_out is %b while it should be 001100011010", s_out);

		// Test case #990
		y_in = 12'b001010000010; //19
		x_in = 12'b000110011111; //32
		#10;
		if(s_out != 12'b001100011101) //if 51
			$display("Error: In 19+32 s_out is %b while it should be 001100011101", s_out);

		// Test case #991
		y_in = 12'b001010000101; //19
		x_in = 12'b000110011111; //33
		#10;
		if(s_out != 12'b001100101001) //if 52
			$display("Error: In 19+33 s_out is %b while it should be 001100101001", s_out);

		// Test case #992
		y_in = 12'b001010011011; //19
		x_in = 12'b000110011111; //34
		#10;
		if(s_out != 12'b001100101110) //if 53
			$display("Error: In 19+34 s_out is %b while it should be 001100101110", s_out);

		// Test case #993
		y_in = 12'b001010011100; //19
		x_in = 12'b000110011111; //35
		#10;
		if(s_out != 12'b001100110000) //if 54
			$display("Error: In 19+35 s_out is %b while it should be 001100110000", s_out);

		// Test case #994
		y_in = 12'b001010101000; //19
		x_in = 12'b000110011111; //36
		#10;
		if(s_out != 12'b001100110111) //if 55
			$display("Error: In 19+36 s_out is %b while it should be 001100110111", s_out);

		// Test case #995
		y_in = 12'b001010101111; //19
		x_in = 12'b000110011111; //37
		#10;
		if(s_out != 12'b001101001000) //if 56
			$display("Error: In 19+37 s_out is %b while it should be 001101001000", s_out);

		// Test case #996
		y_in = 12'b001010110001; //19
		x_in = 12'b000110011111; //38
		#10;
		if(s_out != 12'b001101001111) //if 57
			$display("Error: In 19+38 s_out is %b while it should be 001101001111", s_out);

		// Test case #997
		y_in = 12'b001010110110; //19
		x_in = 12'b000110011111; //39
		#10;
		if(s_out != 12'b001101010001) //if 58
			$display("Error: In 19+39 s_out is %b while it should be 001101010001", s_out);

		// Test case #998
		y_in = 12'b001011001001; //19
		x_in = 12'b000110011111; //40
		#10;
		if(s_out != 12'b001101010110) //if 59
			$display("Error: In 19+40 s_out is %b while it should be 001101010110", s_out);

		// Test case #999
		y_in = 12'b001011001110; //19
		x_in = 12'b000110011111; //41
		#10;
		if(s_out != 12'b001101100010) //if 60
			$display("Error: In 19+41 s_out is %b while it should be 001101100010", s_out);

		// Test case #1000
		y_in = 12'b001011010000; //19
		x_in = 12'b000110011111; //42
		#10;
		if(s_out != 12'b001101100101) //if 61
			$display("Error: In 19+42 s_out is %b while it should be 001101100101", s_out);

		// Test case #1001
		y_in = 12'b000000000000; //20
		x_in = 12'b000110101011; //0
		#10;
		if(s_out != 12'b000110101011) //if 20
			$display("Error: In 20+0 s_out is %b while it should be 000110101011", s_out);

		// Test case #1002
		y_in = 12'b000000000000; //21
		x_in = 12'b000110101100; //0
		#10;
		if(s_out != 12'b000110101100) //if 21
			$display("Error: In 21+0 s_out is %b while it should be 000110101100", s_out);

		// Test case #1003
		y_in = 12'b000000000000; //22
		x_in = 12'b000110110010; //0
		#10;
		if(s_out != 12'b000110110010) //if 22
			$display("Error: In 22+0 s_out is %b while it should be 000110110010", s_out);

		// Test case #1004
		y_in = 12'b000000000000; //23
		x_in = 12'b000110110101; //0
		#10;
		if(s_out != 12'b000110110101) //if 23
			$display("Error: In 23+0 s_out is %b while it should be 000110110101", s_out);

		// Test case #1005
		y_in = 12'b000000000000; //24
		x_in = 12'b000111001010; //0
		#10;
		if(s_out != 12'b000111001010) //if 24
			$display("Error: In 24+0 s_out is %b while it should be 000111001010", s_out);

		// Test case #1006
		y_in = 12'b000000000000; //25
		x_in = 12'b000111001101; //0
		#10;
		if(s_out != 12'b000111001101) //if 25
			$display("Error: In 25+0 s_out is %b while it should be 000111001101", s_out);

		// Test case #1007
		y_in = 12'b000000000000; //26
		x_in = 12'b000111010011; //0
		#10;
		if(s_out != 12'b000111010011) //if 26
			$display("Error: In 26+0 s_out is %b while it should be 000111010011", s_out);

		// Test case #1008
		y_in = 12'b000000000000; //27
		x_in = 12'b000111010100; //0
		#10;
		if(s_out != 12'b000111010100) //if 27
			$display("Error: In 27+0 s_out is %b while it should be 000111010100", s_out);

		// Test case #1009
		y_in = 12'b000000000000; //28
		x_in = 12'b000111100000; //0
		#10;
		if(s_out != 12'b000111100000) //if 28
			$display("Error: In 28+0 s_out is %b while it should be 000111100000", s_out);

		// Test case #1010
		y_in = 12'b000000000000; //29
		x_in = 12'b000111100111; //0
		#10;
		if(s_out != 12'b000111100111) //if 29
			$display("Error: In 29+0 s_out is %b while it should be 000111100111", s_out);

		// Test case #1011
		y_in = 12'b000000000000; //30
		x_in = 12'b000111111001; //0
		#10;
		if(s_out != 12'b000111111001) //if 30
			$display("Error: In 30+0 s_out is %b while it should be 000111111001", s_out);

		// Test case #1012
		y_in = 12'b000000000000; //31
		x_in = 12'b000111111110; //0
		#10;
		if(s_out != 12'b000111111110) //if 31
			$display("Error: In 31+0 s_out is %b while it should be 000111111110", s_out);

		// Test case #1013
		y_in = 12'b000000000000; //32
		x_in = 12'b001010000010; //0
		#10;
		if(s_out != 12'b001010000010) //if 32
			$display("Error: In 32+0 s_out is %b while it should be 001010000010", s_out);

		// Test case #1014
		y_in = 12'b000000000000; //33
		x_in = 12'b001010000101; //0
		#10;
		if(s_out != 12'b001010000101) //if 33
			$display("Error: In 33+0 s_out is %b while it should be 001010000101", s_out);

		// Test case #1015
		y_in = 12'b000000000000; //34
		x_in = 12'b001010011011; //0
		#10;
		if(s_out != 12'b001010011011) //if 34
			$display("Error: In 34+0 s_out is %b while it should be 001010011011", s_out);

		// Test case #1016
		y_in = 12'b000000000000; //35
		x_in = 12'b001010011100; //0
		#10;
		if(s_out != 12'b001010011100) //if 35
			$display("Error: In 35+0 s_out is %b while it should be 001010011100", s_out);

		// Test case #1017
		y_in = 12'b000000000000; //36
		x_in = 12'b001010101000; //0
		#10;
		if(s_out != 12'b001010101000) //if 36
			$display("Error: In 36+0 s_out is %b while it should be 001010101000", s_out);

		// Test case #1018
		y_in = 12'b000000000000; //37
		x_in = 12'b001010101111; //0
		#10;
		if(s_out != 12'b001010101111) //if 37
			$display("Error: In 37+0 s_out is %b while it should be 001010101111", s_out);

		// Test case #1019
		y_in = 12'b000000000000; //38
		x_in = 12'b001010110001; //0
		#10;
		if(s_out != 12'b001010110001) //if 38
			$display("Error: In 38+0 s_out is %b while it should be 001010110001", s_out);

		// Test case #1020
		y_in = 12'b000000000000; //39
		x_in = 12'b001010110110; //0
		#10;
		if(s_out != 12'b001010110110) //if 39
			$display("Error: In 39+0 s_out is %b while it should be 001010110110", s_out);

		// Test case #1021
		y_in = 12'b000000000000; //40
		x_in = 12'b001011001001; //0
		#10;
		if(s_out != 12'b001011001001) //if 40
			$display("Error: In 40+0 s_out is %b while it should be 001011001001", s_out);

		// Test case #1022
		y_in = 12'b000000000000; //41
		x_in = 12'b001011001110; //0
		#10;
		if(s_out != 12'b001011001110) //if 41
			$display("Error: In 41+0 s_out is %b while it should be 001011001110", s_out);

		// Test case #1023
		y_in = 12'b000000000000; //42
		x_in = 12'b001011010000; //0
		#10;
		if(s_out != 12'b001011010000) //if 42
			$display("Error: In 42+0 s_out is %b while it should be 001011010000", s_out);

		// Test case #1024
		y_in = 12'b000000000000; //43
		x_in = 12'b001011010111; //0
		#10;
		if(s_out != 12'b001011010111) //if 43
			$display("Error: In 43+0 s_out is %b while it should be 001011010111", s_out);

		// Test case #1025
		y_in = 12'b000000000000; //44
		x_in = 12'b001011100011; //0
		#10;
		if(s_out != 12'b001011100011) //if 44
			$display("Error: In 44+0 s_out is %b while it should be 001011100011", s_out);

		// Test case #1026
		y_in = 12'b000000000000; //45
		x_in = 12'b001011100100; //0
		#10;
		if(s_out != 12'b001011100100) //if 45
			$display("Error: In 45+0 s_out is %b while it should be 001011100100", s_out);

		// Test case #1027
		y_in = 12'b000000000000; //46
		x_in = 12'b001011111010; //0
		#10;
		if(s_out != 12'b001011111010) //if 46
			$display("Error: In 46+0 s_out is %b while it should be 001011111010", s_out);

		// Test case #1028
		y_in = 12'b000000000000; //47
		x_in = 12'b001011111101; //0
		#10;
		if(s_out != 12'b001011111101) //if 47
			$display("Error: In 47+0 s_out is %b while it should be 001011111101", s_out);

		// Test case #1029
		y_in = 12'b000000000000; //48
		x_in = 12'b001100000011; //0
		#10;
		if(s_out != 12'b001100000011) //if 48
			$display("Error: In 48+0 s_out is %b while it should be 001100000011", s_out);

		// Test case #1030
		y_in = 12'b000000000000; //49
		x_in = 12'b001100000100; //0
		#10;
		if(s_out != 12'b001100000100) //if 49
			$display("Error: In 49+0 s_out is %b while it should be 001100000100", s_out);

		// Test case #1031
		y_in = 12'b000000000000; //50
		x_in = 12'b001100011010; //0
		#10;
		if(s_out != 12'b001100011010) //if 50
			$display("Error: In 50+0 s_out is %b while it should be 001100011010", s_out);

		// Test case #1032
		y_in = 12'b000000000000; //51
		x_in = 12'b001100011101; //0
		#10;
		if(s_out != 12'b001100011101) //if 51
			$display("Error: In 51+0 s_out is %b while it should be 001100011101", s_out);

		// Test case #1033
		y_in = 12'b000000000000; //52
		x_in = 12'b001100101001; //0
		#10;
		if(s_out != 12'b001100101001) //if 52
			$display("Error: In 52+0 s_out is %b while it should be 001100101001", s_out);

		// Test case #1034
		y_in = 12'b000000000000; //53
		x_in = 12'b001100101110; //0
		#10;
		if(s_out != 12'b001100101110) //if 53
			$display("Error: In 53+0 s_out is %b while it should be 001100101110", s_out);

		// Test case #1035
		y_in = 12'b000000000000; //54
		x_in = 12'b001100110000; //0
		#10;
		if(s_out != 12'b001100110000) //if 54
			$display("Error: In 54+0 s_out is %b while it should be 001100110000", s_out);

		// Test case #1036
		y_in = 12'b000000000000; //55
		x_in = 12'b001100110111; //0
		#10;
		if(s_out != 12'b001100110111) //if 55
			$display("Error: In 55+0 s_out is %b while it should be 001100110111", s_out);

		// Test case #1037
		y_in = 12'b000000000000; //56
		x_in = 12'b001101001000; //0
		#10;
		if(s_out != 12'b001101001000) //if 56
			$display("Error: In 56+0 s_out is %b while it should be 001101001000", s_out);

		// Test case #1038
		y_in = 12'b000000000000; //57
		x_in = 12'b001101001111; //0
		#10;
		if(s_out != 12'b001101001111) //if 57
			$display("Error: In 57+0 s_out is %b while it should be 001101001111", s_out);

		// Test case #1039
		y_in = 12'b000000000000; //58
		x_in = 12'b001101010001; //0
		#10;
		if(s_out != 12'b001101010001) //if 58
			$display("Error: In 58+0 s_out is %b while it should be 001101010001", s_out);

		// Test case #1040
		y_in = 12'b000000000000; //59
		x_in = 12'b001101010110; //0
		#10;
		if(s_out != 12'b001101010110) //if 59
			$display("Error: In 59+0 s_out is %b while it should be 001101010110", s_out);

		// Test case #1041
		y_in = 12'b000000000000; //60
		x_in = 12'b001101100010; //0
		#10;
		if(s_out != 12'b001101100010) //if 60
			$display("Error: In 60+0 s_out is %b while it should be 001101100010", s_out);

		// Test case #1042
		y_in = 12'b000000000000; //61
		x_in = 12'b001101100101; //0
		#10;
		if(s_out != 12'b001101100101) //if 61
			$display("Error: In 61+0 s_out is %b while it should be 001101100101", s_out);

		// Test case #1043
		y_in = 12'b000000000000; //62
		x_in = 12'b001101111011; //0
		#10;
		if(s_out != 12'b001101111011) //if 62
			$display("Error: In 62+0 s_out is %b while it should be 001101111011", s_out);

		// Test case #1044
		y_in = 12'b000000000000; //63
		x_in = 12'b001101111100; //0
		#10;
		if(s_out != 12'b001101111100) //if 63
			$display("Error: In 63+0 s_out is %b while it should be 001101111100", s_out);

		// Test case #1045
		y_in = 12'b000000000000; //64
		x_in = 12'b010010000011; //0
		#10;
		if(s_out != 12'b010010000011) //if 64
			$display("Error: In 64+0 s_out is %b while it should be 010010000011", s_out);

		// Test case #1046
		y_in = 12'b000000000000; //65
		x_in = 12'b010010000100; //0
		#10;
		if(s_out != 12'b010010000100) //if 65
			$display("Error: In 65+0 s_out is %b while it should be 010010000100", s_out);

		// Test case #1047
		y_in = 12'b000000000000; //66
		x_in = 12'b010010011010; //0
		#10;
		if(s_out != 12'b010010011010) //if 66
			$display("Error: In 66+0 s_out is %b while it should be 010010011010", s_out);

		// Test case #1048
		y_in = 12'b000000000000; //67
		x_in = 12'b010010011101; //0
		#10;
		if(s_out != 12'b010010011101) //if 67
			$display("Error: In 67+0 s_out is %b while it should be 010010011101", s_out);

		// Test case #1049
		y_in = 12'b000000000000; //68
		x_in = 12'b010010101001; //0
		#10;
		if(s_out != 12'b010010101001) //if 68
			$display("Error: In 68+0 s_out is %b while it should be 010010101001", s_out);

		// Test case #1050
		y_in = 12'b000000000000; //69
		x_in = 12'b010010101110; //0
		#10;
		if(s_out != 12'b010010101110) //if 69
			$display("Error: In 69+0 s_out is %b while it should be 010010101110", s_out);

		// Test case #1051
		y_in = 12'b000000000000; //70
		x_in = 12'b010010110000; //0
		#10;
		if(s_out != 12'b010010110000) //if 70
			$display("Error: In 70+0 s_out is %b while it should be 010010110000", s_out);

		// Test case #1052
		y_in = 12'b000000000000; //71
		x_in = 12'b010010110111; //0
		#10;
		if(s_out != 12'b010010110111) //if 71
			$display("Error: In 71+0 s_out is %b while it should be 010010110111", s_out);

		// Test case #1053
		y_in = 12'b000000000000; //72
		x_in = 12'b010011001000; //0
		#10;
		if(s_out != 12'b010011001000) //if 72
			$display("Error: In 72+0 s_out is %b while it should be 010011001000", s_out);

		// Test case #1054
		y_in = 12'b000000000000; //73
		x_in = 12'b010011001111; //0
		#10;
		if(s_out != 12'b010011001111) //if 73
			$display("Error: In 73+0 s_out is %b while it should be 010011001111", s_out);

		// Test case #1055
		y_in = 12'b000000000000; //74
		x_in = 12'b010011010001; //0
		#10;
		if(s_out != 12'b010011010001) //if 74
			$display("Error: In 74+0 s_out is %b while it should be 010011010001", s_out);

		// Test case #1056
		y_in = 12'b000000000000; //75
		x_in = 12'b010011010110; //0
		#10;
		if(s_out != 12'b010011010110) //if 75
			$display("Error: In 75+0 s_out is %b while it should be 010011010110", s_out);

		// Test case #1057
		y_in = 12'b000000000000; //76
		x_in = 12'b010011100010; //0
		#10;
		if(s_out != 12'b010011100010) //if 76
			$display("Error: In 76+0 s_out is %b while it should be 010011100010", s_out);

		// Test case #1058
		y_in = 12'b000000000000; //77
		x_in = 12'b010011100101; //0
		#10;
		if(s_out != 12'b010011100101) //if 77
			$display("Error: In 77+0 s_out is %b while it should be 010011100101", s_out);

		// Test case #1059
		y_in = 12'b000000000000; //78
		x_in = 12'b010011111011; //0
		#10;
		if(s_out != 12'b010011111011) //if 78
			$display("Error: In 78+0 s_out is %b while it should be 010011111011", s_out);

		// Test case #1060
		y_in = 12'b000000000000; //79
		x_in = 12'b010011111100; //0
		#10;
		if(s_out != 12'b010011111100) //if 79
			$display("Error: In 79+0 s_out is %b while it should be 010011111100", s_out);

		// Test case #1061
		y_in = 12'b000000000000; //80
		x_in = 12'b010100000010; //0
		#10;
		if(s_out != 12'b010100000010) //if 80
			$display("Error: In 80+0 s_out is %b while it should be 010100000010", s_out);

		// Test case #1062
		y_in = 12'b000000000000; //81
		x_in = 12'b010100000101; //0
		#10;
		if(s_out != 12'b010100000101) //if 81
			$display("Error: In 81+0 s_out is %b while it should be 010100000101", s_out);

		// Test case #1063
		y_in = 12'b000000000000; //82
		x_in = 12'b010100011011; //0
		#10;
		if(s_out != 12'b010100011011) //if 82
			$display("Error: In 82+0 s_out is %b while it should be 010100011011", s_out);

		// Test case #1064
		y_in = 12'b000000000000; //83
		x_in = 12'b010100011100; //0
		#10;
		if(s_out != 12'b010100011100) //if 83
			$display("Error: In 83+0 s_out is %b while it should be 010100011100", s_out);

		// Test case #1065
		y_in = 12'b000000000000; //84
		x_in = 12'b010100101000; //0
		#10;
		if(s_out != 12'b010100101000) //if 84
			$display("Error: In 84+0 s_out is %b while it should be 010100101000", s_out);

		// Test case #1066
		y_in = 12'b000000000000; //85
		x_in = 12'b010100101111; //0
		#10;
		if(s_out != 12'b010100101111) //if 85
			$display("Error: In 85+0 s_out is %b while it should be 010100101111", s_out);

		// Test case #1067
		y_in = 12'b000000000000; //86
		x_in = 12'b010100110001; //0
		#10;
		if(s_out != 12'b010100110001) //if 86
			$display("Error: In 86+0 s_out is %b while it should be 010100110001", s_out);

		// Test case #1068
		y_in = 12'b000000000000; //87
		x_in = 12'b010100110110; //0
		#10;
		if(s_out != 12'b010100110110) //if 87
			$display("Error: In 87+0 s_out is %b while it should be 010100110110", s_out);

		// Test case #1069
		y_in = 12'b000000000000; //88
		x_in = 12'b010101001001; //0
		#10;
		if(s_out != 12'b010101001001) //if 88
			$display("Error: In 88+0 s_out is %b while it should be 010101001001", s_out);

		// Test case #1070
		y_in = 12'b000000000000; //89
		x_in = 12'b010101001110; //0
		#10;
		if(s_out != 12'b010101001110) //if 89
			$display("Error: In 89+0 s_out is %b while it should be 010101001110", s_out);

		// Test case #1071
		y_in = 12'b000000000000; //90
		x_in = 12'b010101010000; //0
		#10;
		if(s_out != 12'b010101010000) //if 90
			$display("Error: In 90+0 s_out is %b while it should be 010101010000", s_out);

		// Test case #1072
		y_in = 12'b000000000000; //91
		x_in = 12'b010101010111; //0
		#10;
		if(s_out != 12'b010101010111) //if 91
			$display("Error: In 91+0 s_out is %b while it should be 010101010111", s_out);

		// Test case #1073
		y_in = 12'b000000000000; //92
		x_in = 12'b010101100011; //0
		#10;
		if(s_out != 12'b010101100011) //if 92
			$display("Error: In 92+0 s_out is %b while it should be 010101100011", s_out);

		// Test case #1074
		y_in = 12'b000000000000; //93
		x_in = 12'b010101100100; //0
		#10;
		if(s_out != 12'b010101100100) //if 93
			$display("Error: In 93+0 s_out is %b while it should be 010101100100", s_out);

		// Test case #1075
		y_in = 12'b000000000000; //94
		x_in = 12'b010101111010; //0
		#10;
		if(s_out != 12'b010101111010) //if 94
			$display("Error: In 94+0 s_out is %b while it should be 010101111010", s_out);

		// Test case #1076
		y_in = 12'b000000000000; //95
		x_in = 12'b010101111101; //0
		#10;
		if(s_out != 12'b010101111101) //if 95
			$display("Error: In 95+0 s_out is %b while it should be 010101111101", s_out);

		// Test case #1077
		y_in = 12'b000000000000; //96
		x_in = 12'b011000000001; //0
		#10;
		if(s_out != 12'b011000000001) //if 96
			$display("Error: In 96+0 s_out is %b while it should be 011000000001", s_out);

		// Test case #1078
		y_in = 12'b000000000000; //97
		x_in = 12'b011000000110; //0
		#10;
		if(s_out != 12'b011000000110) //if 97
			$display("Error: In 97+0 s_out is %b while it should be 011000000110", s_out);

		// Test case #1079
		y_in = 12'b000000000000; //98
		x_in = 12'b011000011000; //0
		#10;
		if(s_out != 12'b011000011000) //if 98
			$display("Error: In 98+0 s_out is %b while it should be 011000011000", s_out);

		// Test case #1080
		y_in = 12'b000000000000; //99
		x_in = 12'b011000011111; //0
		#10;
		if(s_out != 12'b011000011111) //if 99
			$display("Error: In 99+0 s_out is %b while it should be 011000011111", s_out);

		// Test case #1081
		y_in = 12'b000000000000; //100
		x_in = 12'b011000101011; //0
		#10;
		if(s_out != 12'b011000101011) //if 100
			$display("Error: In 100+0 s_out is %b while it should be 011000101011", s_out);

		// Test case #1082
		y_in = 12'b000000000000; //101
		x_in = 12'b011000101100; //0
		#10;
		if(s_out != 12'b011000101100) //if 101
			$display("Error: In 101+0 s_out is %b while it should be 011000101100", s_out);

		// Test case #1083
		y_in = 12'b000000000000; //102
		x_in = 12'b011000110010; //0
		#10;
		if(s_out != 12'b011000110010) //if 102
			$display("Error: In 102+0 s_out is %b while it should be 011000110010", s_out);

		// Test case #1084
		y_in = 12'b000000000000; //103
		x_in = 12'b011000110101; //0
		#10;
		if(s_out != 12'b011000110101) //if 103
			$display("Error: In 103+0 s_out is %b while it should be 011000110101", s_out);

		// Test case #1085
		y_in = 12'b000000000000; //104
		x_in = 12'b011001001010; //0
		#10;
		if(s_out != 12'b011001001010) //if 104
			$display("Error: In 104+0 s_out is %b while it should be 011001001010", s_out);

		// Test case #1086
		y_in = 12'b000000000000; //105
		x_in = 12'b011001001101; //0
		#10;
		if(s_out != 12'b011001001101) //if 105
			$display("Error: In 105+0 s_out is %b while it should be 011001001101", s_out);

		// Test case #1087
		y_in = 12'b000000000000; //106
		x_in = 12'b011001010011; //0
		#10;
		if(s_out != 12'b011001010011) //if 106
			$display("Error: In 106+0 s_out is %b while it should be 011001010011", s_out);

		// Test case #1088
		y_in = 12'b000000000000; //107
		x_in = 12'b011001010100; //0
		#10;
		if(s_out != 12'b011001010100) //if 107
			$display("Error: In 107+0 s_out is %b while it should be 011001010100", s_out);

		// Test case #1089
		y_in = 12'b000000000000; //108
		x_in = 12'b011001100000; //0
		#10;
		if(s_out != 12'b011001100000) //if 108
			$display("Error: In 108+0 s_out is %b while it should be 011001100000", s_out);

		// Test case #1090
		y_in = 12'b000000000000; //109
		x_in = 12'b011001100111; //0
		#10;
		if(s_out != 12'b011001100111) //if 109
			$display("Error: In 109+0 s_out is %b while it should be 011001100111", s_out);

		// Test case #1091
		y_in = 12'b000000000000; //110
		x_in = 12'b011001111001; //0
		#10;
		if(s_out != 12'b011001111001) //if 110
			$display("Error: In 110+0 s_out is %b while it should be 011001111001", s_out);

		// Test case #1092
		y_in = 12'b000000000000; //111
		x_in = 12'b011001111110; //0
		#10;
		if(s_out != 12'b011001111110) //if 111
			$display("Error: In 111+0 s_out is %b while it should be 011001111110", s_out);

		// Test case #1093
		y_in = 12'b000000000000; //112
		x_in = 12'b011110000000; //0
		#10;
		if(s_out != 12'b011110000000) //if 112
			$display("Error: In 112+0 s_out is %b while it should be 011110000000", s_out);

		// Test case #1094
		y_in = 12'b000000000000; //113
		x_in = 12'b011110000111; //0
		#10;
		if(s_out != 12'b011110000111) //if 113
			$display("Error: In 113+0 s_out is %b while it should be 011110000111", s_out);

		// Test case #1095
		y_in = 12'b000000000000; //114
		x_in = 12'b011110011001; //0
		#10;
		if(s_out != 12'b011110011001) //if 114
			$display("Error: In 114+0 s_out is %b while it should be 011110011001", s_out);

		// Test case #1096
		y_in = 12'b000000000000; //115
		x_in = 12'b011110011110; //0
		#10;
		if(s_out != 12'b011110011110) //if 115
			$display("Error: In 115+0 s_out is %b while it should be 011110011110", s_out);

		// Test case #1097
		y_in = 12'b000000000000; //116
		x_in = 12'b011110101010; //0
		#10;
		if(s_out != 12'b011110101010) //if 116
			$display("Error: In 116+0 s_out is %b while it should be 011110101010", s_out);

		// Test case #1098
		y_in = 12'b000000000000; //117
		x_in = 12'b011110101101; //0
		#10;
		if(s_out != 12'b011110101101) //if 117
			$display("Error: In 117+0 s_out is %b while it should be 011110101101", s_out);

		// Test case #1099
		y_in = 12'b000000000000; //118
		x_in = 12'b011110110011; //0
		#10;
		if(s_out != 12'b011110110011) //if 118
			$display("Error: In 118+0 s_out is %b while it should be 011110110011", s_out);

		// Test case #1100
		y_in = 12'b000000000000; //119
		x_in = 12'b011110110100; //0
		#10;
		if(s_out != 12'b011110110100) //if 119
			$display("Error: In 119+0 s_out is %b while it should be 011110110100", s_out);

		// Test case #1101
		y_in = 12'b000000000000; //120
		x_in = 12'b011111001011; //0
		#10;
		if(s_out != 12'b011111001011) //if 120
			$display("Error: In 120+0 s_out is %b while it should be 011111001011", s_out);

		// Test case #1102
		y_in = 12'b000000000000; //121
		x_in = 12'b011111001100; //0
		#10;
		if(s_out != 12'b011111001100) //if 121
			$display("Error: In 121+0 s_out is %b while it should be 011111001100", s_out);

		// Test case #1103
		y_in = 12'b000000000000; //122
		x_in = 12'b011111010010; //0
		#10;
		if(s_out != 12'b011111010010) //if 122
			$display("Error: In 122+0 s_out is %b while it should be 011111010010", s_out);

		// Test case #1104
		y_in = 12'b000000000000; //123
		x_in = 12'b011111010101; //0
		#10;
		if(s_out != 12'b011111010101) //if 123
			$display("Error: In 123+0 s_out is %b while it should be 011111010101", s_out);

		// Test case #1105
		y_in = 12'b000000000000; //124
		x_in = 12'b011111100001; //0
		#10;
		if(s_out != 12'b011111100001) //if 124
			$display("Error: In 124+0 s_out is %b while it should be 011111100001", s_out);

		// Test case #1106
		y_in = 12'b000000000000; //125
		x_in = 12'b011111100110; //0
		#10;
		if(s_out != 12'b011111100110) //if 125
			$display("Error: In 125+0 s_out is %b while it should be 011111100110", s_out);

		// Test case #1107
		y_in = 12'b000000000000; //126
		x_in = 12'b011111111000; //0
		#10;
		if(s_out != 12'b011111111000) //if 126
			$display("Error: In 126+0 s_out is %b while it should be 011111111000", s_out);

		// Test case #1108
		y_in = 12'b000000000000; //127
		x_in = 12'b011111111111; //0
		#10;
		if(s_out != 12'b011111111111) //if 127
			$display("Error: In 127+0 s_out is %b while it should be 011111111111", s_out);

		// Test case #1109
		y_in = 12'b000000000000; //128
		x_in = 12'b100010001000; //0
		#10;
		if(s_out != 12'b100010001000) //if 128
			$display("Error: In 128+0 s_out is %b while it should be 100010001000", s_out);

		// Test case #1110
		y_in = 12'b000000000000; //129
		x_in = 12'b100010001111; //0
		#10;
		if(s_out != 12'b100010001111) //if 129
			$display("Error: In 129+0 s_out is %b while it should be 100010001111", s_out);

		// Test case #1111
		y_in = 12'b000000000000; //130
		x_in = 12'b100010010001; //0
		#10;
		if(s_out != 12'b100010010001) //if 130
			$display("Error: In 130+0 s_out is %b while it should be 100010010001", s_out);

		// Test case #1112
		y_in = 12'b000000000000; //131
		x_in = 12'b100010010110; //0
		#10;
		if(s_out != 12'b100010010110) //if 131
			$display("Error: In 131+0 s_out is %b while it should be 100010010110", s_out);

		// Test case #1113
		y_in = 12'b000000000000; //132
		x_in = 12'b100010100010; //0
		#10;
		if(s_out != 12'b100010100010) //if 132
			$display("Error: In 132+0 s_out is %b while it should be 100010100010", s_out);

		// Test case #1114
		y_in = 12'b000000000000; //133
		x_in = 12'b100010100101; //0
		#10;
		if(s_out != 12'b100010100101) //if 133
			$display("Error: In 133+0 s_out is %b while it should be 100010100101", s_out);

		// Test case #1115
		y_in = 12'b000000000000; //134
		x_in = 12'b100010111011; //0
		#10;
		if(s_out != 12'b100010111011) //if 134
			$display("Error: In 134+0 s_out is %b while it should be 100010111011", s_out);

		// Test case #1116
		y_in = 12'b000000000000; //135
		x_in = 12'b100010111100; //0
		#10;
		if(s_out != 12'b100010111100) //if 135
			$display("Error: In 135+0 s_out is %b while it should be 100010111100", s_out);

		// Test case #1117
		y_in = 12'b000000000000; //136
		x_in = 12'b100011000011; //0
		#10;
		if(s_out != 12'b100011000011) //if 136
			$display("Error: In 136+0 s_out is %b while it should be 100011000011", s_out);

		// Test case #1118
		y_in = 12'b000000000000; //137
		x_in = 12'b100011000100; //0
		#10;
		if(s_out != 12'b100011000100) //if 137
			$display("Error: In 137+0 s_out is %b while it should be 100011000100", s_out);

		// Test case #1119
		y_in = 12'b000000000000; //138
		x_in = 12'b100011011010; //0
		#10;
		if(s_out != 12'b100011011010) //if 138
			$display("Error: In 138+0 s_out is %b while it should be 100011011010", s_out);

		// Test case #1120
		y_in = 12'b000000000000; //139
		x_in = 12'b100011011101; //0
		#10;
		if(s_out != 12'b100011011101) //if 139
			$display("Error: In 139+0 s_out is %b while it should be 100011011101", s_out);

		// Test case #1121
		y_in = 12'b000000000000; //140
		x_in = 12'b100011101001; //0
		#10;
		if(s_out != 12'b100011101001) //if 140
			$display("Error: In 140+0 s_out is %b while it should be 100011101001", s_out);

		// Test case #1122
		y_in = 12'b000000000000; //141
		x_in = 12'b100011101110; //0
		#10;
		if(s_out != 12'b100011101110) //if 141
			$display("Error: In 141+0 s_out is %b while it should be 100011101110", s_out);

		// Test case #1123
		y_in = 12'b000000000000; //142
		x_in = 12'b100011110000; //0
		#10;
		if(s_out != 12'b100011110000) //if 142
			$display("Error: In 142+0 s_out is %b while it should be 100011110000", s_out);

		// Test case #1124
		y_in = 12'b000000000000; //143
		x_in = 12'b100011110111; //0
		#10;
		if(s_out != 12'b100011110111) //if 143
			$display("Error: In 143+0 s_out is %b while it should be 100011110111", s_out);

		// Test case #1125
		y_in = 12'b000000000000; //144
		x_in = 12'b100100001001; //0
		#10;
		if(s_out != 12'b100100001001) //if 144
			$display("Error: In 144+0 s_out is %b while it should be 100100001001", s_out);

		// Test case #1126
		y_in = 12'b000000000000; //145
		x_in = 12'b100100001110; //0
		#10;
		if(s_out != 12'b100100001110) //if 145
			$display("Error: In 145+0 s_out is %b while it should be 100100001110", s_out);

		// Test case #1127
		y_in = 12'b000000000000; //146
		x_in = 12'b100100010000; //0
		#10;
		if(s_out != 12'b100100010000) //if 146
			$display("Error: In 146+0 s_out is %b while it should be 100100010000", s_out);

		// Test case #1128
		y_in = 12'b000000000000; //147
		x_in = 12'b100100010111; //0
		#10;
		if(s_out != 12'b100100010111) //if 147
			$display("Error: In 147+0 s_out is %b while it should be 100100010111", s_out);

		// Test case #1129
		y_in = 12'b000000000000; //148
		x_in = 12'b100100100011; //0
		#10;
		if(s_out != 12'b100100100011) //if 148
			$display("Error: In 148+0 s_out is %b while it should be 100100100011", s_out);

		// Test case #1130
		y_in = 12'b000000000000; //149
		x_in = 12'b100100100100; //0
		#10;
		if(s_out != 12'b100100100100) //if 149
			$display("Error: In 149+0 s_out is %b while it should be 100100100100", s_out);

		// Test case #1131
		y_in = 12'b000000000000; //150
		x_in = 12'b100100111010; //0
		#10;
		if(s_out != 12'b100100111010) //if 150
			$display("Error: In 150+0 s_out is %b while it should be 100100111010", s_out);

		// Test case #1132
		y_in = 12'b000000000000; //151
		x_in = 12'b100100111101; //0
		#10;
		if(s_out != 12'b100100111101) //if 151
			$display("Error: In 151+0 s_out is %b while it should be 100100111101", s_out);

		// Test case #1133
		y_in = 12'b000000000000; //152
		x_in = 12'b100101000010; //0
		#10;
		if(s_out != 12'b100101000010) //if 152
			$display("Error: In 152+0 s_out is %b while it should be 100101000010", s_out);

		// Test case #1134
		y_in = 12'b000000000000; //153
		x_in = 12'b100101000101; //0
		#10;
		if(s_out != 12'b100101000101) //if 153
			$display("Error: In 153+0 s_out is %b while it should be 100101000101", s_out);

		// Test case #1135
		y_in = 12'b000000000000; //154
		x_in = 12'b100101011011; //0
		#10;
		if(s_out != 12'b100101011011) //if 154
			$display("Error: In 154+0 s_out is %b while it should be 100101011011", s_out);

		// Test case #1136
		y_in = 12'b000000000000; //155
		x_in = 12'b100101011100; //0
		#10;
		if(s_out != 12'b100101011100) //if 155
			$display("Error: In 155+0 s_out is %b while it should be 100101011100", s_out);

		// Test case #1137
		y_in = 12'b000000000000; //156
		x_in = 12'b100101101000; //0
		#10;
		if(s_out != 12'b100101101000) //if 156
			$display("Error: In 156+0 s_out is %b while it should be 100101101000", s_out);

		// Test case #1138
		y_in = 12'b000000000000; //157
		x_in = 12'b100101101111; //0
		#10;
		if(s_out != 12'b100101101111) //if 157
			$display("Error: In 157+0 s_out is %b while it should be 100101101111", s_out);

		// Test case #1139
		y_in = 12'b000000000000; //158
		x_in = 12'b100101110001; //0
		#10;
		if(s_out != 12'b100101110001) //if 158
			$display("Error: In 158+0 s_out is %b while it should be 100101110001", s_out);

		// Test case #1140
		y_in = 12'b000000000000; //159
		x_in = 12'b100101110110; //0
		#10;
		if(s_out != 12'b100101110110) //if 159
			$display("Error: In 159+0 s_out is %b while it should be 100101110110", s_out);

		// Test case #1141
		y_in = 12'b000000000000; //160
		x_in = 12'b101000001010; //0
		#10;
		if(s_out != 12'b101000001010) //if 160
			$display("Error: In 160+0 s_out is %b while it should be 101000001010", s_out);

		// Test case #1142
		y_in = 12'b000000000000; //161
		x_in = 12'b101000001101; //0
		#10;
		if(s_out != 12'b101000001101) //if 161
			$display("Error: In 161+0 s_out is %b while it should be 101000001101", s_out);

		// Test case #1143
		y_in = 12'b000000000000; //162
		x_in = 12'b101000010011; //0
		#10;
		if(s_out != 12'b101000010011) //if 162
			$display("Error: In 162+0 s_out is %b while it should be 101000010011", s_out);

		// Test case #1144
		y_in = 12'b000000000000; //163
		x_in = 12'b101000010100; //0
		#10;
		if(s_out != 12'b101000010100) //if 163
			$display("Error: In 163+0 s_out is %b while it should be 101000010100", s_out);

		// Test case #1145
		y_in = 12'b000000000000; //164
		x_in = 12'b101000100000; //0
		#10;
		if(s_out != 12'b101000100000) //if 164
			$display("Error: In 164+0 s_out is %b while it should be 101000100000", s_out);

		// Test case #1146
		y_in = 12'b000000000000; //165
		x_in = 12'b101000100111; //0
		#10;
		if(s_out != 12'b101000100111) //if 165
			$display("Error: In 165+0 s_out is %b while it should be 101000100111", s_out);

		// Test case #1147
		y_in = 12'b000000000000; //166
		x_in = 12'b101000111001; //0
		#10;
		if(s_out != 12'b101000111001) //if 166
			$display("Error: In 166+0 s_out is %b while it should be 101000111001", s_out);

		// Test case #1148
		y_in = 12'b000000000000; //167
		x_in = 12'b101000111110; //0
		#10;
		if(s_out != 12'b101000111110) //if 167
			$display("Error: In 167+0 s_out is %b while it should be 101000111110", s_out);

		// Test case #1149
		y_in = 12'b000000000000; //168
		x_in = 12'b101001000001; //0
		#10;
		if(s_out != 12'b101001000001) //if 168
			$display("Error: In 168+0 s_out is %b while it should be 101001000001", s_out);

		// Test case #1150
		y_in = 12'b000000000000; //169
		x_in = 12'b101001000110; //0
		#10;
		if(s_out != 12'b101001000110) //if 169
			$display("Error: In 169+0 s_out is %b while it should be 101001000110", s_out);

		// Test case #1151
		y_in = 12'b000000000000; //170
		x_in = 12'b101001011000; //0
		#10;
		if(s_out != 12'b101001011000) //if 170
			$display("Error: In 170+0 s_out is %b while it should be 101001011000", s_out);

		// Test case #1152
		y_in = 12'b000000000000; //171
		x_in = 12'b101001011111; //0
		#10;
		if(s_out != 12'b101001011111) //if 171
			$display("Error: In 171+0 s_out is %b while it should be 101001011111", s_out);

		// Test case #1153
		y_in = 12'b000000000000; //172
		x_in = 12'b101001101011; //0
		#10;
		if(s_out != 12'b101001101011) //if 172
			$display("Error: In 172+0 s_out is %b while it should be 101001101011", s_out);

		// Test case #1154
		y_in = 12'b000000000000; //173
		x_in = 12'b101001101100; //0
		#10;
		if(s_out != 12'b101001101100) //if 173
			$display("Error: In 173+0 s_out is %b while it should be 101001101100", s_out);

		// Test case #1155
		y_in = 12'b000000000000; //174
		x_in = 12'b101001110010; //0
		#10;
		if(s_out != 12'b101001110010) //if 174
			$display("Error: In 174+0 s_out is %b while it should be 101001110010", s_out);

		// Test case #1156
		y_in = 12'b000000000000; //175
		x_in = 12'b101001110101; //0
		#10;
		if(s_out != 12'b101001110101) //if 175
			$display("Error: In 175+0 s_out is %b while it should be 101001110101", s_out);

		// Test case #1157
		y_in = 12'b000000000000; //176
		x_in = 12'b101110001011; //0
		#10;
		if(s_out != 12'b101110001011) //if 176
			$display("Error: In 176+0 s_out is %b while it should be 101110001011", s_out);

		// Test case #1158
		y_in = 12'b000000000000; //177
		x_in = 12'b101110001100; //0
		#10;
		if(s_out != 12'b101110001100) //if 177
			$display("Error: In 177+0 s_out is %b while it should be 101110001100", s_out);

		// Test case #1159
		y_in = 12'b000000000000; //178
		x_in = 12'b101110010010; //0
		#10;
		if(s_out != 12'b101110010010) //if 178
			$display("Error: In 178+0 s_out is %b while it should be 101110010010", s_out);

		// Test case #1160
		y_in = 12'b000000000000; //179
		x_in = 12'b101110010101; //0
		#10;
		if(s_out != 12'b101110010101) //if 179
			$display("Error: In 179+0 s_out is %b while it should be 101110010101", s_out);

		// Test case #1161
		y_in = 12'b000000000000; //180
		x_in = 12'b101110100001; //0
		#10;
		if(s_out != 12'b101110100001) //if 180
			$display("Error: In 180+0 s_out is %b while it should be 101110100001", s_out);

		// Test case #1162
		y_in = 12'b000000000000; //181
		x_in = 12'b101110100110; //0
		#10;
		if(s_out != 12'b101110100110) //if 181
			$display("Error: In 181+0 s_out is %b while it should be 101110100110", s_out);

		// Test case #1163
		y_in = 12'b000000000000; //182
		x_in = 12'b101110111000; //0
		#10;
		if(s_out != 12'b101110111000) //if 182
			$display("Error: In 182+0 s_out is %b while it should be 101110111000", s_out);

		// Test case #1164
		y_in = 12'b000000000000; //183
		x_in = 12'b101110111111; //0
		#10;
		if(s_out != 12'b101110111111) //if 183
			$display("Error: In 183+0 s_out is %b while it should be 101110111111", s_out);

		// Test case #1165
		y_in = 12'b000000000000; //184
		x_in = 12'b101111000000; //0
		#10;
		if(s_out != 12'b101111000000) //if 184
			$display("Error: In 184+0 s_out is %b while it should be 101111000000", s_out);

		// Test case #1166
		y_in = 12'b000000000000; //185
		x_in = 12'b101111000111; //0
		#10;
		if(s_out != 12'b101111000111) //if 185
			$display("Error: In 185+0 s_out is %b while it should be 101111000111", s_out);

		// Test case #1167
		y_in = 12'b000000000000; //186
		x_in = 12'b101111011001; //0
		#10;
		if(s_out != 12'b101111011001) //if 186
			$display("Error: In 186+0 s_out is %b while it should be 101111011001", s_out);

		// Test case #1168
		y_in = 12'b000000000000; //187
		x_in = 12'b101111011110; //0
		#10;
		if(s_out != 12'b101111011110) //if 187
			$display("Error: In 187+0 s_out is %b while it should be 101111011110", s_out);

		// Test case #1169
		y_in = 12'b000000000000; //188
		x_in = 12'b101111101010; //0
		#10;
		if(s_out != 12'b101111101010) //if 188
			$display("Error: In 188+0 s_out is %b while it should be 101111101010", s_out);

		// Test case #1170
		y_in = 12'b000000000000; //189
		x_in = 12'b101111101101; //0
		#10;
		if(s_out != 12'b101111101101) //if 189
			$display("Error: In 189+0 s_out is %b while it should be 101111101101", s_out);

		// Test case #1171
		y_in = 12'b000000000000; //190
		x_in = 12'b101111110011; //0
		#10;
		if(s_out != 12'b101111110011) //if 190
			$display("Error: In 190+0 s_out is %b while it should be 101111110011", s_out);

		// Test case #1172
		y_in = 12'b000000000000; //191
		x_in = 12'b101111110100; //0
		#10;
		if(s_out != 12'b101111110100) //if 191
			$display("Error: In 191+0 s_out is %b while it should be 101111110100", s_out);

		// Test case #1173
		y_in = 12'b000000000000; //192
		x_in = 12'b110000001011; //0
		#10;
		if(s_out != 12'b110000001011) //if 192
			$display("Error: In 192+0 s_out is %b while it should be 110000001011", s_out);

		// Test case #1174
		y_in = 12'b000000000000; //193
		x_in = 12'b110000001100; //0
		#10;
		if(s_out != 12'b110000001100) //if 193
			$display("Error: In 193+0 s_out is %b while it should be 110000001100", s_out);

		// Test case #1175
		y_in = 12'b000000000000; //194
		x_in = 12'b110000010010; //0
		#10;
		if(s_out != 12'b110000010010) //if 194
			$display("Error: In 194+0 s_out is %b while it should be 110000010010", s_out);

		// Test case #1176
		y_in = 12'b000000000000; //195
		x_in = 12'b110000010101; //0
		#10;
		if(s_out != 12'b110000010101) //if 195
			$display("Error: In 195+0 s_out is %b while it should be 110000010101", s_out);

		// Test case #1177
		y_in = 12'b000000000000; //196
		x_in = 12'b110000100001; //0
		#10;
		if(s_out != 12'b110000100001) //if 196
			$display("Error: In 196+0 s_out is %b while it should be 110000100001", s_out);

		// Test case #1178
		y_in = 12'b000000000000; //197
		x_in = 12'b110000100110; //0
		#10;
		if(s_out != 12'b110000100110) //if 197
			$display("Error: In 197+0 s_out is %b while it should be 110000100110", s_out);

		// Test case #1179
		y_in = 12'b000000000000; //198
		x_in = 12'b110000111000; //0
		#10;
		if(s_out != 12'b110000111000) //if 198
			$display("Error: In 198+0 s_out is %b while it should be 110000111000", s_out);

		// Test case #1180
		y_in = 12'b000000000000; //199
		x_in = 12'b110000111111; //0
		#10;
		if(s_out != 12'b110000111111) //if 199
			$display("Error: In 199+0 s_out is %b while it should be 110000111111", s_out);

		// Test case #1181
		y_in = 12'b000000000000; //200
		x_in = 12'b110001000000; //0
		#10;
		if(s_out != 12'b110001000000) //if 200
			$display("Error: In 200+0 s_out is %b while it should be 110001000000", s_out);

		// Test case #1182
		y_in = 12'b000000000000; //201
		x_in = 12'b110001000111; //0
		#10;
		if(s_out != 12'b110001000111) //if 201
			$display("Error: In 201+0 s_out is %b while it should be 110001000111", s_out);

		// Test case #1183
		y_in = 12'b000000000000; //202
		x_in = 12'b110001011001; //0
		#10;
		if(s_out != 12'b110001011001) //if 202
			$display("Error: In 202+0 s_out is %b while it should be 110001011001", s_out);

		// Test case #1184
		y_in = 12'b000000000000; //203
		x_in = 12'b110001011110; //0
		#10;
		if(s_out != 12'b110001011110) //if 203
			$display("Error: In 203+0 s_out is %b while it should be 110001011110", s_out);

		// Test case #1185
		y_in = 12'b000000000000; //204
		x_in = 12'b110001101010; //0
		#10;
		if(s_out != 12'b110001101010) //if 204
			$display("Error: In 204+0 s_out is %b while it should be 110001101010", s_out);

		// Test case #1186
		y_in = 12'b000000000000; //205
		x_in = 12'b110001101101; //0
		#10;
		if(s_out != 12'b110001101101) //if 205
			$display("Error: In 205+0 s_out is %b while it should be 110001101101", s_out);

		// Test case #1187
		y_in = 12'b000000000000; //206
		x_in = 12'b110001110011; //0
		#10;
		if(s_out != 12'b110001110011) //if 206
			$display("Error: In 206+0 s_out is %b while it should be 110001110011", s_out);

		// Test case #1188
		y_in = 12'b000000000000; //207
		x_in = 12'b110001110100; //0
		#10;
		if(s_out != 12'b110001110100) //if 207
			$display("Error: In 207+0 s_out is %b while it should be 110001110100", s_out);

		// Test case #1189
		y_in = 12'b000000000000; //208
		x_in = 12'b110110001010; //0
		#10;
		if(s_out != 12'b110110001010) //if 208
			$display("Error: In 208+0 s_out is %b while it should be 110110001010", s_out);

		// Test case #1190
		y_in = 12'b000000000000; //209
		x_in = 12'b110110001101; //0
		#10;
		if(s_out != 12'b110110001101) //if 209
			$display("Error: In 209+0 s_out is %b while it should be 110110001101", s_out);

		// Test case #1191
		y_in = 12'b000000000000; //210
		x_in = 12'b110110010011; //0
		#10;
		if(s_out != 12'b110110010011) //if 210
			$display("Error: In 210+0 s_out is %b while it should be 110110010011", s_out);

		// Test case #1192
		y_in = 12'b000000000000; //211
		x_in = 12'b110110010100; //0
		#10;
		if(s_out != 12'b110110010100) //if 211
			$display("Error: In 211+0 s_out is %b while it should be 110110010100", s_out);

		// Test case #1193
		y_in = 12'b000000000000; //212
		x_in = 12'b110110100000; //0
		#10;
		if(s_out != 12'b110110100000) //if 212
			$display("Error: In 212+0 s_out is %b while it should be 110110100000", s_out);

		// Test case #1194
		y_in = 12'b000000000000; //213
		x_in = 12'b110110100111; //0
		#10;
		if(s_out != 12'b110110100111) //if 213
			$display("Error: In 213+0 s_out is %b while it should be 110110100111", s_out);

		// Test case #1195
		y_in = 12'b000000000000; //214
		x_in = 12'b110110111001; //0
		#10;
		if(s_out != 12'b110110111001) //if 214
			$display("Error: In 214+0 s_out is %b while it should be 110110111001", s_out);

		// Test case #1196
		y_in = 12'b000000000000; //215
		x_in = 12'b110110111110; //0
		#10;
		if(s_out != 12'b110110111110) //if 215
			$display("Error: In 215+0 s_out is %b while it should be 110110111110", s_out);

		// Test case #1197
		y_in = 12'b000000000000; //216
		x_in = 12'b110111000001; //0
		#10;
		if(s_out != 12'b110111000001) //if 216
			$display("Error: In 216+0 s_out is %b while it should be 110111000001", s_out);

		// Test case #1198
		y_in = 12'b000000000000; //217
		x_in = 12'b110111000110; //0
		#10;
		if(s_out != 12'b110111000110) //if 217
			$display("Error: In 217+0 s_out is %b while it should be 110111000110", s_out);

		// Test case #1199
		y_in = 12'b000000000000; //218
		x_in = 12'b110111011000; //0
		#10;
		if(s_out != 12'b110111011000) //if 218
			$display("Error: In 218+0 s_out is %b while it should be 110111011000", s_out);

		// Test case #1200
		y_in = 12'b000000000000; //219
		x_in = 12'b110111011111; //0
		#10;
		if(s_out != 12'b110111011111) //if 219
			$display("Error: In 219+0 s_out is %b while it should be 110111011111", s_out);

		// Test case #1201
		y_in = 12'b000000000000; //220
		x_in = 12'b110111101011; //0
		#10;
		if(s_out != 12'b110111101011) //if 220
			$display("Error: In 220+0 s_out is %b while it should be 110111101011", s_out);

		// Test case #1202
		y_in = 12'b000000000000; //221
		x_in = 12'b110111101100; //0
		#10;
		if(s_out != 12'b110111101100) //if 221
			$display("Error: In 221+0 s_out is %b while it should be 110111101100", s_out);

		// Test case #1203
		y_in = 12'b000000000000; //222
		x_in = 12'b110111110010; //0
		#10;
		if(s_out != 12'b110111110010) //if 222
			$display("Error: In 222+0 s_out is %b while it should be 110111110010", s_out);

		// Test case #1204
		y_in = 12'b000000000000; //223
		x_in = 12'b110111110101; //0
		#10;
		if(s_out != 12'b110111110101) //if 223
			$display("Error: In 223+0 s_out is %b while it should be 110111110101", s_out);

		// Test case #1205
		y_in = 12'b000000000000; //224
		x_in = 12'b111010001001; //0
		#10;
		if(s_out != 12'b111010001001) //if 224
			$display("Error: In 224+0 s_out is %b while it should be 111010001001", s_out);

		// Test case #1206
		y_in = 12'b000000000000; //225
		x_in = 12'b111010001110; //0
		#10;
		if(s_out != 12'b111010001110) //if 225
			$display("Error: In 225+0 s_out is %b while it should be 111010001110", s_out);

		// Test case #1207
		y_in = 12'b000000000000; //226
		x_in = 12'b111010010000; //0
		#10;
		if(s_out != 12'b111010010000) //if 226
			$display("Error: In 226+0 s_out is %b while it should be 111010010000", s_out);

		// Test case #1208
		y_in = 12'b000000000000; //227
		x_in = 12'b111010010111; //0
		#10;
		if(s_out != 12'b111010010111) //if 227
			$display("Error: In 227+0 s_out is %b while it should be 111010010111", s_out);

		// Test case #1209
		y_in = 12'b000000000000; //228
		x_in = 12'b111010100011; //0
		#10;
		if(s_out != 12'b111010100011) //if 228
			$display("Error: In 228+0 s_out is %b while it should be 111010100011", s_out);

		// Test case #1210
		y_in = 12'b000000000000; //229
		x_in = 12'b111010100100; //0
		#10;
		if(s_out != 12'b111010100100) //if 229
			$display("Error: In 229+0 s_out is %b while it should be 111010100100", s_out);

		// Test case #1211
		y_in = 12'b000000000000; //230
		x_in = 12'b111010111010; //0
		#10;
		if(s_out != 12'b111010111010) //if 230
			$display("Error: In 230+0 s_out is %b while it should be 111010111010", s_out);

		// Test case #1212
		y_in = 12'b000000000000; //231
		x_in = 12'b111010111101; //0
		#10;
		if(s_out != 12'b111010111101) //if 231
			$display("Error: In 231+0 s_out is %b while it should be 111010111101", s_out);

		// Test case #1213
		y_in = 12'b000000000000; //232
		x_in = 12'b111011000010; //0
		#10;
		if(s_out != 12'b111011000010) //if 232
			$display("Error: In 232+0 s_out is %b while it should be 111011000010", s_out);

		// Test case #1214
		y_in = 12'b000000000000; //233
		x_in = 12'b111011000101; //0
		#10;
		if(s_out != 12'b111011000101) //if 233
			$display("Error: In 233+0 s_out is %b while it should be 111011000101", s_out);

		// Test case #1215
		y_in = 12'b000000000000; //234
		x_in = 12'b111011011011; //0
		#10;
		if(s_out != 12'b111011011011) //if 234
			$display("Error: In 234+0 s_out is %b while it should be 111011011011", s_out);

		// Test case #1216
		y_in = 12'b000000000000; //235
		x_in = 12'b111011011100; //0
		#10;
		if(s_out != 12'b111011011100) //if 235
			$display("Error: In 235+0 s_out is %b while it should be 111011011100", s_out);

		// Test case #1217
		y_in = 12'b000000000000; //236
		x_in = 12'b111011101000; //0
		#10;
		if(s_out != 12'b111011101000) //if 236
			$display("Error: In 236+0 s_out is %b while it should be 111011101000", s_out);

		// Test case #1218
		y_in = 12'b000000000000; //237
		x_in = 12'b111011101111; //0
		#10;
		if(s_out != 12'b111011101111) //if 237
			$display("Error: In 237+0 s_out is %b while it should be 111011101111", s_out);

		// Test case #1219
		y_in = 12'b000000000000; //238
		x_in = 12'b111011110001; //0
		#10;
		if(s_out != 12'b111011110001) //if 238
			$display("Error: In 238+0 s_out is %b while it should be 111011110001", s_out);

		// Test case #1220
		y_in = 12'b000000000000; //239
		x_in = 12'b111011110110; //0
		#10;
		if(s_out != 12'b111011110110) //if 239
			$display("Error: In 239+0 s_out is %b while it should be 111011110110", s_out);

		// Test case #1221
		y_in = 12'b000000000000; //240
		x_in = 12'b111100001000; //0
		#10;
		if(s_out != 12'b111100001000) //if 240
			$display("Error: In 240+0 s_out is %b while it should be 111100001000", s_out);

		// Test case #1222
		y_in = 12'b000000000000; //241
		x_in = 12'b111100001111; //0
		#10;
		if(s_out != 12'b111100001111) //if 241
			$display("Error: In 241+0 s_out is %b while it should be 111100001111", s_out);

		// Test case #1223
		y_in = 12'b000000000000; //242
		x_in = 12'b111100010001; //0
		#10;
		if(s_out != 12'b111100010001) //if 242
			$display("Error: In 242+0 s_out is %b while it should be 111100010001", s_out);

		// Test case #1224
		y_in = 12'b000000000000; //243
		x_in = 12'b111100010110; //0
		#10;
		if(s_out != 12'b111100010110) //if 243
			$display("Error: In 243+0 s_out is %b while it should be 111100010110", s_out);

		// Test case #1225
		y_in = 12'b000000000000; //244
		x_in = 12'b111100100010; //0
		#10;
		if(s_out != 12'b111100100010) //if 244
			$display("Error: In 244+0 s_out is %b while it should be 111100100010", s_out);

		// Test case #1226
		y_in = 12'b000000000000; //245
		x_in = 12'b111100100101; //0
		#10;
		if(s_out != 12'b111100100101) //if 245
			$display("Error: In 245+0 s_out is %b while it should be 111100100101", s_out);

		// Test case #1227
		y_in = 12'b000000000000; //246
		x_in = 12'b111100111011; //0
		#10;
		if(s_out != 12'b111100111011) //if 246
			$display("Error: In 246+0 s_out is %b while it should be 111100111011", s_out);

		// Test case #1228
		y_in = 12'b000000000000; //247
		x_in = 12'b111100111100; //0
		#10;
		if(s_out != 12'b111100111100) //if 247
			$display("Error: In 247+0 s_out is %b while it should be 111100111100", s_out);

		// Test case #1229
		y_in = 12'b000000000000; //248
		x_in = 12'b111101000011; //0
		#10;
		if(s_out != 12'b111101000011) //if 248
			$display("Error: In 248+0 s_out is %b while it should be 111101000011", s_out);

		// Test case #1230
		y_in = 12'b000000000000; //249
		x_in = 12'b111101000100; //0
		#10;
		if(s_out != 12'b111101000100) //if 249
			$display("Error: In 249+0 s_out is %b while it should be 111101000100", s_out);

		// Test case #1231
		y_in = 12'b000000000000; //250
		x_in = 12'b111101011010; //0
		#10;
		if(s_out != 12'b111101011010) //if 250
			$display("Error: In 250+0 s_out is %b while it should be 111101011010", s_out);

		// Test case #1232
		y_in = 12'b000000000000; //251
		x_in = 12'b111101011101; //0
		#10;
		if(s_out != 12'b111101011101) //if 251
			$display("Error: In 251+0 s_out is %b while it should be 111101011101", s_out);

		// Test case #1233
		y_in = 12'b000000000000; //252
		x_in = 12'b111101101001; //0
		#10;
		if(s_out != 12'b111101101001) //if 252
			$display("Error: In 252+0 s_out is %b while it should be 111101101001", s_out);

		// Test case #1234
		y_in = 12'b000000000000; //253
		x_in = 12'b111101101110; //0
		#10;
		if(s_out != 12'b111101101110) //if 253
			$display("Error: In 253+0 s_out is %b while it should be 111101101110", s_out);
 
		// Test case #1235
		y_in = 12'b000000000000; //254
		x_in = 12'b111101110000; //0
		#10;
		if(s_out != 12'b111101110000) //if 254
			$display("Error: In 254+0 s_out is %b while it should be 111101110000", s_out);

		// Test case #1236
		y_in = 12'b000000000000; //255
		x_in = 12'b111101110111; //0
		#10;
		if(s_out != 12'b111101110111) //if 255
			$display("Error: In 255+0 s_out is %b while it should be 111101110111", s_out);
	end

endmodule

