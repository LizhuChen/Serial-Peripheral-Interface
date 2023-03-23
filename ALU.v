`timescale 1 ns / 10 ps
module ALU(clk,a,b,sel,out,aluop_st);
input signed[7:0] a,b ;
input [2:0] sel ;
output signed [7:0] out ;
	
input clk,aluop_st;	
	
reg signed [15:0] temp ;
reg signed [15:0] tmp ;
reg signed [7:0] results ;

always@(posedge clk) begin 
	if(aluop_st) begin
		case(sel)                  
			3'b000: begin
			temp = a + b;    
			results = temp[8:1] ;
			end
			3'b001: begin 
				tmp = ~b + 1 ;
				temp = a + tmp;   
				results	= temp[8:1] ;	
			end
			3'b010: results = a & b;      
			3'b011: results = a | b;      
			3'b100: results = a ^ b;      
			3'b101: begin
				temp = (a >> 1) ;
				tmp = 4*b ;
				temp = temp + tmp ;
				results = temp[10:3] ;
			end
			3'b110: begin
				tmp = a+b ;
				temp = tmp * 3 ;
				results = temp[10:3] ;		
			end
			3'b111: begin
				temp = 6*a;   
				tmp = (b >> 2) ;
				temp = temp + tmp ;
				results = temp[10:3] ;		
			end
		endcase
	end
	else results = 0 ;
end

assign out = results ;

endmodule