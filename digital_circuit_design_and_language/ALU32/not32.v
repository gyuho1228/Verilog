module not32(/*AUTOARG*/
   // Outputs
   o,
   // Inputs
   i0
   );
   input [31:0] i0;
   output [31:0] o;

   /*AUTOWIRE*/
   /*AUTOREG*/

   assign o = ~i0;

endmodule
