module clock(
  input clk, rstn,
  output reg [5:0] hour,
  output reg [6:0] min
);
  always @(posedge clk, negedge rstn)
    if (!rstn) begin
      hour <= 0;
      min  <= 0;
    end
  
  else if (hour == 23 & min == 59) begin
    min  <= 0;
    hour <= 0;
  end
  
  else if (min == 59) begin
    min  <= 0;
    hour <= hour + 1;
  end
  
  else begin
    min <= min + 1;
  end
endmodule

//test bench
module tb;
  reg clk, rstn;
  wire [5:0] hour;
  wire [6:0] min;
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rstn = 1;
    #10 rstn = 0;
    #10 rstn = 1;
  end
  
  initial begin
    #15000 $finish;
  end
  
  clock u_clock(clk, rstn, hour, min);
  
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
  end
  
  always @(min, hour) begin
    $display("%d : %d", hour, min);
  end
  
endmodule
      
