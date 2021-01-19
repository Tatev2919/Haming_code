module hamming_code(
	clk,rst,data_in,data_out_hc
);

input             clk,rst;
input      [15:0] data_in;
output reg [20:0] data_out_hc;
 
reg [4:0] i,k;
reg [3:0] m;


always @(rst or data_in) begin
	if (rst) begin 
		data_out_hc = 12'b0;
	end 
	else begin
		i = 5'b0;
		m = 3'b0;	
		k = 5'b0;
		while (i < 5'd20 && k < 5'd16) begin 
			if(i == (2**m)-1) begin
				data_out_hc[i] = 1'b0;
				m = m + 3'b1;
			end
			else begin
				data_out_hc[i] = data_in[k];
				k = k + 5'b1;
			end	
			i = i + 5'b1;
		end
		if(^(data_out_hc & 21'b101010101010101010101))  
			data_out_hc[0] = ~data_out_hc[0];
		if(^(data_out_hc & 21'b001100110011001100110))  
			data_out_hc[1] = ~data_out_hc[1];
		if(^(data_out_hc & 21'b110000111100001111000)) 
			data_out_hc[3] = ~data_out_hc[3];
		if(^(data_out_hc & 21'b000000111111110000000)) 
			data_out_hc[7] = ~data_out_hc[7];
		if(^(data_out_hc & 21'b111111000000000000000)) 
			data_out_hc[15] = ~data_out_hc[15];

		data_out_hc[5] = ~data_out_hc[5];
	end 
end

endmodule
