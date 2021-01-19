`include "LFSR.v"
`include "hamming_code.v"
`include "hamming_decoder.v"

module top(
	clk,rst,data_out_all
);
	input             clk,rst;
	output   [15:0]   data_out_all;
	wire     [20:0]   data_out;
	wire     [15:0]   data_gen;
	wire 		  err;

	LFSR_for_hc     lf1    (clk,rst,data_gen);
	hamming_code    h_code (clk,rst,data_gen,data_out);
	hamming_decoder h_dec  (data_out_all,err,data_out);

endmodule 
