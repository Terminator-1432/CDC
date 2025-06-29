`include "parameters.vh"

module FIFO_wrt (wptr, w_waddr, wfull, wclken, winc, clk, rst, w_rptr);
  output reg [`WPTR_WIDTH-1:0]wptr;
  output wire [`WPTR_WIDTH-2:0]w_waddr;
  output wire wclken;
  output wire wfull;
 
  input wire winc, clk, rst;
  input wire [`RPTR_WIDTH-1:0]w_rptr;
 
  assign wfull = ({~wptr[`WPTR_WIDTH-1],wptr[`WPTR_WIDTH-2:0] + 3'b100} == w_rptr)? 1 : 0;
  
  assign w_waddr= wptr[`WPTR_WIDTH-2:0];
  assign wclken = ~wfull&winc;
  
  always@(posedge clk)
    begin
      if (rst == 0)
        begin
          wptr<={`WPTR_WIDTH{1'b0}};        
        end
      
      else if ((wfull==0) && (winc))
        begin
          wptr<=wptr + `WPTR_WIDTH'd1;          
        end
    end  
endmodule
