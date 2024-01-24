// Dataflow modeling
module decoder(
  input wire [1:0] Din,
  input wire Enable,
  output wire [3:0] Dout
);
  assign Dout[0] = (Din == 2'b00 & Enable);
  assign Dout[1] = (Din == 2'b01 & Enable);
  assign Dout[2] = (Din == 2'b10 & Enable);
  assign Dout[3] = (Din == 2'b11 & Enable);
endmodule
//tb
`timescale 10ns/1ps
module tb;
  reg [1:0] Din;
  reg Enable;
  wire [3:0] Dout;
  
  decoder u_decoder(
    .Din	(Din),
    .Enable	(Enable),
    .Dout	(Dout)
  );
  
  initial begin
    Enable = 0; Din = 2'b00;
    #5;
    Enable = 0; Din = 2'b01;
    #5;
    Enable = 0; Din = 2'b10;
    #5;
    Enable = 0; Din = 2'b11;
    #5;
    Enable = 1; Din = 2'b00;
    #5;
    Enable = 1; Din = 2'b01;
    #5;
    Enable = 1; Din = 2'b10;
    #5;
    Enable = 1; Din = 2'b11;
    #5;
  end
  
  initial begin
    $dumpfile("a.vcd");
    $dumpvars(0, tb);
  end
  
endmodule
