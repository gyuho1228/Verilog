module sub32(/*AUTOARG*/
   // Outputs
   diff,
   // Inputs
   i0, i1
   );
   input [31:0] i0, i1;
   output [31:0] diff;

   /*AUTOWIRE*/
   /*AUTOREG*/

   assign diff = i0 - i1;

endmodule
