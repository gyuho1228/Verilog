module xor32(/*AUTOARG*/
   // Outputs
   o,
   // Inputs
   i0, i1
   );
   input [31:0] i0, i1;
   output [31:0] o;

   /*AUTOWIRE*/
   /*AUTOREG*/

   assign o = i0 ^ i1;

endmodule
