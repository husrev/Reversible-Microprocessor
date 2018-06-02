`timescale 1ns / 1ps

module dafa_sim;

	// Inputs
	reg [11:0] s_in;
	reg [11:0] x_in;
	reg [11:0] y_in;
	reg ovf_in;

	// Outputs
	wire [11:0] s_out;
	wire [11:0] x_out; 
	wire [11:0] y_out;
	wire ovf_out;

	// Instantiate the Unit Under Test (UUT)
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
		// Initialize Inputs
		s_in = 0;
		x_in = 0;
		y_in = 0;
		ovf_in = 0;
		#100;
		y_in = 12'b000000000111; //1
		x_in = 12'b000000011001; //2
		#10;
		if(s_out != 12'b000000011110) //3
			$display("Error: s_out is %b while it should be 000000011110", s_out);
		#10;
		y_in = 12'b000000011110; //3
		x_in = 12'b000000101010; //4
		#10;
		if(s_out != 12'b000000110100) //7
			$display("Error: s_out is %b while it should be 000000110100", s_out);
		#10;
		y_in = 12'b000000101101; //5
		x_in = 12'b000000110011; //6
		#10;
		if(s_out != 12'b000001010101) //11
			$display("Error: s_out is %b while it should be 000001010101", s_out);
		#10;
		y_in = 12'b000000110100; //7
		x_in = 12'b000001001011; //8
		#10; 
		if(s_out != 12'b000001111111)
			$display("Error: s_out is %b while it should be 000001111111", s_out);
		#10;
		y_in = 12'b000001001100; //9
		x_in = 12'b000001010010; //10
		#10;
		if(s_out != 12'b000110011111) 
			$display("Error: s_out is %b while it should be 000110011111", s_out);
		#10;
		y_in = 12'b000001010101; //11
		x_in = 12'b000001100001; //12
		#10;
		if(s_out != 12'b000110110101)
			$display("Error: s_out is %b while it should be 000110110101", s_out);
		#10;
		y_in = 12'b000001100110; //13
		x_in = 12'b000001111000; //14
		#10;
		if(s_out != 12'b000111010100)
			$display("Error: s_out is %b while it should be 000111010100", s_out);
		#10;
		x_in = 12'b111101110000; //254
		y_in = 12'b000000000111; //1
		#10;
		if(s_out != 12'b111101110111) //255
			$display("Error: s_out is %b while it should be 111101110111", s_out);
		#10;
		x_in = 12'b000000000111; //3
		y_in = 12'b000000011110; //1
		#10;
		if(s_out != 12'b000000101010) //255
			$display("Error: s_out is %b while it should be 111101110111", s_out);
		#10;
		

	end
      
endmodule

