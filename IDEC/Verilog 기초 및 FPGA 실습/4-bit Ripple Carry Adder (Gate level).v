//Design
module fulladder4b (
  // Input, output port 선언
  output wire [3:0] SUM,
  output wire CARRY_OUT,
  input wire [3:0] X,
  input wire [3:0] Y,
  input wire CARRY_IN
  );
  // 내부 wire 선언
  wire c1, c2, c3;
  // 하위 module instantiation
  Full_Adder fu0(
    .SUM		(SUM[0]),
    .CARRY_OUT	(c1),
    .X			(X[0]),
    .Y			(Y[0]),
    .CARRY_IN	(CARRY_IN)
  );
  Full_Adder fu1(
    .SUM		(SUM[1]),
    .CARRY_OUT	(c2),
    .X			(X[1]),
    .Y			(Y[1]),
    .CARRY_IN	(c1)
  );
  Full_Adder fu2(
    .SUM		(SUM[2]),
    .CARRY_OUT	(c3),
    .X			(X[2]),
    .Y			(Y[2]),
    .CARRY_IN	(c2)
  );
  Full_Adder fu3(
    .SUM		(SUM[03]),
    .CARRY_OUT	(CARRY_OUT),
    .X			(X[3]),
    .Y			(Y[3]),
    .CARRY_IN	(c3)
  );
  
endmodule

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

//testbench
`timescale 10ns/1ps
module tb_ripple_carry_adder;
  // Input에 연결되는 변수
  reg [3:0] X;
  reg [3:0] Y;
  reg CARRY_IN;
  // Output에 연결되는 변수
  wire [3:0] SUM;
  wire CARRY_OUT;
  // DUT instantiation
  fulladder4b u_fulladder4b(
    .SUM			(SUM),
    .CARRY_OUT		(CARRY_OUT),
    .X				(X),
    .Y				(Y),
    .CARRY_IN		(CARRY_IN)
  );
    
  // Simulations
  initial
    begin
      /* Fill this part – 4+8, 3+7, 12+5 검증 */
      X = 4; Y = 8; CARRY_IN =0;
      #5;
      X = 3; Y = 7; CARRY_IN =0;
      #5;
      X = 12; Y = 5; CARRY_IN =0;
      #5;
   end
  initial begin
    $dumpfile("a.vcd");
    $dumpvars(0, tb_ripple_carry_adder);
  end
endmodule
