//design
module alu(
  input wire [3:0] in0, in1,
  input wire [2:0] sel,
  output reg [3:0] out
);
  always @(sel, in0, in1)
    case(sel)
      3'b000 : out = in0;
      3'b001 : out = in0 + in1;
      3'b010 : out = in0 - in1;
      3'b011 : out = in0 / in1;
      3'b000 : out = in0 & in1;
      3'b101 : out = in0 << 1;
      3'b110 : out = in0 >> 1;
      3'b111 : out = (in0 > in1);
      default : out = 0;
    endcase
endmodule

//tb
module tb;
  reg [3:0] in0, in1;
  reg [2:0] sel;
  wire [3:0] out;
  
  alu u_alu(in0, in1, sel, out);
  
  initial begin
    in1 = 7; in0 = 5;
    sel = 0;
    
    repeat(7) begin
      #5;
      sel ++;
    end
    #10;
    
    in1 = 3; in0 = 14;
    sel = 0;
    repeat(7) begin
      #5;
      sel ++;
    end
    #5; $finish;
  end
  
  initial begin
    $dumpfile("a.vcd");
    $dumpvars(0, tb);
  end
  
endmodule
