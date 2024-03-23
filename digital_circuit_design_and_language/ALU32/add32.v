module add32(/*AUTOARG*/
   // Outputs
   sum,
   // Inputs
   i0, i1
   );
   input [31:0] i0, i1;
   output [31:0] sum;

   /*AUTOWIRE*/
   /*AUTOREG*/

   assign sum = i0 + i1;

endmodule
