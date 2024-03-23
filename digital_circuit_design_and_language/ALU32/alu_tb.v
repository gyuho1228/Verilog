`timescale 1ns/1ns
`include "mux32two.v"
`include "mux32three.v"
`include "add32_gen.v"
`include "sub32_gen.v"
`include "mul16.v"
`include "alu.v"

module alu_tb;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [31:0]		r;			// From i0 of alu.v
   // End of automatics
   /*AUTOREG*/
   reg [31:0]		a, b;
   reg [2:0]		f;
   alu i0 (/*AUTOINST*/
	   // Outputs
	   .r				(r[31:0]),
	   // Inputs
	   .a				(a[31:0]),
	   .b				(b[31:0]),
	   .f				(f[2:0]));

   initial 
     begin
	$dumpfile("alu_tb.vcd");
	$dumpvars(0, alu_tb);

	a = 2; b = 3; f = 0;

	#10 f = 1;
	#10 f = 2;
	#10 f = 3;
	#10 f = 4;
	#10 f = 5;
	#10 f = 6;
	#10 f = 0;
	#10 $finish;
	
     end // initial begin
   
   

endmodule
