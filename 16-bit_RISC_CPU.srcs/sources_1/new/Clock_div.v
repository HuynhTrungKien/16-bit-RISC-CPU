`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2025 04:58:49 PM
// Design Name: 
// Module Name: Clock_div
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:57:48 11/06/2024 
// Design Name: 
// Module Name:    Clock_div 
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
module Clock_div(clk_100, rst,/*clk_2hz,*/clk_4hz,clk_8hz,clk_100hz); 
input clk_100;
input rst;
//output reg clk_2hz ;
output reg clk_4hz ;
output reg clk_8hz ;
output reg clk_100hz ;
//reg [24:0]counter2Hz; 
reg [23:0]counter4Hz; 
reg [22:0]counter8Hz;  
reg [18:0]counter100Hz; 
wire [4:0] equal; //1Hz;equal2Hz;equal4Hz;equal8Hz;equal1kHz;
parameter /*div_2Hz = 24_499_999,*/ div_4Hz = 12_249_999,div_8Hz = 6_124_999,div_100Hz = 1;
//parameter div_1Hz = 49,   // For sim only
//          div_2Hz = 24,
//          div_4Hz = 12,
//          div_8Hz = 6,
//          div_10kHz = 2;
//assign equal[1] = (counter2Hz == div_2Hz)? 1'b1: 1'b0;
assign equal[2] = (counter4Hz == div_4Hz)? 1'b1: 1'b0;
assign equal[3] = (counter8Hz == div_8Hz)? 1'b1: 1'b0;
assign equal[4] = (counter100Hz == div_100Hz)? 1'b1: 1'b0;
initial begin
//clk_2hz = 0;
clk_4hz = 0;
clk_8hz = 0;
clk_100hz = 0;
//counter2Hz = 0;
counter4Hz = 0;
counter8Hz = 0;
counter100Hz = 0;
end
always @(posedge clk_100) begin
    if (rst) begin
//        counter2Hz <= 0;
        counter4Hz <= 0;
        counter8Hz <= 0;
        counter100Hz <= 0;
    end else begin
//        if (equal[1]) counter2Hz <= 0; else counter2Hz <= counter2Hz + 1;
        if (equal[2]) counter4Hz <= 0; else counter4Hz <= counter4Hz + 1;
        if (equal[3]) counter8Hz <= 0; else counter8Hz <= counter8Hz + 1;
        if (equal[4]) counter100Hz <= 0; else counter100Hz <= counter100Hz + 1;
    end
end

always @(posedge clk_100) begin
    if (rst) begin
//       clk_2hz <= 0; 
       clk_4hz <= 0; clk_8hz <= 0; clk_100hz <= 0;
    end else begin
//        if (equal[1]) clk_2hz <= ~clk_2hz;
        if (equal[2]) clk_4hz <= ~clk_4hz;
        if (equal[3]) clk_8hz <= ~clk_8hz;
        if (equal[4]) clk_100hz <= ~clk_100hz;
    end
end
endmodule
