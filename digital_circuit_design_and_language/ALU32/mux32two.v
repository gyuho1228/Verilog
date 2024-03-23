module mux32two(/*AUTOARG*/
   // Outputs
   out,
   // Inputs
   i0, i1, sel
   );
   input [31:0] i0, i1;
   input	sel;
   output [31:0] out;

   assign out = sel ? i1 : i0;
   
endmodule
