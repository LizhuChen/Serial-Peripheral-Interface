`timescale 1 ns / 10 ps
module calculus(dout, clk, A_in, C_in, aluop_st2, sel) ;

input clk,aluop_st2 ;
input [2:0] sel ;
input signed [7:0] A_in, C_in ;
output reg signed [15:0] dout ;

reg signed [15:0] temp ;
reg signed [19:0] results ;
reg signed [19:0] tempout  ;
reg signed [19:0] addout ;
reg [1:0] turn ;
reg temp_aluop_st2 ;

initial begin
	tempout = 20'd0;
	addout = 20'd0;
	temp = 0 ;
	temp_aluop_st2 = 0 ;
	results = 0 ;
	turn = 0 ;
end

always@(posedge clk) begin 
	if(aluop_st2) begin
		temp_aluop_st2 = 1 ;

	end
	else temp_aluop_st2 = 0 ;
end

always@(posedge clk) begin 
	if(temp_aluop_st2) begin
		temp = A_in * C_in ;
		addout = addout + {{4{temp[15]}},temp} ;
		tempout = addout ;
		turn = sel[1:0] ;
		if( sel[2] == 1 ) begin 
			case(turn)
				2'b00:begin
					if(tempout[3] == 1 ) results = tempout + 16 ;
					else results = tempout ;
				end
				2'b01:begin
					if(tempout[2] == 1 ) results = tempout + 8 ;
					else results = tempout ;
				end
				2'b10:begin
					if(tempout[1] == 1 ) results = tempout + 4 ;
					else results = tempout ;
				end
				2'b11:begin
					if(tempout[0] == 1 ) results = tempout + 2 ;
					else results = tempout ;
				end
			endcase
		end
		else results = tempout ;

		addout <= results ;
		dout <= results[19:4] ;
	end
	else begin
		dout <= 0 ;
	end
end



endmodule