//design
module MUX4_to_1(
  output wire	OUT,
  input  wire	I0, I1, I2, I3,
  input  wire	S1, S0
);
  wire s1n, s0n;	
  wire 	y0, y1, y2, y3;

  not(s1n, S1);
  not(s0n, S0);
  and(y0, I0, s1n, s0n);
  and(y1, I1, s1n, S0);
  and(y2, I2, S1, s0n);
  and(y3, I3, S1, S0);
  or(OUT, y0, y1, y2, y3);
endmodule

//test bench
module MUX4_to_1(
  output wire	OUT,
  input  wire	I0, I1, I2, I3,
  input  wire	S1, S0
);
  wire s1n, s0n;	
  wire 	y0, y1, y2, y3;

  not(s1n, S1);
  not(s0n, S0);
  and(y0, I0, s1n, s0n);
  and(y1, I1, s1n, S0);
  and(y2, I2, S1, s0n);
  and(y3, I3, S1, S0);
  or(OUT, y0, y1, y2, y3);
endmodule
