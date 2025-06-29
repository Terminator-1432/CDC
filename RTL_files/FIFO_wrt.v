module FIFO_wrt(wptr, w_waddr, wfull, wclken, winc, clk, rst, w_rptr);
  output reg [7:0]wptr;
  output wire [6:0]w_waddr;
  output wire wclken;
  output wire wfull;
 
  //input winc, clk, rst, w_rptr;
  input wire winc, clk, rst;
  input wire [7:0]w_rptr;
 
  assign wfull = ({~wptr[7],wptr[6:0]+7'b0000100} == w_rptr)? 1 : 0;
  
  assign w_waddr= wptr[6:0];
  assign wclken = ~wfull&winc;
  
  always@(posedge clk)
    begin
      //$display("wffull22=", wfull);

      if (rst == 0)
        begin
          wptr<=8'b00000000;
          //$display("wptr1=", wptr);
          //wfull<=1'b0;
          //$display("wffull=", wfull);
          
        end
      else if ((wfull==0) && (winc))
        begin
          wptr<=wptr+8'b00000001;
          //$display("elsewptr=", w_rptr);
          //$display("w_rptr=%d, wptr=%d", w_rptr, wptr);
          //wfull <= ({~wptr[7],wptr[6:0]+7'b0000100} == w_rptr)? 1 : 0;
          
        end
    end  
endmodule
