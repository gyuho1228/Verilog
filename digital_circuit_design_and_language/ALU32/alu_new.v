module alu_new (/*AUTOARG*/
   // Outputs
   r,
   // Inputs
   a, b, f
   );
   input [31:0] a, b;
   input [3:0]	f;
   output [31:0] r;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [31:0]		diff;			// From our_substracter of sub32.v
   wire [31:0]		out, out2;			// From adder_mux of mux32two.v, 
   wire [31:0]		prod;			// From our_multiflier of mul16.v
   wire [31:0]		sum;			// From our_adder of add32.v
   wire [31:0]		o0;
   wire [31:0]		o1;
   wire [31:0]		o2;
   wire [31:0]		o3;
   wire [31:0]		o4;
   
   // End of automatics
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   // End of automatics

   mux32two adder_mux (/*AUTOINST*/
		       // Outputs
		       .out		(out[31:0]),
		       // Inputs
		       .i0		(b),
		       .i1		(32'b1),
		       .sel		(f[0]));
   mux32two sub_mux (/*AUTOINST*/
		     // Outputs
		     .out		(out2),
		     // Inputs
		     .i0		(b),
		     .i1		(32'b1),
		     .sel		(f[0]));
   add32_gen our_adder (/*AUTOINST*/
		    // Outputs
		    .sum		(sum[31:0]),
		    // Inputs
		    .i0			(a),
		    .i1			(out));
   sub32_gen our_substracter (/*AUTOINST*/
			  // Outputs
			  .diff			(diff[31:0]),
			  // Inputs
			  .i0			(a),
			  .i1			(out2));
   mul16 our_multiflier (/*AUTOINST*/
			 // Outputs
			 .prod			(prod[31:0]),
			 // Inputs
			 .i0			(a[15:0]),
			 .i1			(b[15:0]));

   and32 our_and (/*AUTOINST*/
		  // Outputs
		  .o			(o0),
		  // Inputs
		  .i0			(a[31:0]),
		  .i1			(b[31:0]));
   or32 our_or (/*AUTOINST*/
		// Outputs
		.o			(o1),
		// Inputs
		.i0			(a[31:0]),
		.i1			(b[31:0]));
   not32 our_not (/*AUTOINST*/
		  // Outputs
		  .o			(o2),
		  // Inputs
		  .i0			(a[31:0]));
   xor32 our_xor (/*AUTOINST*/
		  // Outputs
		  .o			(o3),
		  // Inputs
		  .i0			(a[31:0]),
		  .i1			(b[31:0]));
   shift32 our_shift (/*AUTOINST*/
		      // Outputs
		      .shift		(o4),
		      // Inputs
		      .i0		(a[31:0]),
		      .i1		(b[31:0]));  
 





   
   mux32eight output_mux (/*AUTOINST*/
			  // Outputs
			  .out			(r),
			  // Inputs
			  .i0			(sum),
			  .i1			(diff),
			  .i2			(prod),
			  .i3			(o0),
			  .i4			(o1),
			  .i5			(o2),
			  .i6			(o3),
			  .i7			(o4),
			  .sel			(f[3:1]));

endmodule
