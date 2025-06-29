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
//   assign bin[7] = gray[7];
//   assign bin[6]= bin[7]^gray[6];
//   assign bin[5]= bin[6]^gray[5];
//   assign bin[4]= bin[5]^gray[4];
//   assign bin[3]= bin[4]^gray[3];
//   assign bin[2]= bin[3]^gray[2];
//   assign bin[1]= bin[2]^gray[1];
//   assign bin[0]= bin[1]^gray[0];


endmodule

