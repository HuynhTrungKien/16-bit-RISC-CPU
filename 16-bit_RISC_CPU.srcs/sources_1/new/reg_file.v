`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2025 02:19:06 PM
// Design Name: 
// Module Name: reg_file
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


// REGISTER FILE

module reg_file(rs1,rs2,rd,data,reg_wrt,readA_out,readB_out,r3,r0,r1,r2,r4,r5,r6,r7,clk);
input reg_wrt,clk;
input [2:0]rs1,rs2,rd;
input [15:0]data;
output [15:0]readA_out,readB_out;
output [15:0] r0,r1,r2,r3,r4,r5,r6,r7;

reg [15:0] x [0:7];
integer i;
initial begin
x[0]=0;//R0 contains zero
x[1]=0;  // Stack pointer 
x[2]=0;    // Return address
x[3]=0;     // Function argument/ result
x[4]=0;     // General purpose
x[5]=0; // General purpose
x[6]=0;    // General purpose
x[7]=0;    // Link register/temp/loop/ var
end

always @(posedge clk)
begin
if(reg_wrt==1)
 x[rd]<=data;
end
assign readA_out = x[rs1];
assign readB_out = x[rs2];
assign r0 = x[0];
assign r1 = x[1];
assign r2 = x[2];
assign r3 = x[3];
assign r4 = x[4];
assign r5 = x[5];
assign r6 = x[6];
assign r7 = x[7];
endmodule