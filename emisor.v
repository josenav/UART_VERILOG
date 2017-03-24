`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:24 03/20/2017 
// Design Name: 
// Module Name:    emisor 
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
module emisor(
input iClk,
input iCE,
input iReset,
input [7:0]ivCarga0,
input [7:0]ivCarga1,
input [7:0]ivCarga2,
input [7:0]ivCarga3,
output oDato
);

reg [3:0]rvCount_D=0;
reg [3:0]rvCount_Q=0;
reg rDato_D=0;
reg rDato_Q=0;
reg [1:0]rvIndex_Q=0;
reg [1:0]rvIndex_D=0;

assign oDato=rDato_Q;

always @(posedge iClk)
begin
	if(iReset)
	begin
		rvCount_Q<=0;
		rDato_Q<=0;
		rvIndex_Q<=0;
	end
	else
	begin
		if(iCE)
		begin
			rvCount_Q<=rvCount_D;
			rDato_Q<=rDato_D;
			rvIndex_Q<=rvIndex_D;
		end
		else
		begin
			rvCount_Q<=rvCount_Q;
			rDato_Q<=rDato_Q;
			rvIndex_Q<=rvIndex_Q;
		end
	end
end

always @*
begin
	rvIndex_D=rvIndex_Q;
	if(rvIndex_Q==2'd0)
	begin
		
		case (rvCount_Q)
			4'd0: rDato_D=1;
			4'd1: rDato_D=ivCarga0[0];
			4'd2: rDato_D=ivCarga0[1];
			4'd3: rDato_D=ivCarga0[2];
			4'd4: rDato_D=ivCarga0[3];
			4'd5: rDato_D=ivCarga0[4];
			4'd6: rDato_D=ivCarga0[5];
			4'd7: rDato_D=ivCarga0[6];
			4'd8: rDato_D=ivCarga0[7];
			4'd9: rDato_D=ivCarga0[0]^ivCarga0[1]^ivCarga0[2]^ivCarga0[3]^ivCarga0[4]^ivCarga0[5]^ivCarga0[6]^ivCarga0[7];
			4'd10:rDato_D=1'd0;
			4'd11:rDato_D=1'd0;
			default:rDato_D=0;
		endcase
	end
	else if(rvIndex_Q==2'd1)
	begin
		case (rvCount_Q)
			4'd0: rDato_D=1;
			4'd1: rDato_D=ivCarga1[0];
			4'd2: rDato_D=ivCarga1[1];
			4'd3: rDato_D=ivCarga1[2];
			4'd4: rDato_D=ivCarga1[3];
			4'd5: rDato_D=ivCarga1[4];
			4'd6: rDato_D=ivCarga1[5];
			4'd7: rDato_D=ivCarga1[6];
			4'd8: rDato_D=ivCarga1[7];
			4'd9: rDato_D=ivCarga1[0]^ivCarga1[1]^ivCarga1[2]^ivCarga1[3]^ivCarga1[4]^ivCarga1[5]^ivCarga1[6]^ivCarga1[7];
			4'd10:rDato_D=1'd0;
			4'd11:rDato_D=1'd0;
			default:rDato_D=0;
		endcase
	end
	else if(rvIndex_Q==2'd2)
	begin
		case (rvCount_Q)
			4'd0: rDato_D=1;
			4'd1: rDato_D=ivCarga2[0];
			4'd2: rDato_D=ivCarga2[1];
			4'd3: rDato_D=ivCarga2[2];
			4'd4: rDato_D=ivCarga2[3];
			4'd5: rDato_D=ivCarga2[4];
			4'd6: rDato_D=ivCarga2[5];
			4'd7: rDato_D=ivCarga2[6];
			4'd8: rDato_D=ivCarga2[7];
			4'd9: rDato_D=ivCarga2[0]^ivCarga2[1]^ivCarga2[2]^ivCarga2[3]^ivCarga2[4]^ivCarga2[5]^ivCarga2[6]^ivCarga2[7];
			4'd10:rDato_D=1'd0;
			4'd11:rDato_D=1'd0;
			default:rDato_D=0;
		endcase
	end
	else if(rvIndex_Q==2'd3)
	begin
		case (rvCount_Q)
			4'd0: rDato_D=1;
			4'd1: rDato_D=ivCarga3[0];
			4'd2: rDato_D=ivCarga3[1];
			4'd3: rDato_D=ivCarga3[2];
			4'd4: rDato_D=ivCarga3[3];
			4'd5: rDato_D=ivCarga3[4];
			4'd6: rDato_D=ivCarga3[5];
			4'd7: rDato_D=ivCarga3[6];
			4'd8: rDato_D=ivCarga3[7];
			4'd9: rDato_D=ivCarga3[0]^ivCarga3[1]^ivCarga3[2]^ivCarga3[3]^ivCarga3[4]^ivCarga3[5]^ivCarga3[6]^ivCarga3[7];
			4'd10:rDato_D=1'd0;
			4'd11:rDato_D=1'd0;
			default:rDato_D=0;
		endcase
	end
if(rvCount_Q==12)
begin
	rvCount_D=0;
	rDato_D=0;
	rvIndex_D=rvIndex_Q+2'd1;
end
else
begin
	rvCount_D=rvCount_Q+1'b1;
end

end


endmodule

