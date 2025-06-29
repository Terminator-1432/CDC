module B2G_8bit(gray, bin);
  output [7:0]gray;
  input [7:0]bin;

  assign gray = {  bin[7],         // MSB of Gray is same as MSB of Binary
                     bin[7] ^ bin[6],
                     bin[6] ^ bin[5],
                     bin[5] ^ bin[4],
                     bin[4] ^ bin[3],
                     bin[3] ^ bin[2],
                     bin[2] ^ bin[1],
                     bin[1] ^ bin[0]  }; // LSB of Gray
  
  initial
    begin
      $display("bin=%b, out=%b", bin, gray);
      $monitor("bin=%b, out=%b", bin, gray);
    end
endmodule
