`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:58:10 02/21/2017 
// Design Name: 
// Module Name:    mAnode 
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
module mAnode(

input	iClk,
input	iReset,
input	iCE,
output	[3:0]ovAnode
    );

reg [3:0]rvAnodeQ=1;
reg [3:0]rvAnodeD=1;

assign ovAnode=~rvAnodeQ;

always @*
begin
	if(rvAnodeQ==4'b1000)
	begin
		rvAnodeD=4'b0001;
	end
	else
	begin
		rvAnodeD=rvAnodeQ<<1;
	end
end



always @(posedge iClk)
begin
	if(iReset)
	begin
		rvAnodeQ<=1;
	end
	else
	begin
		if(iCE)
		begin
			rvAnodeQ<=rvAnodeD;
		end
		else
		begin
			rvAnodeQ<=rvAnodeQ;
		end
	end
end


endmodule
