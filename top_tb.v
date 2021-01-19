module top_tb;
	reg clk,rst;
	wire [15:0] data_out;

	top t1(clk,rst,data_out);
	initial begin 
		$dumpfile("v.vcd");
		$dumpvars();
	end

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		#25;
		rst = 1'b0;
		#500;
		$finish;
	end

	always #10 clk = ~clk;

endmodule
