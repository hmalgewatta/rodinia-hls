// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2019.1.2 (64-bit)
// Version: 2019.1.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module workload_needwun (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        SEQA_address0,
        SEQA_ce0,
        SEQA_q0,
        SEQA_2,
        SEQB_address0,
        SEQB_ce0,
        SEQB_q0,
        alignedA_address0,
        alignedA_ce0,
        alignedA_we0,
        alignedA_d0,
        alignedA_2,
        alignedB_address0,
        alignedB_ce0,
        alignedB_we0,
        alignedB_d0,
        M_address0,
        M_ce0,
        M_we0,
        M_d0,
        M_q0,
        ptr_address0,
        ptr_ce0,
        ptr_we0,
        ptr_d0,
        ptr_q0
);

parameter    ap_ST_fsm_state1 = 12'd1;
parameter    ap_ST_fsm_state2 = 12'd2;
parameter    ap_ST_fsm_state3 = 12'd4;
parameter    ap_ST_fsm_state4 = 12'd8;
parameter    ap_ST_fsm_state5 = 12'd16;
parameter    ap_ST_fsm_state6 = 12'd32;
parameter    ap_ST_fsm_state7 = 12'd64;
parameter    ap_ST_fsm_state8 = 12'd128;
parameter    ap_ST_fsm_state9 = 12'd256;
parameter    ap_ST_fsm_state10 = 12'd512;
parameter    ap_ST_fsm_state11 = 12'd1024;
parameter    ap_ST_fsm_state12 = 12'd2048;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [14:0] SEQA_address0;
output   SEQA_ce0;
input  [7:0] SEQA_q0;
input  [14:0] SEQA_2;
output  [14:0] SEQB_address0;
output   SEQB_ce0;
input  [7:0] SEQB_q0;
output  [15:0] alignedA_address0;
output   alignedA_ce0;
output   alignedA_we0;
output  [7:0] alignedA_d0;
input  [15:0] alignedA_2;
output  [15:0] alignedB_address0;
output   alignedB_ce0;
output   alignedB_we0;
output  [7:0] alignedB_d0;
output  [14:0] M_address0;
output   M_ce0;
output   M_we0;
output  [31:0] M_d0;
input  [31:0] M_q0;
output  [14:0] ptr_address0;
output   ptr_ce0;
output   ptr_we0;
output  [6:0] ptr_d0;
input  [6:0] ptr_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[14:0] SEQA_address0;
reg SEQA_ce0;
reg[14:0] SEQB_address0;
reg SEQB_ce0;
reg[15:0] alignedA_address0;
reg alignedA_ce0;
reg alignedA_we0;
reg[7:0] alignedA_d0;
reg[15:0] alignedB_address0;
reg alignedB_ce0;
reg alignedB_we0;
reg[7:0] alignedB_d0;
reg[14:0] M_address0;
reg M_ce0;
reg M_we0;
reg[31:0] M_d0;
reg[14:0] ptr_address0;
reg ptr_ce0;
reg ptr_we0;

(* fsm_encoding = "none" *) reg   [11:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state4;
reg   [7:0] b_idx_reg_369;
wire    ap_CS_fsm_state5;
wire   [14:0] sum4_fu_246_p2;
reg   [14:0] sum4_reg_378;
wire   [0:0] icmp_ln516_fu_204_p2;
wire   [14:0] empty_19_fu_266_p2;
reg   [14:0] empty_19_reg_383;
wire   [13:0] empty_21_fu_283_p2;
reg   [13:0] empty_21_reg_388;
wire    ap_CS_fsm_state6;
reg   [7:0] SEQB_load_reg_403;
wire    ap_CS_fsm_state7;
reg   [31:0] M_load_reg_408;
wire   [14:0] p_shl2_fu_313_p3;
reg   [14:0] p_shl2_reg_413;
wire    ap_CS_fsm_state8;
wire    grp_needwun_Pipeline_init_row_fu_126_ap_start;
wire    grp_needwun_Pipeline_init_row_fu_126_ap_done;
wire    grp_needwun_Pipeline_init_row_fu_126_ap_idle;
wire    grp_needwun_Pipeline_init_row_fu_126_ap_ready;
wire   [14:0] grp_needwun_Pipeline_init_row_fu_126_M_address0;
wire    grp_needwun_Pipeline_init_row_fu_126_M_ce0;
wire    grp_needwun_Pipeline_init_row_fu_126_M_we0;
wire   [31:0] grp_needwun_Pipeline_init_row_fu_126_M_d0;
wire    grp_needwun_Pipeline_init_col_fu_132_ap_start;
wire    grp_needwun_Pipeline_init_col_fu_132_ap_done;
wire    grp_needwun_Pipeline_init_col_fu_132_ap_idle;
wire    grp_needwun_Pipeline_init_col_fu_132_ap_ready;
wire   [14:0] grp_needwun_Pipeline_init_col_fu_132_M_address0;
wire    grp_needwun_Pipeline_init_col_fu_132_M_ce0;
wire    grp_needwun_Pipeline_init_col_fu_132_M_we0;
wire   [31:0] grp_needwun_Pipeline_init_col_fu_132_M_d0;
wire    grp_needwun_Pipeline_trace_fu_138_ap_start;
wire    grp_needwun_Pipeline_trace_fu_138_ap_done;
wire    grp_needwun_Pipeline_trace_fu_138_ap_idle;
wire    grp_needwun_Pipeline_trace_fu_138_ap_ready;
wire   [14:0] grp_needwun_Pipeline_trace_fu_138_SEQA_address0;
wire    grp_needwun_Pipeline_trace_fu_138_SEQA_ce0;
wire   [15:0] grp_needwun_Pipeline_trace_fu_138_alignedA_address0;
wire    grp_needwun_Pipeline_trace_fu_138_alignedA_ce0;
wire    grp_needwun_Pipeline_trace_fu_138_alignedA_we0;
wire   [7:0] grp_needwun_Pipeline_trace_fu_138_alignedA_d0;
wire   [14:0] grp_needwun_Pipeline_trace_fu_138_SEQB_address0;
wire    grp_needwun_Pipeline_trace_fu_138_SEQB_ce0;
wire   [15:0] grp_needwun_Pipeline_trace_fu_138_alignedB_address0;
wire    grp_needwun_Pipeline_trace_fu_138_alignedB_ce0;
wire    grp_needwun_Pipeline_trace_fu_138_alignedB_we0;
wire   [7:0] grp_needwun_Pipeline_trace_fu_138_alignedB_d0;
wire   [14:0] grp_needwun_Pipeline_trace_fu_138_ptr_address0;
wire    grp_needwun_Pipeline_trace_fu_138_ptr_ce0;
wire   [31:0] grp_needwun_Pipeline_trace_fu_138_a_str_idx_out;
wire    grp_needwun_Pipeline_trace_fu_138_a_str_idx_out_ap_vld;
wire   [31:0] grp_needwun_Pipeline_trace_fu_138_b_str_idx_out;
wire    grp_needwun_Pipeline_trace_fu_138_b_str_idx_out_ap_vld;
wire    grp_needwun_Pipeline_fill_in_fu_156_ap_start;
wire    grp_needwun_Pipeline_fill_in_fu_156_ap_done;
wire    grp_needwun_Pipeline_fill_in_fu_156_ap_idle;
wire    grp_needwun_Pipeline_fill_in_fu_156_ap_ready;
wire   [14:0] grp_needwun_Pipeline_fill_in_fu_156_SEQA_address0;
wire    grp_needwun_Pipeline_fill_in_fu_156_SEQA_ce0;
wire   [14:0] grp_needwun_Pipeline_fill_in_fu_156_M_address0;
wire    grp_needwun_Pipeline_fill_in_fu_156_M_ce0;
wire    grp_needwun_Pipeline_fill_in_fu_156_M_we0;
wire   [31:0] grp_needwun_Pipeline_fill_in_fu_156_M_d0;
wire   [14:0] grp_needwun_Pipeline_fill_in_fu_156_ptr_address0;
wire    grp_needwun_Pipeline_fill_in_fu_156_ptr_ce0;
wire    grp_needwun_Pipeline_fill_in_fu_156_ptr_we0;
wire   [6:0] grp_needwun_Pipeline_fill_in_fu_156_ptr_d0;
wire    grp_needwun_Pipeline_pad_a_fu_172_ap_start;
wire    grp_needwun_Pipeline_pad_a_fu_172_ap_done;
wire    grp_needwun_Pipeline_pad_a_fu_172_ap_idle;
wire    grp_needwun_Pipeline_pad_a_fu_172_ap_ready;
wire   [15:0] grp_needwun_Pipeline_pad_a_fu_172_alignedA_address0;
wire    grp_needwun_Pipeline_pad_a_fu_172_alignedA_ce0;
wire    grp_needwun_Pipeline_pad_a_fu_172_alignedA_we0;
wire   [7:0] grp_needwun_Pipeline_pad_a_fu_172_alignedA_d0;
wire    grp_needwun_Pipeline_pad_b_fu_180_ap_start;
wire    grp_needwun_Pipeline_pad_b_fu_180_ap_done;
wire    grp_needwun_Pipeline_pad_b_fu_180_ap_idle;
wire    grp_needwun_Pipeline_pad_b_fu_180_ap_ready;
wire   [15:0] grp_needwun_Pipeline_pad_b_fu_180_alignedB_address0;
wire    grp_needwun_Pipeline_pad_b_fu_180_alignedB_ce0;
wire    grp_needwun_Pipeline_pad_b_fu_180_alignedB_we0;
wire   [7:0] grp_needwun_Pipeline_pad_b_fu_180_alignedB_d0;
reg    grp_needwun_Pipeline_init_row_fu_126_ap_start_reg;
wire    ap_CS_fsm_state2;
reg    grp_needwun_Pipeline_init_col_fu_132_ap_start_reg;
wire    ap_CS_fsm_state3;
reg    grp_needwun_Pipeline_trace_fu_138_ap_start_reg;
wire    ap_CS_fsm_state10;
reg    grp_needwun_Pipeline_fill_in_fu_156_ap_start_reg;
wire    ap_CS_fsm_state9;
reg    grp_needwun_Pipeline_pad_a_fu_172_ap_start_reg;
wire    ap_CS_fsm_state11;
wire    ap_CS_fsm_state12;
reg    grp_needwun_Pipeline_pad_b_fu_180_ap_start_reg;
wire   [63:0] sum4_cast_fu_305_p1;
wire   [63:0] p_cast10_fu_309_p1;
reg   [7:0] b_idx_1_fu_72;
wire   [7:0] add_ln516_fu_289_p2;
reg   [7:0] indvar_fu_76;
wire   [7:0] add_ln516_1_fu_210_p2;
wire   [6:0] empty_17_fu_220_p1;
wire   [13:0] p_shl_fu_224_p3;
wire   [8:0] zext_ln516_fu_216_p1;
wire   [8:0] tmp_fu_236_p2;
wire   [14:0] tmp_cast_fu_242_p1;
wire   [14:0] p_shl19_cast_fu_232_p1;
wire   [7:0] empty_18_fu_252_p2;
wire   [14:0] p_cast_fu_262_p1;
wire   [6:0] empty_20_fu_271_p1;
wire   [13:0] p_shl1_fu_275_p3;
wire   [13:0] p_cast2_fu_258_p1;
reg    ap_block_state12_on_subcall_done;
reg   [11:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
reg    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
reg    ap_ST_fsm_state12_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 12'd1;
#0 grp_needwun_Pipeline_init_row_fu_126_ap_start_reg = 1'b0;
#0 grp_needwun_Pipeline_init_col_fu_132_ap_start_reg = 1'b0;
#0 grp_needwun_Pipeline_trace_fu_138_ap_start_reg = 1'b0;
#0 grp_needwun_Pipeline_fill_in_fu_156_ap_start_reg = 1'b0;
#0 grp_needwun_Pipeline_pad_a_fu_172_ap_start_reg = 1'b0;
#0 grp_needwun_Pipeline_pad_b_fu_180_ap_start_reg = 1'b0;
end

workload_needwun_Pipeline_init_row grp_needwun_Pipeline_init_row_fu_126(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_needwun_Pipeline_init_row_fu_126_ap_start),
    .ap_done(grp_needwun_Pipeline_init_row_fu_126_ap_done),
    .ap_idle(grp_needwun_Pipeline_init_row_fu_126_ap_idle),
    .ap_ready(grp_needwun_Pipeline_init_row_fu_126_ap_ready),
    .M_address0(grp_needwun_Pipeline_init_row_fu_126_M_address0),
    .M_ce0(grp_needwun_Pipeline_init_row_fu_126_M_ce0),
    .M_we0(grp_needwun_Pipeline_init_row_fu_126_M_we0),
    .M_d0(grp_needwun_Pipeline_init_row_fu_126_M_d0)
);

workload_needwun_Pipeline_init_col grp_needwun_Pipeline_init_col_fu_132(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_needwun_Pipeline_init_col_fu_132_ap_start),
    .ap_done(grp_needwun_Pipeline_init_col_fu_132_ap_done),
    .ap_idle(grp_needwun_Pipeline_init_col_fu_132_ap_idle),
    .ap_ready(grp_needwun_Pipeline_init_col_fu_132_ap_ready),
    .M_address0(grp_needwun_Pipeline_init_col_fu_132_M_address0),
    .M_ce0(grp_needwun_Pipeline_init_col_fu_132_M_ce0),
    .M_we0(grp_needwun_Pipeline_init_col_fu_132_M_we0),
    .M_d0(grp_needwun_Pipeline_init_col_fu_132_M_d0)
);

workload_needwun_Pipeline_trace grp_needwun_Pipeline_trace_fu_138(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_needwun_Pipeline_trace_fu_138_ap_start),
    .ap_done(grp_needwun_Pipeline_trace_fu_138_ap_done),
    .ap_idle(grp_needwun_Pipeline_trace_fu_138_ap_idle),
    .ap_ready(grp_needwun_Pipeline_trace_fu_138_ap_ready),
    .SEQA_2(SEQA_2),
    .SEQA_address0(grp_needwun_Pipeline_trace_fu_138_SEQA_address0),
    .SEQA_ce0(grp_needwun_Pipeline_trace_fu_138_SEQA_ce0),
    .SEQA_q0(SEQA_q0),
    .alignedA_2(alignedA_2),
    .alignedA_address0(grp_needwun_Pipeline_trace_fu_138_alignedA_address0),
    .alignedA_ce0(grp_needwun_Pipeline_trace_fu_138_alignedA_ce0),
    .alignedA_we0(grp_needwun_Pipeline_trace_fu_138_alignedA_we0),
    .alignedA_d0(grp_needwun_Pipeline_trace_fu_138_alignedA_d0),
    .SEQB_address0(grp_needwun_Pipeline_trace_fu_138_SEQB_address0),
    .SEQB_ce0(grp_needwun_Pipeline_trace_fu_138_SEQB_ce0),
    .SEQB_q0(SEQB_q0),
    .alignedB_address0(grp_needwun_Pipeline_trace_fu_138_alignedB_address0),
    .alignedB_ce0(grp_needwun_Pipeline_trace_fu_138_alignedB_ce0),
    .alignedB_we0(grp_needwun_Pipeline_trace_fu_138_alignedB_we0),
    .alignedB_d0(grp_needwun_Pipeline_trace_fu_138_alignedB_d0),
    .ptr_address0(grp_needwun_Pipeline_trace_fu_138_ptr_address0),
    .ptr_ce0(grp_needwun_Pipeline_trace_fu_138_ptr_ce0),
    .ptr_q0(ptr_q0),
    .a_str_idx_out(grp_needwun_Pipeline_trace_fu_138_a_str_idx_out),
    .a_str_idx_out_ap_vld(grp_needwun_Pipeline_trace_fu_138_a_str_idx_out_ap_vld),
    .b_str_idx_out(grp_needwun_Pipeline_trace_fu_138_b_str_idx_out),
    .b_str_idx_out_ap_vld(grp_needwun_Pipeline_trace_fu_138_b_str_idx_out_ap_vld)
);

workload_needwun_Pipeline_fill_in grp_needwun_Pipeline_fill_in_fu_156(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_needwun_Pipeline_fill_in_fu_156_ap_start),
    .ap_done(grp_needwun_Pipeline_fill_in_fu_156_ap_done),
    .ap_idle(grp_needwun_Pipeline_fill_in_fu_156_ap_idle),
    .ap_ready(grp_needwun_Pipeline_fill_in_fu_156_ap_ready),
    .M_load(M_load_reg_408),
    .SEQA_2(SEQA_2),
    .SEQA_address0(grp_needwun_Pipeline_fill_in_fu_156_SEQA_address0),
    .SEQA_ce0(grp_needwun_Pipeline_fill_in_fu_156_SEQA_ce0),
    .SEQA_q0(SEQA_q0),
    .SEQB_load(SEQB_load_reg_403),
    .p_cast3(empty_21_reg_388),
    .M_address0(grp_needwun_Pipeline_fill_in_fu_156_M_address0),
    .M_ce0(grp_needwun_Pipeline_fill_in_fu_156_M_ce0),
    .M_we0(grp_needwun_Pipeline_fill_in_fu_156_M_we0),
    .M_d0(grp_needwun_Pipeline_fill_in_fu_156_M_d0),
    .M_q0(M_q0),
    .zext_ln516(b_idx_reg_369),
    .p_shl2(p_shl2_reg_413),
    .ptr_address0(grp_needwun_Pipeline_fill_in_fu_156_ptr_address0),
    .ptr_ce0(grp_needwun_Pipeline_fill_in_fu_156_ptr_ce0),
    .ptr_we0(grp_needwun_Pipeline_fill_in_fu_156_ptr_we0),
    .ptr_d0(grp_needwun_Pipeline_fill_in_fu_156_ptr_d0)
);

workload_needwun_Pipeline_pad_a grp_needwun_Pipeline_pad_a_fu_172(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_needwun_Pipeline_pad_a_fu_172_ap_start),
    .ap_done(grp_needwun_Pipeline_pad_a_fu_172_ap_done),
    .ap_idle(grp_needwun_Pipeline_pad_a_fu_172_ap_idle),
    .ap_ready(grp_needwun_Pipeline_pad_a_fu_172_ap_ready),
    .sext_ln571(grp_needwun_Pipeline_trace_fu_138_a_str_idx_out),
    .alignedA_2(alignedA_2),
    .alignedA_address0(grp_needwun_Pipeline_pad_a_fu_172_alignedA_address0),
    .alignedA_ce0(grp_needwun_Pipeline_pad_a_fu_172_alignedA_ce0),
    .alignedA_we0(grp_needwun_Pipeline_pad_a_fu_172_alignedA_we0),
    .alignedA_d0(grp_needwun_Pipeline_pad_a_fu_172_alignedA_d0)
);

workload_needwun_Pipeline_pad_b grp_needwun_Pipeline_pad_b_fu_180(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_needwun_Pipeline_pad_b_fu_180_ap_start),
    .ap_done(grp_needwun_Pipeline_pad_b_fu_180_ap_done),
    .ap_idle(grp_needwun_Pipeline_pad_b_fu_180_ap_idle),
    .ap_ready(grp_needwun_Pipeline_pad_b_fu_180_ap_ready),
    .sext_ln574(grp_needwun_Pipeline_trace_fu_138_b_str_idx_out),
    .alignedA_2(alignedA_2),
    .alignedB_address0(grp_needwun_Pipeline_pad_b_fu_180_alignedB_address0),
    .alignedB_ce0(grp_needwun_Pipeline_pad_b_fu_180_alignedB_ce0),
    .alignedB_we0(grp_needwun_Pipeline_pad_b_fu_180_alignedB_we0),
    .alignedB_d0(grp_needwun_Pipeline_pad_b_fu_180_alignedB_d0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_needwun_Pipeline_fill_in_fu_156_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state8)) begin
            grp_needwun_Pipeline_fill_in_fu_156_ap_start_reg <= 1'b1;
        end else if ((grp_needwun_Pipeline_fill_in_fu_156_ap_ready == 1'b1)) begin
            grp_needwun_Pipeline_fill_in_fu_156_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_needwun_Pipeline_init_col_fu_132_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_needwun_Pipeline_init_col_fu_132_ap_start_reg <= 1'b1;
        end else if ((grp_needwun_Pipeline_init_col_fu_132_ap_ready == 1'b1)) begin
            grp_needwun_Pipeline_init_col_fu_132_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_needwun_Pipeline_init_row_fu_126_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_needwun_Pipeline_init_row_fu_126_ap_start_reg <= 1'b1;
        end else if ((grp_needwun_Pipeline_init_row_fu_126_ap_ready == 1'b1)) begin
            grp_needwun_Pipeline_init_row_fu_126_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_needwun_Pipeline_pad_a_fu_172_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state11)) begin
            grp_needwun_Pipeline_pad_a_fu_172_ap_start_reg <= 1'b1;
        end else if ((grp_needwun_Pipeline_pad_a_fu_172_ap_ready == 1'b1)) begin
            grp_needwun_Pipeline_pad_a_fu_172_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_needwun_Pipeline_pad_b_fu_180_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state11)) begin
            grp_needwun_Pipeline_pad_b_fu_180_ap_start_reg <= 1'b1;
        end else if ((grp_needwun_Pipeline_pad_b_fu_180_ap_ready == 1'b1)) begin
            grp_needwun_Pipeline_pad_b_fu_180_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_needwun_Pipeline_trace_fu_138_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln516_fu_204_p2 == 1'd1))) begin
            grp_needwun_Pipeline_trace_fu_138_ap_start_reg <= 1'b1;
        end else if ((grp_needwun_Pipeline_trace_fu_138_ap_ready == 1'b1)) begin
            grp_needwun_Pipeline_trace_fu_138_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        b_idx_1_fu_72 <= 8'd1;
    end else if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln516_fu_204_p2 == 1'd0))) begin
        b_idx_1_fu_72 <= add_ln516_fu_289_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        indvar_fu_76 <= 8'd0;
    end else if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln516_fu_204_p2 == 1'd0))) begin
        indvar_fu_76 <= add_ln516_1_fu_210_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        M_load_reg_408 <= M_q0;
        SEQB_load_reg_403 <= SEQB_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        b_idx_reg_369 <= b_idx_1_fu_72;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln516_fu_204_p2 == 1'd0))) begin
        empty_19_reg_383 <= empty_19_fu_266_p2;
        empty_21_reg_388 <= empty_21_fu_283_p2;
        sum4_reg_378 <= sum4_fu_246_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        p_shl2_reg_413[14 : 7] <= p_shl2_fu_313_p3[14 : 7];
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        M_address0 = sum4_cast_fu_305_p1;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        M_address0 = grp_needwun_Pipeline_fill_in_fu_156_M_address0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        M_address0 = grp_needwun_Pipeline_init_col_fu_132_M_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        M_address0 = grp_needwun_Pipeline_init_row_fu_126_M_address0;
    end else begin
        M_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        M_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        M_ce0 = grp_needwun_Pipeline_fill_in_fu_156_M_ce0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        M_ce0 = grp_needwun_Pipeline_init_col_fu_132_M_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        M_ce0 = grp_needwun_Pipeline_init_row_fu_126_M_ce0;
    end else begin
        M_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        M_d0 = grp_needwun_Pipeline_fill_in_fu_156_M_d0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        M_d0 = grp_needwun_Pipeline_init_col_fu_132_M_d0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        M_d0 = grp_needwun_Pipeline_init_row_fu_126_M_d0;
    end else begin
        M_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        M_we0 = grp_needwun_Pipeline_fill_in_fu_156_M_we0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        M_we0 = grp_needwun_Pipeline_init_col_fu_132_M_we0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        M_we0 = grp_needwun_Pipeline_init_row_fu_126_M_we0;
    end else begin
        M_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        SEQA_address0 = grp_needwun_Pipeline_fill_in_fu_156_SEQA_address0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        SEQA_address0 = grp_needwun_Pipeline_trace_fu_138_SEQA_address0;
    end else begin
        SEQA_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        SEQA_ce0 = grp_needwun_Pipeline_fill_in_fu_156_SEQA_ce0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        SEQA_ce0 = grp_needwun_Pipeline_trace_fu_138_SEQA_ce0;
    end else begin
        SEQA_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        SEQB_address0 = p_cast10_fu_309_p1;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        SEQB_address0 = grp_needwun_Pipeline_trace_fu_138_SEQB_address0;
    end else begin
        SEQB_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        SEQB_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        SEQB_ce0 = grp_needwun_Pipeline_trace_fu_138_SEQB_ce0;
    end else begin
        SEQB_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        alignedA_address0 = grp_needwun_Pipeline_pad_a_fu_172_alignedA_address0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        alignedA_address0 = grp_needwun_Pipeline_trace_fu_138_alignedA_address0;
    end else begin
        alignedA_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        alignedA_ce0 = grp_needwun_Pipeline_pad_a_fu_172_alignedA_ce0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        alignedA_ce0 = grp_needwun_Pipeline_trace_fu_138_alignedA_ce0;
    end else begin
        alignedA_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        alignedA_d0 = grp_needwun_Pipeline_pad_a_fu_172_alignedA_d0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        alignedA_d0 = grp_needwun_Pipeline_trace_fu_138_alignedA_d0;
    end else begin
        alignedA_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        alignedA_we0 = grp_needwun_Pipeline_pad_a_fu_172_alignedA_we0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        alignedA_we0 = grp_needwun_Pipeline_trace_fu_138_alignedA_we0;
    end else begin
        alignedA_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        alignedB_address0 = grp_needwun_Pipeline_pad_b_fu_180_alignedB_address0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        alignedB_address0 = grp_needwun_Pipeline_trace_fu_138_alignedB_address0;
    end else begin
        alignedB_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        alignedB_ce0 = grp_needwun_Pipeline_pad_b_fu_180_alignedB_ce0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        alignedB_ce0 = grp_needwun_Pipeline_trace_fu_138_alignedB_ce0;
    end else begin
        alignedB_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        alignedB_d0 = grp_needwun_Pipeline_pad_b_fu_180_alignedB_d0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        alignedB_d0 = grp_needwun_Pipeline_trace_fu_138_alignedB_d0;
    end else begin
        alignedB_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        alignedB_we0 = grp_needwun_Pipeline_pad_b_fu_180_alignedB_we0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        alignedB_we0 = grp_needwun_Pipeline_trace_fu_138_alignedB_we0;
    end else begin
        alignedB_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_needwun_Pipeline_trace_fu_138_ap_done == 1'b0)) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

assign ap_ST_fsm_state11_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state12_on_subcall_done)) begin
        ap_ST_fsm_state12_blk = 1'b1;
    end else begin
        ap_ST_fsm_state12_blk = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_needwun_Pipeline_init_row_fu_126_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_needwun_Pipeline_init_col_fu_132_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

always @ (*) begin
    if ((grp_needwun_Pipeline_fill_in_fu_156_ap_done == 1'b0)) begin
        ap_ST_fsm_state9_blk = 1'b1;
    end else begin
        ap_ST_fsm_state9_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_state12_on_subcall_done) & (1'b1 == ap_CS_fsm_state12)) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state12_on_subcall_done) & (1'b1 == ap_CS_fsm_state12))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        ptr_address0 = grp_needwun_Pipeline_fill_in_fu_156_ptr_address0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        ptr_address0 = grp_needwun_Pipeline_trace_fu_138_ptr_address0;
    end else begin
        ptr_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        ptr_ce0 = grp_needwun_Pipeline_fill_in_fu_156_ptr_ce0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        ptr_ce0 = grp_needwun_Pipeline_trace_fu_138_ptr_ce0;
    end else begin
        ptr_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        ptr_we0 = grp_needwun_Pipeline_fill_in_fu_156_ptr_we0;
    end else begin
        ptr_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (grp_needwun_Pipeline_init_row_fu_126_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (grp_needwun_Pipeline_init_col_fu_132_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln516_fu_204_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            if (((1'b1 == ap_CS_fsm_state9) & (grp_needwun_Pipeline_fill_in_fu_156_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state10 : begin
            if (((1'b1 == ap_CS_fsm_state10) & (grp_needwun_Pipeline_trace_fu_138_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            if (((1'b0 == ap_block_state12_on_subcall_done) & (1'b1 == ap_CS_fsm_state12))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln516_1_fu_210_p2 = (indvar_fu_76 + 8'd1);

assign add_ln516_fu_289_p2 = (b_idx_1_fu_72 + 8'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state12_on_subcall_done = ((grp_needwun_Pipeline_pad_b_fu_180_ap_done == 1'b0) | (grp_needwun_Pipeline_pad_a_fu_172_ap_done == 1'b0));
end

assign empty_17_fu_220_p1 = indvar_fu_76[6:0];

assign empty_18_fu_252_p2 = ($signed(b_idx_1_fu_72) + $signed(8'd255));

assign empty_19_fu_266_p2 = (p_cast_fu_262_p1 + SEQA_2);

assign empty_20_fu_271_p1 = empty_18_fu_252_p2[6:0];

assign empty_21_fu_283_p2 = (p_shl1_fu_275_p3 + p_cast2_fu_258_p1);

assign grp_needwun_Pipeline_fill_in_fu_156_ap_start = grp_needwun_Pipeline_fill_in_fu_156_ap_start_reg;

assign grp_needwun_Pipeline_init_col_fu_132_ap_start = grp_needwun_Pipeline_init_col_fu_132_ap_start_reg;

assign grp_needwun_Pipeline_init_row_fu_126_ap_start = grp_needwun_Pipeline_init_row_fu_126_ap_start_reg;

assign grp_needwun_Pipeline_pad_a_fu_172_ap_start = grp_needwun_Pipeline_pad_a_fu_172_ap_start_reg;

assign grp_needwun_Pipeline_pad_b_fu_180_ap_start = grp_needwun_Pipeline_pad_b_fu_180_ap_start_reg;

assign grp_needwun_Pipeline_trace_fu_138_ap_start = grp_needwun_Pipeline_trace_fu_138_ap_start_reg;

assign icmp_ln516_fu_204_p2 = ((b_idx_1_fu_72 == 8'd129) ? 1'b1 : 1'b0);

assign p_cast10_fu_309_p1 = empty_19_reg_383;

assign p_cast2_fu_258_p1 = empty_18_fu_252_p2;

assign p_cast_fu_262_p1 = empty_18_fu_252_p2;

assign p_shl19_cast_fu_232_p1 = p_shl_fu_224_p3;

assign p_shl1_fu_275_p3 = {{empty_20_fu_271_p1}, {7'd0}};

assign p_shl2_fu_313_p3 = {{b_idx_reg_369}, {7'd0}};

assign p_shl_fu_224_p3 = {{empty_17_fu_220_p1}, {7'd0}};

assign ptr_d0 = grp_needwun_Pipeline_fill_in_fu_156_ptr_d0;

assign sum4_cast_fu_305_p1 = sum4_reg_378;

assign sum4_fu_246_p2 = (tmp_cast_fu_242_p1 + p_shl19_cast_fu_232_p1);

assign tmp_cast_fu_242_p1 = tmp_fu_236_p2;

assign tmp_fu_236_p2 = (zext_ln516_fu_216_p1 + 9'd129);

assign zext_ln516_fu_216_p1 = indvar_fu_76;

always @ (posedge ap_clk) begin
    p_shl2_reg_413[6:0] <= 7'b0000000;
end

endmodule //workload_needwun
