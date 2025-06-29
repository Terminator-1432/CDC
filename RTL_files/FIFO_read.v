`include "parameters.vh"

module FIFO_read(rptr, r_raddr, rempty, rinc, clk, rst, r_wptr);
  output reg [`RPTR_WIDTH-1:0]rptr;
  output wire [`RPTR_WIDTH-2:0]r_raddr;
  output wire rempty;
  
  //input rinc, clk, rst, r_wptr;
  input wire rinc, clk, rst;
  input wire[`WPTR_WIDTH-1:0]r_wptr;
  
  assign r_raddr=rptr[`RPTR_WIDTH-2:0];
  assign rempty = (r_wptr == rptr)? 1 : 0;
  
  always@(posedge clk)
    begin
      if (rst == 0)
        begin
          //rempty=1'b0;
          rptr=`RPTR_WIDTH'd0;
//          $display("rst=", rst);
        end      
      else if ((rempty==0)&&(rinc==1))
        begin
          rptr<=rptr+`RPTR_WIDTH'd1;
          //rempty <= (r_wptr == rptr)? 1 : 0;
          //$display("r_wptr=%d, rptr=%d", r_wptr, rptr);
        end
    end	
endmodule




