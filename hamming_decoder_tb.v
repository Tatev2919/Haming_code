module hamming_decoder_tb;
reg [20:0] data_in1;
wire err;
wire [15:0] data_out1;

hamming_decoder hamm_dec(
.data_in1(data_in1),
.err(err),
.data_out1(data_out1)
);
initial
begin
//#10	data_in = 21'b000010001100001011101;
#15 data_in1 = 21'b100110000110001011101; 
#1000 $finish;
end
initial
begin
	$dumpfile("hamming_decoder_tb.vcd");
	$dumpvars();
	
end

endmodule

