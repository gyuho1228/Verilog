//design
module counter(
  input wire clk, clr,
  output reg [3:0] Q
);
  always @(posedge clk) begin
    if (!clr) Q = 0;
    else Q++;
  end
endmodule

//tb
module tb;
  reg clk, clr;
  wire [3:0] Q;
  
  counter u_counter(clk, clr, Q);
  
  initial begin
    clk = 0; clr = 0;
    #10 clr = 1;
    #200 clr = 0;
    #30 clr = 1;
    #100 $finish;
  end
  
  always #5 clk = ~clk;
 
  initial begin
    $dumpfile("a.vcd");
    $dumpvars(0, tb);
  end
  
endmodule
  
