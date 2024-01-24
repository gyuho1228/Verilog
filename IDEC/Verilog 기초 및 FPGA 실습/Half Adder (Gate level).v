//Design
module Half_Adder (
  output wire SUM, CARRY,
  input wire X, Y
);
  xor(SUM, X, Y);
  and(CARRY, X, Y);
endmodule

//Test bench
`timescale 10ns/1ps
module tb_half_adder;
// Input에 연결되는 변수
  reg X, Y;
// Output에 연결되는 변수
  wire SUM, CARRY;
// DUT instantiation
  Half_Adder u_Half_Adder(
    .SUM	(SUM),
    .CARRY	(CARRY),
    .X	(X),
    .Y	(Y)
  );
// Simulations
  initial
    begin
      X = 0; Y = 0;
      #5;
      X = 0; Y = 1;
      #5;
      X = 1; Y = 0;
      #5;
      X = 1; Y = 1;
      #5;
      $finish;
    end
endmodule
