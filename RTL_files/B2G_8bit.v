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
//   assign gray = {  bin[7],         // MSB of Gray is same as MSB of Binary
//                      bin[7] ^ bin[6],
//                      bin[6] ^ bin[5],
//                      bin[5] ^ bin[4],
//                      bin[4] ^ bin[3],
//                      bin[3] ^ bin[2],
//                      bin[2] ^ bin[1],
//                      bin[1] ^ bin[0]  }; // LSB of Gray
  
  initial
    begin
      $display("bin=%b, out=%b", bin, gray);
      $monitor("bin=%b, out=%b", bin, gray);
    end
endmodule
