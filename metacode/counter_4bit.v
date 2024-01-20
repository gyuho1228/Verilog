module counter(
  input clk, rstn,
  output reg [3:0] out
);
  always @(posedge clk, negedge rstn)
    if(!rstn) out <= 0;
    else      out <= out + 1;
endmodule


//test bench
module tb;
  
  reg clk, rstn;
  wire [3:0] out;
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rstn = 1;
    #10 rstn = 0;
    #20 rstn = 1;
  end
  
  initial begin
    #300 $finish;
  end
  
  counter u_counter(clk, rstn, out);
  
  initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, tb);
  end            
  
endmodule

