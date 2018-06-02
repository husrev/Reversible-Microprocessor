module bustap(
    input rw, 
    input [11:0] addr,
    input [11:0] data,
    output reg [24:0] data_out 
    );

always @*
	data_out <= {rw,addr,data_out};

endmodule

