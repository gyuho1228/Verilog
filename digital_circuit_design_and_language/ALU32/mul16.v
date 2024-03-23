module mul16(/*AUTOARG*/
   // Outputs
   prod,
   // Inputs
   i0, i1
   );
   input [15:0] i0, i1;
   output [31:0] prod;

   /*AUTOWIRE*/
   /*AUTOREG*/

   assign prod = i0 * i1;

endmodule
