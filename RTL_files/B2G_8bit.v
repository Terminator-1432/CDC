`include "parameters.vh"
  
module B2G_8bit(gray, bin);
  output [`WPTR_WIDTH-1:0]gray;
  input [`WPTR_WIDTH-1:0]bin;
  
  genvar i;
  generate
    for (i=0;i<`WPTR_WIDTH; i=i+1) begin:B2G_gen
      wire tmp = bin[i+1]^bin[i];
      assign gray[i] = (i==`WPTR_WIDTH-1)?bin[i]:tmp;
    end
  endgenerate
  
endmodule
