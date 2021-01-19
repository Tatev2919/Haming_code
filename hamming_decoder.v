module hamming_decoder(output reg [15:0]data_out_hd,
output reg err,
input [20:0] data_in1);


reg [4:0] S;
reg [4:0] pout;
reg [4:0] k;

always@(*)
begin 
        S=0;
	data_out_hd =0 ;
        pout[0]= data_in1[2]^data_in1[4]^data_in1[6]^data_in1[8]^data_in1[10]
	           ^data_in1[12]^data_in1[14]^data_in1[16]^data_in1[18]
		   ^data_in1[20];
        pout[1]= data_in1[2]^data_in1[5]^data_in1[6]^data_in1[9]^data_in1[10]^
		   data_in1[13]^data_in1[14]^data_in1[17]^data_in1[18];
        pout[2]= data_in1[4]^data_in1[5]^data_in1[6]^data_in1[11]^data_in1[12]
	           ^data_in1[13]^data_in1[14]^data_in1[19]^data_in1[20];
	pout[3]= data_in1[8]^data_in1[9]^data_in1[10]^data_in1[11]^data_in1[12]
	           ^data_in1[13]^data_in1[14];
	pout[4] = data_in1[16]^data_in1[17]^data_in1[18]^data_in1[19]^data_in1[20];
	
	for(k = 0; k<5; k=k+1)
	begin
	if(pout[k]!=data_in1[2**k-1])begin
		S =S+(2**k);
	end
       data_out_hd={data_in1[2],data_in1[6:4],
	       data_in1[14:8],data_in1[20:16]};
       data_out_hd[S-5]=~data_in1[S-5];
       if(S!=0)begin
	       err = 1;
       end else begin
	       err = 0;
       end
end

end
endmodule

