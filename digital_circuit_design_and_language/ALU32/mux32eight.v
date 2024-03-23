module mux32eight(/*AUTOARG*/
   // Outputs
   out,
   // Inputs
   i0, i1, i2, i3, i4, i5, i6, i7, sel
   );
   input [31:0] i0, i1, i2, i3, i4, i5, i6, i7;
   input [2:0]	sel;
   output reg [31:0]	 out;

   /*AUTOWIRE*/
   /*AUTOREG*/

   always @ (i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7 or sel)
     begin
	case(sel)
	  0: out = i0;
	  1: out = i1;
	  2: out = i2;
	  3: out = i3;
	  4: out = i4;
	  5: out = i5;
	  6: out = i6;
	  7: out = i7;
	  default: out = 32'bz;
	endcase // case (sel)
     end
   
   
endmodule
