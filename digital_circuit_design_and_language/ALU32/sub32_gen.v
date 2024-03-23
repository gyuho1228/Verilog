module sub32_gen(/*AUTOARG*/
		 // Outputs
		 diff,
		 // Inputs
		 i0, i1
		 );
   parameter N = 32;
   input [N-1:0] i0, i1;
   output [N-1:0] diff;
   

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   
   wire [N-1:0]	  ii1;
   
   wire [N:0]	  c;			// From add of fulladder.v
   wire [N-1:0]	  r;			// From add of fulladder.v
   // End of automatics
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   // End of automatics

   assign ii1 = i1^{N{1'b1}};

   genvar	  i;
   generate
      for(i = 0; i < N; i  = i + 1) 
	begin : adder
	   fulladder add(/*AUTOINST*/
			 // Outputs
			 .r			(diff[i]),
			 .co			(c[i+1]),
			 // Inputs
			 .a			(i0[i]),
			 .b			(ii1[i]),
			 .ci			(c[i]));
	end
   endgenerate

   assign c[0] = 1;
endmodule // add32_gen

