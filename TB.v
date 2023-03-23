`timescale 1 ns / 10 ps
module tb();

reg SPI_clk,clk,rst,SPI_en,SPI_data, aluop_st,aluop_st2 ;
wire SPI_RD ;



SPI spi(SPI_clk,clk,SPI_en,aluop_st,aluop_st2,SPI_data,rst,SPI_RD) ;

parameter   t1  = 50;
parameter   t2  = 1000;
parameter   t = t2 * 2 ;
parameter   tt = t1 * 10 ;
always #t1 clk = ~clk;
always #t2 SPI_clk = ~SPI_clk;

initial begin

	SPI_clk = 1 ;
	clk = 1 ;
	rst = 1 ;
	SPI_en = 1 ;
	aluop_st = 0 ;
	aluop_st2 = 0 ;
	#t rst = 0 ;
	SPI_en = 0 ;
	
	//第一筆資料
	SPI_data = 0 ;

	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //A2~A0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D18~D16
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t	SPI_en = 1 ;	
	
	//第二筆資料
	
	#t SPI_en = 0 ;
	
	SPI_data = 0 ;

	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //A2~A0
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D18~D16
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t	SPI_en = 1 ;

	#t SPI_en = 0 ;
	
	//第三筆資料
	SPI_data = 0 ;

	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //A2~A0
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D18~D16
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t	SPI_en = 1 ;

	#t SPI_en = 0 ;
	
	//第四筆資料
	SPI_data = 0 ;

	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //A2~A0
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D18~D16
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t	SPI_en = 1 ;

	#t SPI_en = 0 ;
	
	//第五筆資料
	SPI_data = 0 ;

	#t SPI_data = 0 ;
	
	#t SPI_data = 1 ; //A2~A0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 1 ; //D18~D16
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t	SPI_en = 1 ;

	#t SPI_en = 0 ;
	
	//第六筆資料
	SPI_data = 0 ;

	#t SPI_data = 0 ;
	
	#t SPI_data = 1 ; //A2~A0
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 1 ; //D18~D16
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t	SPI_en = 1 ;

	#t SPI_en = 0 ;
	
	//第七筆資料
	SPI_data = 0 ;

	#t SPI_data = 0 ;
	
	#t SPI_data = 1 ; //A2~A0
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 1 ; //D18~D16
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t	SPI_en = 1 ;

	#t SPI_en = 0 ;
	
	//第八筆資料
	SPI_data = 0 ;

	#t SPI_data = 0 ;
	
	#t SPI_data = 1 ; //A2~A0
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 1 ; //D18~D16
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t	SPI_en = 1 ;
//---------------------------------
	
	#t SPI_en = 0 ; //MAC_data
	
	SPI_data = 0 ;

	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //A2~A0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D18~D16 無條件捨去
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	
	#t	SPI_en = 1 ;

	#t SPI_en = 0 ; //MAC_data1
	
	SPI_data = 0 ;

	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //A2~A0
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 1 ; //D18~D16 四捨五入
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	
	#t	SPI_en = 1 ;

	#t SPI_en = 0 ; //MAC_data2
	
	SPI_data = 0 ;

	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //A2~A0
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D18~D16 四捨五入
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	
	#t	SPI_en = 1 ;	

	#t SPI_en = 0 ; //MAC_data3
	
	SPI_data = 0 ;

	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //A2~A0
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 1 ; //D18~D16 無條件捨去
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	
	#t	SPI_en = 1 ;

	#t SPI_en = 0 ; //MAC_data4
	
	SPI_data = 0 ;

	#t SPI_data = 1 ;
	
	#t SPI_data = 1 ; //A2~A0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D18~D16 四捨五入
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	
	#t	SPI_en = 1 ;

	#t SPI_en = 0 ; //MAC_data5
	
	SPI_data = 0 ;

	#t SPI_data = 1 ;
	
	#t SPI_data = 1 ; //A2~A0
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 1 ; //D18~D16 無條件捨去
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	
	#t	SPI_en = 1 ;
	
	#t SPI_en = 0 ; //MAC_data6
	
	SPI_data = 0 ;

	#t SPI_data = 1 ;
	
	#t SPI_data = 1 ; //A2~A0
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 1 ; //D18~D16 無條件捨去
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t	SPI_en = 1 ;	
	
	#t SPI_en = 0 ; //MAC_data7
	
	SPI_data = 0 ;

	#t SPI_data = 1 ;
	
	#t SPI_data = 1 ; //A2~A0
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 1 ; //D18~D16 無條件捨去
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t	SPI_en = 1 ;	
	
	#t aluop_st = 1 ;
		aluop_st2 = 1 ;
	#t aluop_st = 0 ;
		aluop_st2 = 0 ;
		
	/*使用read功能*/
	#t	SPI_en = 0 ;
	SPI_data = 1 ;

	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //A2~A0
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 1 ; //D18~D16
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D15~D8
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	
	#t SPI_data = 0 ; //D7~D0
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 0 ;
	#t SPI_data = 1 ;
	#t SPI_data = 1 ;
	#t	SPI_en = 1 ;
		
	#tt 
	$stop ;
	
	
	
end

endmodule


