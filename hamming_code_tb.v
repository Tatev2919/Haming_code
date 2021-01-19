module hamming_code_tb;
	reg rst,clk;
	reg [15:0] data_in;
	wire [20:0] data_out;

	hamming_code hc (clk,rst,data_in,data_out);
	initial begin
		$dumpfile("v.vcd");
		$dumpvars();
	end 

	initial begin
		clk = 0;
		rst = 1;
		#25;
		rst = 0;
		data_in = 16'd15;
		#5000;
		$finish;
	end
	
	always #10 clk = ~clk;
endmodule
