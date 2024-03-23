`timescale 1ns/1ns
`include "mux32two.v"
`include "mux32eight.v"
`include "add32_gen.v"
`include "sub32_gen.v"
`include "mul16.v"
`include "and32.v"
`include "or32.v"
`include "not32.v"
`include "xor32.v"
`include "shift32.v"
`include "alu_new.v"

module alu_new_tb;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [31:0]		r;			// From i0 of alu_new.v
   // End of automatics
   /*AUTOREG*/
   reg [31:0]		a, b;
   reg [3:0]		f;
   alu_new i0 (/*AUTOINST*/
	       // Outputs
	       .r			(r[31:0]),
	       // Inputs
	       .a			(a[31:0]),
	       .b			(b[31:0]),
	       .f			(f[3:0]));

   initial 
     begin
	$dumpfile("alu_new_tb.vcd");
	$dumpvars(0, alu_new_tb);

	a = 7; b = 4; f = 0;

	#10 f = 1;
	#10 f = 2;
	#10 f = 3;
	#10 f = 4;
	#10 f = 5;
	#10 f = 6;
	#10 f = 7;
	#10 f = 8;
	#10 f = 10;
	#10 f = 12;
	#10 f = 14;
	#10 f = 0;
	#10 $finish;
	
     end // initial begin
   
   

endmodule
