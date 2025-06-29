`include"parameters.vh"

module G2B_8bit(bin, gray);
  output [`WPTR_WIDTH-1:0]bin;
  input [`WPTR_WIDTH-1:0]gray;
   
  genvar i;
  generate 
    for (i=0; i<`WPTR_WIDTH; i=i+1) begin:G2B_gen
      wire tmp = bin[i+1]^gray[i];
      assign bin[i] = (i==`WPTR_WIDTH-1)?gray[i]:tmp;
    end
  endgenerate
  
endmodule

