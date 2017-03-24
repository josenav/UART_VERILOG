`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:29 03/21/2017 
// Design Name: 
// Module Name:    top_receptor 
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
module top_receptor(
input iClk,
input iReset,
input iDatos,
output oDatos,
output [3:0]Anode,
output [6:0]ovDisplay
    );

wire [7:0]wv_ASCII0;
wire [7:0]wv_ASCII1;
wire [7:0]wv_ASCII2;
wire [7:0]wv_ASCII3;
wire [6:0]wvDisplay0;
wire [6:0]wvDisplay1;
wire [6:0]wvDisplay2;
wire [6:0]wvDisplay3;
wire wClkmod;
wire [3:0]wvAnode;
wire wReset;
wire wDato;
wire wClkmod_UART;

assign Anode=wvAnode;

m_divisor_frecuencia_anode #(23'd5000000) divider_UART (
    .iCE(1'b1), 
    .iClk(iClk), 
    .iReset(1'b0), 
    .oClkmod(wClkmod_UART)
    );

debouncer instance_debouncer (
    .iCE(1'b1), 
    .iClk(iClk), 
    .iReset(1'b0), 
    .iboton(iReset), 
    .oboton(wReset)
    );

synch instance_synch (
    .iCE(1'b1), 
    .iReset(1'b0), 
    .iDato(iDatos), 
    .iClk(iClk), 
    .oDato(wDato)
    );




receptor instance_UART_rec (
    .iDatos(wDato), 
    .iClk(iClk), 
    .iCE(wClkmod_UART), 
    .iReset(wReset), 
    .ovCarga0(wv_ASCII0), 
    .ovCarga1(wv_ASCII1), 
    .ovCarga2(wv_ASCII2), 
    .ovCarga3(wv_ASCII3)
    );

ASCII instance_ASCII_0 (
    .ivData(wv_ASCII0), 
    .iCE(1'b1), 
    .iClk(iClk), 
    .iReset(wReset), 
    .ovDisplay(wvDisplay0)
    );
ASCII instance_ASCII_1 (
    .ivData(wv_ASCII1), 
    .iCE(1'b1), 
    .iClk(iClk), 
    .iReset(wReset), 
    .ovDisplay(wvDisplay1)
    );
ASCII instance_ASCII_2 (
    .ivData(wv_ASCII2), 
    .iCE(1'b1), 
    .iClk(iClk), 
    .iReset(wReset), 
    .ovDisplay(wvDisplay2)
    );
ASCII instance_ASCII_3 (
    .ivData(wv_ASCII3), 
    .iCE(1'b1), 
    .iClk(iClk), 
    .iReset(wReset), 
    .ovDisplay(wvDisplay3)
    );

Selecto_Display instance_Mux(
    .ivAnode(wvAnode), 
    .iClk(iClk), 
    .iCE(1'b1), 
    .iReset(wReset), 
    .ivDisplay0(wvDisplay0), 
    .ivDisplay1(wvDisplay1), 
    .ivDisplay2(wvDisplay2), 
    .ivDisplay3(wvDisplay3), 
    .ovDisplay(ovDisplay)
    );


mAnode instance_Anode(
    .iClk(iClk), 
    .iReset(wReset), 
    .iCE(wClkmod), 
    .ovAnode(wvAnode)
    );

m_divisor_frecuencia_anode divider(
    .iCE(1'b1), 
    .iClk(iClk), 
    .iReset(wReset), 
    .oClkmod(wClkmod)
    );


emisor instance_emisor (
    .iClk(iClk), 
    .iCE(wClkmod_UART), 
    .iReset(wReset), 
    .ivCarga0(8'd72), 
    .ivCarga1(8'd79), 
    .ivCarga2(8'd76), 
    .ivCarga3(8'd65), 
    .oDato(oDatos)
    );






endmodule
