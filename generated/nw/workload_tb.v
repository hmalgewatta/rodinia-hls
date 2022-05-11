`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2022 06:23:44 AM
// Design Name: 
// Module Name: workload_tb
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


module workload_tb(

    );
    
 wire SEQA_ce0;
 wire SEQB_ce0;
 wire alignedA_ce0;
 wire alignedA_we0;
 wire alignedB_ce0;
 wire alignedB_we0;
reg ap_clk;
reg  ap_rst;
reg  ap_start;
 wire ap_done;
 wire ap_idle;
 wire ap_ready;
 wire [14 : 0] SEQA_address0;
reg  [7 : 0] SEQA_q0;
 wire [14 : 0] SEQB_address0;
reg  [7 : 0] SEQB_q0;
 wire [15 : 0] alignedA_address0;
 wire [7 : 0] alignedA_d0;
 wire [15 : 0] alignedB_address0;
 wire [7 : 0] alignedB_d0;
reg  [31 : 0] num_jobs;

reg [128*8: 1] in1;
reg [128*8: 1] in2;

reg [256*8: 1] out1;
reg [256*8: 1] out2;

integer i,j;
    
  workload_0 DUT(
  SEQA_ce0,
  SEQB_ce0,
  alignedA_ce0,
  alignedA_we0,
  alignedB_ce0,
  alignedB_we0,
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  SEQA_address0,
  SEQA_q0,
  SEQB_address0,
  SEQB_q0,
  alignedA_address0,
  alignedA_d0,
  alignedB_address0,
  alignedB_d0,
  num_jobs
);

always #2 ap_clk = ~ap_clk;

initial begin
    in1 = "tcgacgaaataggatgacagcacgttctcgtattagagggccgcggtacaaaccaaatgctgcggcgtacagggcacggggcgctgttcgggagatcgggggaatcgtggcgtgggtgattcgccggc";
    in2 = "ttcgagggcgcgtgtcgcggtccatcgacatgcccggtcggtgggacgtgggcgcctgatatagaggaatgcgattggaaggtcggacgggtcggcgagttgggcccggtgaatctgccatggtcgat";
    ap_start = 1;
    ap_rst = 1;
    ap_clk = 1;
    num_jobs = 1;
    i = 0; j = 0;
    @(posedge ap_clk) ap_rst = 0;
end

always@(posedge ap_clk) begin
if (!ap_rst) begin
if (SEQA_ce0) begin
    SEQA_q0 <= in1[8*(128-SEQA_address0)-:8];
    j <= j+ 1;
end
if (SEQB_ce0) begin
    SEQB_q0 <= in2[8*(128-SEQB_address0)-:8];
    i <= i + 1;
end
if (alignedA_ce0 && alignedA_we0) begin
    out1[8*(256-alignedA_address0) -: 8] <= alignedA_d0;
end
if (alignedB_ce0 && alignedB_we0) begin
    out2[8*(256-alignedB_address0) -: 8] <= alignedB_d0;
end
end
end


endmodule
