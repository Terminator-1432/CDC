module DFS(out, in, clk, rst);
  output reg [7:0]out;
  input wire [7:0]in;
  input clk, rst;
  
  wire t[7:0];
  
  initial
    $display("din=%b, dout=%b", in, out);
  
  DFF D0(.q(t[0]), .d(in[0]), .clk(clk), .clr(rst));
  DFF D1(.q(t[1]), .d(in[1]), .clk(clk), .clr(rst));
  DFF D2(.q(t[2]), .d(in[2]), .clk(clk), .clr(rst));
  DFF D3(.q(t[3]), .d(in[3]), .clk(clk), .clr(rst));
  DFF D4(.q(t[4]), .d(in[4]), .clk(clk), .clr(rst));
  DFF D5(.q(t[5]), .d(in[5]), .clk(clk), .clr(rst));
  DFF D6(.q(t[6]), .d(in[6]), .clk(clk), .clr(rst));
  DFF D7(.q(t[7]), .d(in[7]), .clk(clk), .clr(rst));
  

  DFF D8(.q(out[0]), .d(t[0]), .clk(clk), .clr(rst));
  DFF D9(.q(out[1]), .d(t[1]), .clk(clk), .clr(rst));
  DFF DA(.q(out[2]), .d(t[2]), .clk(clk), .clr(rst));
  DFF DB(.q(out[3]), .d(t[3]), .clk(clk), .clr(rst));
  DFF DC(.q(out[4]), .d(t[4]), .clk(clk), .clr(rst));
  DFF DD(.q(out[5]), .d(t[5]), .clk(clk), .clr(rst));
  DFF DE(.q(out[6]), .d(t[6]), .clk(clk), .clr(rst));
  DFF DF(.q(out[7]), .d(t[7]), .clk(clk), .clr(rst));
    
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