module LFSR_for_hc(
	clk,rst,data_out_LFSR
);

input wire clk,rst;
output [15:0] data_out_LFSR; 
wire polyn_data,polyn_data_for0;
reg [15:0] random;

assign polyn_data = (random[15]^random[14]^random[12]^random[3]);
assign polyn_data_for0 = ~random[15]&~random[14]&~random[12]&~random[3];
assign data_out_LFSR = {random[14:0],polyn_data||polyn_data_for0};

always @(posedge clk or posedge rst)
	if(rst) 
		random <= 16'b1;
	else begin 
		random <= data_out_LFSR;
		if(data_out_LFSR == 16'hA541) 
			$display("11");
	end
  
endmodule
