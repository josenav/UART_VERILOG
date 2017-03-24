`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:04:27 03/07/2017 
// Design Name: 
// Module Name:    m_divisor_frecuencia_anode 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module m_divisor_frecuencia_anode #(parameter FREQ=17'd100000)(

input iCE,
input iClk,
input iReset,
output oClkmod

 );
	 
reg [23:0]rvD=0;
reg [23:0]rvQ=0;
reg rClkD=0;
reg rClkQ=0;


assign oClkmod=rClkQ; 
	 
always @*
begin
	if(rvQ==FREQ)
	begin
		rvD=0;
		rClkD=1;
	end
	else
	begin
		rvD=rvQ+1'b1;
		rClkD=0;
	end
	
end

always @(posedge iClk)
begin
	if(iReset)
	begin
		rvQ<=0;
		rClkQ<=0;
	end
	else
	begin
		if(iCE)
		begin
			rvQ<=rvD;
			rClkQ<=rClkD;
		end
		else
		begin
			rvQ<=rvQ;
			rClkQ<=rClkQ;
		end
	end
end

endmodule

