module G2B_8bit(bin, gray);
  output [7:0]bin;
  input [7:0]gray;

  assign bin[7] = gray[7];
  assign bin[6]= bin[7]^gray[6];
  assign bin[5]= bin[6]^gray[5];
  assign bin[4]= bin[5]^gray[4];
  assign bin[3]= bin[4]^gray[3];
  assign bin[2]= bin[3]^gray[2];
  assign bin[1]= bin[2]^gray[1];
  assign bin[0]= bin[1]^gray[0];
endmodule

