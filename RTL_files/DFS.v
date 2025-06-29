`include"parameters.vh"

module DFS(out, in, clk, rst);
  output reg [`WPTR_WIDTH-1:0]out;
  input wire [`WPTR_WIDTH-1:0]in;
  input clk, rst;
  
  wire t[`WPTR_WIDTH-1:0];
  
  genvar i;
  generate 
    for (i=0; i<`WPTR_WIDTH; i=i+1) begin:DFS_gen1
      DFF D1(.q(t[i]), .d(in[i]), .clk(clk), .clr(rst));
    end
  endgenerate

  genvar j;
  generate 
    for (j=0; j<`WPTR_WIDTH; j=j+1) begin:DFS_gen2
        DFF D2(.q(out[j]), .d(t[j]), .clk(clk), .clr(rst));
    end
  endgenerate    
endmodule


module DFF(q,d,clk,clr);  
  output reg q;
  input d,clk,clr;
  always@(posedge clk)
    begin
      if (clr==0)
        q<=0;
      else
        q<=d;
    end 
endmodule