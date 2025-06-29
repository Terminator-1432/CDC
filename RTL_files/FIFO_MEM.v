`include"parameters.vh"

module FIFO_MEM #(parameter DATA_WIDTH = 4, parameter FIFO_LENGTH = 128) (rdata, wdata, wclken, waddr, raddr, clk, rst);
  
  output reg [DATA_WIDTH-1:0]rdata;
  input wire wclken, clk, rst;  
  input wire [DATA_WIDTH-1:0]wdata;
  input wire [`WPTR_WIDTH-2:0]waddr, raddr;
  
  reg [DATA_WIDTH-1:0] fifomem [0:FIFO_LENGTH-1];
  
  assign rdata=fifomem[raddr];
  
  always@(posedge clk)
    begin
      if (wclken==1)	  
        fifomem[waddr]<=wdata;       
    end
endmodule  
