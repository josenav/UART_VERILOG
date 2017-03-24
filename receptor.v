`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:06 03/20/2017 
// Design Name: 
// Module Name:    receptor 
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
module receptor(
input iDatos,
input iClk,
input iCE,
input iReset,
output [7:0]ovCarga0,
output [7:0]ovCarga1,
output [7:0]ovCarga2,
output [7:0]ovCarga3


);

reg [7:0]rvCarga_Q;
reg [7:0]rvCarga_D;
reg rRead_D=0;//1 Significa que empieza a leer los datos 0 significa que está en standby
reg rRead_Q=0;
reg [7:0]rvLetra0_D;
reg [7:0]rvLetra0_Q;
reg [7:0]rvLetra1_D;
reg [7:0]rvLetra1_Q;
reg [7:0]rvLetra2_D;
reg [7:0]rvLetra2_Q;
reg [7:0]rvLetra3_D;
reg [7:0]rvLetra3_Q;
reg [3:0]rvCount_D=0;
reg [3:0]rvCount_Q=0;
reg [1:0]rvIndex_D=0;
reg [1:0]rvIndex_Q=0;

assign ovCarga0=rvLetra0_Q;
assign ovCarga1=rvLetra1_Q;
assign ovCarga2=rvLetra2_Q;
assign ovCarga3=rvLetra3_Q;

always@(posedge iClk)
begin
	if(iReset)
	begin
		rvCarga_Q<=0;
		rvCount_Q<=0;
		rvLetra0_Q<=0;
		rvLetra1_Q<=0;
		rvLetra2_Q<=0;
		rvLetra3_Q<=0;
		rRead_Q<=0;
		rvIndex_Q<=0;
	end
	else
	begin
		if(iCE)
		begin
			rvCarga_Q<=rvCarga_D;
			rvLetra0_Q<=rvLetra0_D;
			rvLetra1_Q<=rvLetra1_D;
			rvLetra2_Q<=rvLetra2_D;
			rvLetra3_Q<=rvLetra3_D;
			rvCount_Q<=rvCount_D;
			rRead_Q<=rRead_D;
			rvIndex_Q<=rvIndex_D;
		end
		else
		begin
			rvCarga_Q<=rvCarga_Q;
			rvLetra0_Q<=rvLetra0_Q;
			rvLetra1_Q<=rvLetra1_Q;
			rvLetra2_Q<=rvLetra2_Q;
			rvLetra3_Q<=rvLetra3_Q;
			rRead_Q<=rRead_Q;
			rvCount_Q<=rvCount_Q;
			rvIndex_Q<=rvIndex_Q;
		end
	end
end

always@*
begin
rvCarga_D=rvCarga_Q;
rvLetra0_D=rvLetra0_Q;
rvLetra1_D=rvLetra1_Q;
rvLetra2_D=rvLetra2_Q;
rvLetra3_D=rvLetra3_Q;
rvIndex_D=rvIndex_Q;

	if(iDatos==1 && rvCount_Q==0)
	begin
		rRead_D=1;
		rvCount_D=rvCount_Q+4'd1;
		
	end
	else
		begin
		if(rvCount_Q<11 && rRead_Q==1)
		begin
			rRead_D=1;
			rvCount_D=rvCount_Q+4'd1;
			case(rvCount_Q)
				4'd1:rvCarga_D={rvCarga_Q[7:1],iDatos};
				4'd2:rvCarga_D={rvCarga_Q[7:2],iDatos,rvCarga_Q[0]};
				4'd3:rvCarga_D={rvCarga_Q[7:3],iDatos,rvCarga_Q[1:0]};
				4'd4:rvCarga_D={rvCarga_Q[7:4],iDatos,rvCarga_Q[2:0]};
				4'd5:rvCarga_D={rvCarga_Q[7:5],iDatos,rvCarga_Q[3:0]};
				4'd6:rvCarga_D={rvCarga_Q[7:6],iDatos,rvCarga_Q[4:0]};
				4'd7:rvCarga_D={rvCarga_Q[7],iDatos,rvCarga_Q[5:0]};
				4'd8:rvCarga_D={iDatos,rvCarga_Q[6:0]};
				4'd10:rvCarga_D=rvCarga_Q;
				4'd9:begin
						if(iDatos==rvCarga_Q[0]^rvCarga_Q[1]^rvCarga_Q[2]^rvCarga_Q[3]^rvCarga_Q[4]^rvCarga_Q[5]^rvCarga_Q[6]^rvCarga_Q[7])
						begin
							rvCount_D=rvCount_Q+4'd1;
						end
						else
						begin
							rvCount_D=rvCount_Q+1;
							rRead_D=0;
						end
					end
				default:rvCarga_D=rvCarga_Q;
			endcase
		end
		else if(rvCount_Q==11)//fin de la cuenta o bit de finalización
		begin
			rRead_D=0;
			rvCount_D=0;
			rvIndex_D=rvIndex_Q+2'd1;
			
			case(rvIndex_Q)
				2'd0:rvLetra0_D = rvCarga_Q;
				2'd1:rvLetra1_D = rvCarga_Q;
				2'd2:rvLetra2_D = rvCarga_Q;
				2'd3:rvLetra3_D = rvCarga_Q;
				default:begin
					rvLetra0_D=rvLetra0_Q;
					rvLetra1_D=rvLetra1_Q;
					rvLetra2_D=rvLetra2_Q;
					rvLetra3_D=rvLetra3_Q;
				end
			endcase
		end
		else
		begin
			rRead_D=rRead_Q;
			rvCount_D=rvCount_Q;
			
		end
	end
end


endmodule
