`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2025 04:28:10 PM
// Design Name: 
// Module Name: CPU_testbench
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


module CPU_tb();
  reg reset;
  reg clk;
  reg [1:0] mux_clk;
  reg interrupt_pending;
  wire [15:0] ret_addr; 
  wire over_flow, under_flow;
  wire int_enable;
  wire icr_sel;
  wire [15:0] instruction;
  wire [15:0]pc_out;
  wire [15:0] r3,sp,r2; 
  wire [15:0] r4;
  wire [15:0] r5;
  wire [15:0] r6;

  TOP uut (
    .clk_out(clk),
    .reset(reset),
    .icr_sel(icr_sel),
    .int_enable(int_enable),
    .mux_clk(mux_clk),
    .interrupt_pending(interrupt_pending),
    .over_flow(over_flow),
    .under_flow(under_flow),
    .sp(sp),
    .ret_addr(ret_addr),
    .instruction(instruction),
    .r3(r3),
    .r4(r4),
    .r5(r5),
    .r6(r6),
    .r2(r2),
    .address(pc_out)
  );
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
reset = 1;
interrupt_pending = 0;
mux_clk = 3'b10;
#3;
reset = 0;
//#240;
//interrupt_pending = 1;
//#15;
//interrupt_pending = 0;
//#1107;
//interrupt_pending = 1;
//#13;
//interrupt_pending = 0;
end
endmodule

