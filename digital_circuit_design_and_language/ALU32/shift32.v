module shift32(/*AUTOARG*/
   // Outputs
   shift,
   // Inputs
   i0, i1
   );
   input [31:0] i0, i1;
   output [31:0] shift;

   /*AUTOWIRE*/
   /*AUTOREG*/

   assign shift = i0 << i1;

endmodule
