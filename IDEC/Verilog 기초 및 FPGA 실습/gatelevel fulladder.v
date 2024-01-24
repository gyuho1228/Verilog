//Design
module Full_Adder (
  // Input, output port 선언
  output wire SUM, CARRY_OUT,
  input wire X, Y, CARRY_IN
);
  // 내부 wire 선언
  wire sum1;
  wire carry1, carry2;
  // 하위 module instantiation
  Half_Adder ha0 ( 
    .SUM	(sum1),
    .CARRY	(carry1),
    .X	(X),
    .Y	(Y)
  );
  Half_Adder ha1 (
    .SUM	(SUM),
    .CARRY	(carry2),
    .X	(CARRY_IN),
    .Y	(sum1)
  );
  // Gates instantiations
  or(CARRY_OUT, carry1, carry2);
endmodule


module Half_Adder (
  output wire SUM, CARRY,
  input wire X, Y
);
  xor(SUM, X, Y);
  and(CARRY, X, Y);
endmodule

//test bench
`timescale 10ns/1ps
module tb_full_adder;
  // Input에 연결되는 변수
  reg X, Y, CARRY_IN;
  // Output에 연결되는 변수
  wire SUM, CARRY_OUT;
  // DUT instantiation
  Full_Adder u_Full_Adder(
    .SUM	(SUM),
    .CARRY_OUT	(CARRY_OUT),
    .X	(X),
    .Y	(Y),
    .CARRY_IN	(CARRY_IN)
  );
  
  // Simulations
  initial
    begin
      CARRY_IN = 0; X = 0; Y = 0;
      #5;
      CARRY_IN = 0; X = 0; Y = 1;
      #5;
      CARRY_IN = 0; X = 1; Y = 0;
      #5;
      CARRY_IN = 0; X = 1; Y = 1;
      #5;
      CARRY_IN = 1; X = 0; Y = 0;
      #5;
      CARRY_IN = 1; X = 0; Y = 1;
      #5;
      CARRY_IN = 1; X = 1; Y = 0;
      #5;
      CARRY_IN = 1; X = 1; Y = 1;
      #5;
      $finish;
      
      //가능한 모든 X와 Y, CARR_IN 값 확인
    end
  initial begin
    $dumpfile("aa.vcd");
    $dumpvars(0, tb_full_adder);
  end
endmodule
