`timescale 1 ns / 10 ps
module SPI(SPI_clk,clk,SPI_en,aluop_st,aluop_st2,SPI_data,rst,SPI_RD);

input	SPI_clk,clk,aluop_st,aluop_st2,rst,SPI_en;
input   SPI_data ;
output	reg SPI_RD ;

reg [23:0] register ;
wire [23:0] data ;
reg [4:0] i ;
reg temp_en ;
reg temp2_en ;
wire judge_en ;

reg read_op ;

reg	signed [18:0] ALU_rom_data[7:0];
reg	signed [18:0] MAC_rom_data[7:0];
reg signed [7:0] ALU_rom_out[7:0];
reg signed [15:0] MAC_rom_out[7:0];
reg temp_aluop,temp_aluop2 ;
reg temp1_aluop2 ;

reg signed [7:0] temp_a,temp_b;
reg [2:0] temp_sel ;

reg signed [7:0] temp_MAC_a,temp_MAC_b;
reg [2:0] temp_MAC_sel ;

reg [3:0] temp_i ;
reg [3:0] temp_MAC_i ;
reg [3:0] MAC_i ;

initial begin
	temp1_aluop2 = 1 ;
	temp_aluop = 0 ;
	temp_aluop2 = 0 ;
	temp_en = 0 ;
	temp2_en = 0 ;
	i = 23 ;
	ALU_rom_data[0] = 8'd0;
	ALU_rom_data[1] = 8'd0;
	ALU_rom_data[2] = 8'd0;
	ALU_rom_data[3] = 8'd0;
	ALU_rom_data[4] = 8'd0;
	ALU_rom_data[5] = 8'd0;
	ALU_rom_data[6] = 8'd0;
	ALU_rom_data[7] = 8'd0;
	MAC_rom_data[0] = 8'd0;
	MAC_rom_data[1] = 8'd0;
	MAC_rom_data[2] = 8'd0;
	MAC_rom_data[3] = 8'd0;
	MAC_rom_data[4] = 8'd0;
	MAC_rom_data[5] = 8'd0;
	MAC_rom_data[6] = 8'd0;
	MAC_rom_data[7] = 8'd0;	
	temp_i = 0 ;
	temp_MAC_i = 0 ;
	temp_MAC_a = 0 ;
	temp_MAC_b = 0 ;
	temp_MAC_sel = 0 ;
	SPI_RD = 0 ;
	read_op = 0 ;
	MAC_i = 0 ;
end

assign judge_en = (temp_en == 1 && temp2_en == 0 )? 1 : 0 ;

always@( posedge SPI_clk ) begin
	temp2_en <= temp_en ;
end

always@( posedge SPI_clk ) begin
	temp_en <= SPI_en ;
	if(aluop_st) temp_aluop = 1 ;
	if(aluop_st2) temp_aluop2 = 1 ;
	if(rst)begin
		temp_en = 0 ;
		temp2_en = 0 ;
		ALU_rom_data[0] = 8'd0;
		ALU_rom_data[1] = 8'd0;
		ALU_rom_data[2] = 8'd0;
		ALU_rom_data[3] = 8'd0;
		ALU_rom_data[4] = 8'd0;
		ALU_rom_data[5] = 8'd0;
		ALU_rom_data[6] = 8'd0;
		ALU_rom_data[7] = 8'd0;
		MAC_rom_data[0] = 8'd0;
		MAC_rom_data[1] = 8'd0;
		MAC_rom_data[2] = 8'd0;
		MAC_rom_data[3] = 8'd0;
		MAC_rom_data[4] = 8'd0;
		MAC_rom_data[5] = 8'd0;
		MAC_rom_data[6] = 8'd0;
		MAC_rom_data[7] = 8'd0;	
		register = 0 ;
		i = 23 ;		
	end
	else if(!SPI_en) begin
		register[i] <= SPI_data ;
		
		if(i == 23) begin		//	判斷是否R為1
			if( SPI_data == 1 )begin
				SPI_RD <= 0 ;
				read_op = 1 ;
			end
		end
		
		if( read_op ) begin	
			if(i <= 22) begin
				SPI_RD <= 0 ;
				if(register[22]) begin
					if( i <= 15) begin
						case( register[21:19] ) 
							3'd0:begin
								SPI_RD <= MAC_rom_out[0][i] ;
							end
							3'd1:begin
								SPI_RD <= MAC_rom_out[1][i];

							end
							3'd2:begin
								SPI_RD <= MAC_rom_out[2][i];

							end
							3'd3:begin
								SPI_RD <= MAC_rom_out[3][i];

							end
							3'd4:begin
								SPI_RD <= MAC_rom_out[4][i];

							end
							3'd5:begin
								SPI_RD <= MAC_rom_out[5][i];

							end
							3'd6:begin
								SPI_RD <= MAC_rom_out[6][i] ;

							end
							3'd7:begin
								SPI_RD <= MAC_rom_out[7][i] ;
							
							end
						endcase
					end
				end
				else begin
					if( i <= 15) begin
						case( register[21:19] ) 
							3'd0:begin
								SPI_RD <= MAC_rom_out[0][15-i] ;
							end
							3'd1:begin
								SPI_RD <= MAC_rom_out[1][15-i];

							end
							3'd2:begin
								SPI_RD <= MAC_rom_out[2][15-i];

							end
							3'd3:begin
								SPI_RD <= MAC_rom_out[3][15-i];

							end
							3'd4:begin
								SPI_RD <= MAC_rom_out[4][15-i];

							end
							3'd5:begin
								SPI_RD <= MAC_rom_out[5][15-i];

							end
							3'd6:begin
								SPI_RD <= MAC_rom_out[6][15-i] ;

							end
							3'd7:begin
								SPI_RD <= MAC_rom_out[7][15-i] ;
							
							end
						endcase
					end
				end
			end
		end
			
		i = i - 1'd1 ;
	end
	else begin
		i = 23 ;
	end

end

assign data = (judge_en) ? register : 0 ;

always@(*) begin
	if(judge_en) begin
		if(register[23] == 0) begin
			if(register[22] == 0) begin
				case ( register[21:19] )
					3'd0:begin
						ALU_rom_data[0] <= register[18:0];

					end
					3'd1:begin
						ALU_rom_data[1] <= register[18:0];

					end
					3'd2:begin
						ALU_rom_data[2] <= register[18:0];

					end
					3'd3:begin
						ALU_rom_data[3] <= register[18:0];

					end
					3'd4:begin
						ALU_rom_data[4] <= register[18:0];

					end
					3'd5:begin
						ALU_rom_data[5] <= register[18:0];

					end
					3'd6:begin
						ALU_rom_data[6] <= register[18:0];

					end
					3'd7:begin
						ALU_rom_data[7] <= register[18:0];
					
					end

				endcase
			end
			else if (register[22] == 1) begin
				case ( register[21:19] )
					3'd0:begin
						MAC_rom_data[0] <= register[18:0];

					end
					3'd1:begin
						MAC_rom_data[1] <= register[18:0];

					end
					3'd2:begin
						MAC_rom_data[2] <= register[18:0];

					end
					3'd3:begin
						MAC_rom_data[3] <= register[18:0];

					end
					3'd4:begin
						MAC_rom_data[4] <= register[18:0];

					end
					3'd5:begin
						MAC_rom_data[5] <= register[18:0];

					end
					3'd6:begin
						MAC_rom_data[6] <= register[18:0];

					end
					3'd7:begin
						MAC_rom_data[7] <= register[18:0];
					
					end

				endcase			
				
			end
		end
	end
end

wire [7:0] temp_out ;

always@(posedge clk) begin
	if(temp_i == 4'd8) begin
		temp_aluop = 0 ;
		temp_i = 0 ;
	end
	else if(temp_aluop) begin
		temp_a = ALU_rom_data[temp_i][15:8] ;
		temp_b = ALU_rom_data[temp_i][7:0] ;
		temp_sel = ALU_rom_data[temp_i][18:16] ;
		temp_i = temp_i + 1'd1 ;
	end
	else temp_i = 0 ;
end


wire [15:0] temp_MAC_out ;
always@(posedge clk) begin
	if(temp1_aluop2 == 0 )temp_aluop2 = 0 ;

	if(temp_MAC_i == 4'd8) begin
		temp1_aluop2 <= 0 ;
		temp_MAC_i <= 0 ;
	end
	else if(temp_aluop2) begin
		temp_MAC_a = MAC_rom_data[temp_MAC_i][15:8] ;
		temp_MAC_b = MAC_rom_data[temp_MAC_i][7:0] ;
		temp_MAC_sel = MAC_rom_data[temp_MAC_i][18:16] ;
		temp_MAC_i <= temp_MAC_i + 1'd1 ;
	end
	else temp_MAC_i <= 0 ;
	
	if(temp_aluop2) begin
		if( temp_MAC_i < 2 )begin
			MAC_i = 0 ;
		end
		else if ( MAC_i == 8 )begin
			MAC_i = 0 ;
		end
		else MAC_i = MAC_i + 1'd1 ;
	end
end

ALU alu(clk,temp_a,temp_b,temp_sel,temp_out,aluop_st);
calculus CAL(temp_MAC_out, clk, temp_MAC_a, temp_MAC_b, temp_aluop2, temp_MAC_sel) ;

always@(*) begin
	if(temp_aluop) begin
		case ( temp_i )
			4'd0:begin
				ALU_rom_out[0] <= temp_out;

			end
			4'd1:begin
				ALU_rom_out[1] <= temp_out;

			end
			4'd2:begin
				ALU_rom_out[2] <= temp_out;

			end
			4'd3:begin
				ALU_rom_out[3] <= temp_out;

			end
			4'd4:begin
				ALU_rom_out[4] <= temp_out;

			end
			4'd5:begin
				ALU_rom_out[5] <= temp_out;

			end
			4'd6:begin
				ALU_rom_out[6] <= temp_out;

			end
			4'd7:begin
				ALU_rom_out[7] <= temp_out;

			end

		endcase
	end
	
	if(temp_aluop2) begin
		case ( MAC_i )
			4'd0:begin
				MAC_rom_out[0] <= temp_MAC_out;

			end
			4'd1:begin
				MAC_rom_out[1] <= temp_MAC_out;

			end
			4'd2:begin
				MAC_rom_out[2] <= temp_MAC_out;

			end
			4'd3:begin
				MAC_rom_out[3] <= temp_MAC_out;

			end
			4'd4:begin
				MAC_rom_out[4] <= temp_MAC_out;

			end
			4'd5:begin
				MAC_rom_out[5] <= temp_MAC_out;

			end
			4'd6:begin
				MAC_rom_out[6] <= temp_MAC_out;

			end
			4'd7:begin
				MAC_rom_out[7] <= temp_MAC_out;

			end

		endcase
	end
end

endmodule