module mux32three(/*AUTOARG*/
   // Outputs
   out,
   // Inputs
   i0, i1, i2, sel
   );
   input [31:0] i0, i1, i2;
   input [1:0]	sel;
   output reg [31:0]	 out;

   /*AUTOWIRE*/
   /*AUTOREG*/

   always @ (i0 or i1 or i2 or sel)
     begin
	case(sel)
	  0: out = i0;
	  1: out = i1;
	  2: out = i2;
	  default: out = 32'bx;
	endcase // case (sel)
     end
   
   
endmodule
