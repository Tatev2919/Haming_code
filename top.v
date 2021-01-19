`include "LFSR.v"
`include "hamming_code.v"

module top(
	clk,rst,data_out
);
	input              clk,rst;
	output     [20:0] data_out;
	wire       [15:0] data_gen;

	LFSR_for_hc lf1(clk,rst,data_gen);
	hamming_code hc(clk,rst,data_gen,data_out);

endmodule 
