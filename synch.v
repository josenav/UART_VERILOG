`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:16 03/22/2017 
// Design Name: 
// Module Name:    synch 
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
module synch(
input iCE,
input iReset,
input iDato,
input iClk,
output oDato
    );
reg [1:0]rvDato_Q;
reg [1:0]rvDato_D;

assign oDato=rvDato_Q[1];

always@(posedge iClk)
begin
	if(iReset)
	begin
		rvDato_Q<=1'b0;
	end
	else
	begin
		if(iCE)
		begin
			rvDato_Q<=rvDato_D;
		end
		else
		begin
			rvDato_Q<=rvDato_Q;
		end
	end
end

always@*
begin
	rvDato_D[0]=iDato;
	rvDato_D[1]=rvDato_Q[0];
end

endmodule
