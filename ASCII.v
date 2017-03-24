`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:52:20 03/21/2017 
// Design Name: 
// Module Name:    ASCII 
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
module ASCII(
input [7:0]ivData,
input iCE,
input iClk,
input iReset,
output [6:0] ovDisplay
    );


reg [6:0]rvDisplay_Q;
reg [6:0]rvDisplay_D;

assign ovDisplay=rvDisplay_Q;

always @(posedge iClk)
begin
	
	if(iReset)
	begin
		rvDisplay_Q<=7'b0111111;
	end
	else
	begin
		if(iCE)
		begin
			rvDisplay_Q<=rvDisplay_D;
		end
		else
		begin
			rvDisplay_Q<=rvDisplay_Q;
		end
	end

end

always @*
begin
	case(ivData)
	8'd65:rvDisplay_D=7'b0001000;//a
	8'd66:rvDisplay_D=7'b0000000;//b
	8'd67:rvDisplay_D=7'b1000110;//c
	8'd68:rvDisplay_D=7'b1000000;//d
	8'd69:rvDisplay_D=7'b0000110;//e
	8'd70:rvDisplay_D=7'b0001110;//f
	8'd71:rvDisplay_D=7'b1000010;//g
	8'd72:rvDisplay_D=7'b0001001;//h
	8'd73:rvDisplay_D=7'b1111001;//i
	8'd74:rvDisplay_D=7'b1100001;//j
	8'd75:rvDisplay_D=7'b0001001;//k
	8'd76:rvDisplay_D=7'b1000111;//l
	8'd77:rvDisplay_D=7'b0101011;//m
	8'd78:rvDisplay_D=7'b0101011;//n
	8'd79:rvDisplay_D=7'b0100011;//o
	8'd80:rvDisplay_D=7'b0001100;//p
	8'd81:rvDisplay_D=7'b0011000;//q
	8'd82:rvDisplay_D=7'b0101111;//r
	8'd83:rvDisplay_D=7'b0010010;//s
	8'd84:rvDisplay_D=7'b0111001;//t
	8'd85:rvDisplay_D=7'b1100011;//u
	8'd86:rvDisplay_D=7'b1100011;//v
	8'd87:rvDisplay_D=7'b1100011;//w
	8'd88:rvDisplay_D=7'b0111001;//x
	8'd89:rvDisplay_D=7'b0011001;//y
	8'd90:rvDisplay_D=7'b0100100;//z
	default:rvDisplay_D=7'b0111111;
	endcase
end

endmodule
