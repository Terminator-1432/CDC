module FIFO_read(rptr, r_raddr, rempty, rinc, clk, rst, r_wptr);
  output reg [7:0]rptr;
  output wire [6:0]r_raddr;
  output wire rempty;
  
  //input rinc, clk, rst, r_wptr;
  input wire rinc, clk, rst;
  input wire[7:0]r_wptr;
  
  assign r_raddr=rptr[6:0];
  assign rempty = (r_wptr == rptr)? 1 : 0;
  
  always@(posedge clk)
    begin
      if (rst == 0)
        begin
          //rempty=1'b0;
          rptr=8'b00000000;
//          $display("rst=", rst);
        end      
      else if ((rempty==0)&&(rinc==1))
        begin
          rptr<=rptr+8'b00000001;
          //rempty <= (r_wptr == rptr)? 1 : 0;
          //$display("r_wptr=%d, rptr=%d", r_wptr, rptr);
        end
    end	
endmodule




