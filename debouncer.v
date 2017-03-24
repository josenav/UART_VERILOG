`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:38 03/21/2017 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
input iCE,
input iClk,
input iReset,
input iboton,
output oboton
    );
	 
	 reg[3:0]rvdb_D=0;
	 reg[3:0]rvdb_Q=0;
	 reg rout_D=0;
	 reg rout_Q=0;
	 
	 assign oboton=rout_Q;
	 
always @(posedge iClk)
begin
	if(iReset)
	begin
		rvdb_Q<=4'd0;
		rout_Q<=1'b0;
	end
	else
	begin
		if(iCE)
		begin
			rvdb_Q<=rvdb_D;
			rout_Q<=rout_D;
		end
		else
		begin
			rvdb_Q<=rvdb_Q;
			rout_Q<=rout_Q;
		end
	end
end

always@*
begin
	rvdb_D[0]=iboton;
	rvdb_D[1]=rvdb_Q[0];
	rvdb_D[2]=rvdb_Q[1];
	rvdb_D[3]=rvdb_Q[2];
	if(rvdb_Q==4'b1111)
	begin
		rout_D=1'b1;
	end
	else if(rvdb_Q==4'b0000)
	begin
		rout_D=1'b0;
	end
	else
	begin
	rout_D=rout_Q;
	end
end


endmodule
