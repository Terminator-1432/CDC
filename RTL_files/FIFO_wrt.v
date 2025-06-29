`include "parameters.vh"

module FIFO_wrt (wptr, w_waddr, wfull, wclken, winc, clk, rst, w_rptr);
  output reg [`WPTR_WIDTH-1:0]wptr;
  output wire [`WPTR_WIDTH-2:0]w_waddr;
  output wire wclken;
  output wire wfull;
 
  //input winc, clk, rst, w_rptr;
  input wire winc, clk, rst;
  input wire [`RPTR_WIDTH-1:0]w_rptr;
 
  assign wfull = ({~wptr[`WPTR_WIDTH-1],wptr[`WPTR_WIDTH-2:0] + 3'b100} == w_rptr)? 1 : 0;
  
  assign w_waddr= wptr[`WPTR_WIDTH-2:0];
  assign wclken = ~wfull&winc;
  
  always@(posedge clk)
    begin
      //$display("wffull22=", wfull);

      if (rst == 0)
        begin
          wptr<={`WPTR_WIDTH{1'b0}};
          //$display("wptr1=", wptr);
          //wfull<=1'b0;
          //$display("wffull=", wfull);
          
        end
      else if ((wfull==0) && (winc))
        begin
          wptr<=wptr + `WPTR_WIDTH'd1;
          //wptr<=wptr + { (`WPTR_WIDTH-1) {1'b0}, 1'b1};
          //$display("elsewptr=", w_rptr);
          //$display("w_rptr=%d, wptr=%d", w_rptr, wptr);
          //wfull <= ({~wptr[7],wptr[6:0]+7'b0000100} == w_rptr)? 1 : 0;
          
        end
    end  
endmodule
