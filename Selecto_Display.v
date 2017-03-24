`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:25 03/07/2017 
// Design Name: 
// Module Name:    Selecto_Display 
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
module Selecto_Display(

input [3:0]ivAnode,
input iClk,
input iCE,
input iReset,
input [6:0]ivDisplay0,
input [6:0]ivDisplay1,
input [6:0]ivDisplay2,
input [6:0]ivDisplay3,
output [6:0]ovDisplay
    );

reg [6:0]rvDisplayQ=0;
reg [6:0]rvDisplayD=0;


assign ovDisplay=rvDisplayQ;


always @*
begin
	case (ivAnode)
	4'b1110:rvDisplayD=ivDisplay0;
	4'b1101:rvDisplayD=ivDisplay1;
	4'b1011:rvDisplayD=ivDisplay2;
	4'b0111:rvDisplayD=ivDisplay3;
	default:rvDisplayD=0;
	endcase
end

always @(posedge iClk)
begin
	if(iReset)
	begin
		rvDisplayQ<=0;		
	end
	else
	begin
		if(iCE)
		begin
			rvDisplayQ<=rvDisplayD;
		end
		else
		begin
			rvDisplayQ<=rvDisplayQ;
		end
	end
end

endmodule

