// Code your design here
`include "parameters.vh"
`include "B2G_8bit.v"
`include "G2B_8bit.v"
`include "DFS.v"
`include "FIFO_MEM.v"
`include "FIFO_wrt.v"
`include "FIFO_read.v"

module CDC(wfull, rempty, rdata, winc, rinc, rst, rclk, wclk, wdata);
  
  output wire wfull, rempty;
  output wire [3:0]rdata;
  
  input wire winc, rinc, rst, rclk, wclk;
  input wire [3:0]wdata;
  
  wire [7:0]i_wptr, i_w_rptr;
  wire [6:0]i_waddr;
  wire i_wclken,ptr;
    
  wire [7:0]i_rptr, i_r_wptr;
  wire i_rinc; 
  wire [6:0]i_raddr;
  
  wire [7:0] g1,g2,g3,g4;
  
  FIFO_wrt M1(.wptr(i_wptr), .w_waddr(i_waddr), .wfull(wfull), .wclken(i_wclken), .winc(winc), .clk(wclk), .rst(rst), .w_rptr(i_w_rptr));

  FIFO_MEM M2(.rdata(rdata), .wdata(wdata), .wclken(i_wclken), .waddr(i_waddr), .raddr(i_raddr), .clk(wclk), .rst(rst));

  FIFO_read M3(.rptr(i_rptr), .r_raddr(i_raddr), .rempty(rempty), .rinc(rinc), .clk(rclk), .rst(rst), .r_wptr(i_r_wptr));
  
  B2G_8bit B1(.gray(g1), .bin(i_wptr));
  B2G_8bit B2(.gray(g2), .bin(i_rptr));
  
  DFS D1(.out(g3), .in(g2), .clk(wclk), .rst(rst));
  DFS D2(.out(g4), .in(g1), .clk(rclk), .rst(rst));
  
  G2B_8bit G1(.bin(i_w_rptr), .gray(g3));
  G2B_8bit G2(.bin(i_r_wptr), .gray(g4));
  
  
endmodule