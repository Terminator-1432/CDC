module FIFO_MEM(rdata, wdata, wclken, waddr, raddr, clk, rst);
  
  output reg [3:0]rdata;
  //input wdata, wclken, waddr, raddr, clk, rst;
  input wire wclken, clk, rst;  
  input wire [3:0]wdata;
  input wire [6:0]waddr, raddr;
  
  reg [3:0] fifomem [0:127];
  
  assign rdata=fifomem[raddr];
  
  always@(posedge clk)
    begin
      if (wclken==1)	  
        //$display("rdata=%b", rdata );
        fifomem[waddr]<=wdata; 
      
    end
endmodule  
