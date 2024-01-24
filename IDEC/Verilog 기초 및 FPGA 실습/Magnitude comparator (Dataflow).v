//Design
module comparator(
  input wire [3:0] A, B,
  input wire En,
  output wire GT, EQ, LT
);
  assign GT = (En == 1) ? (A>B) : 0;
  assign EQ = (En == 1) ? (A==B) : 0;
  assign LT = (En == 1) ? (A<B) : 0;
endmodule
//tb
module tb;
  reg [3:0] A, B;
  reg En;
  wire GT, EQ, LT;
  
  comparator u_comparator(A, B, En, GT, EQ, LT);
  
  initial begin
    En = 0;
    A = 4'b0001; B = 4'b0011;
    #5;
    A = 4'b0101; B = 4'b0011;
    #5;
    A = 4'b1001; B = 4'b0010;
    #5;
    A = 4'b0011; B = 4'b0011;
    #5;
    En = 1;
    A = 4'b0001; B = 4'b0011;
    #5;
    A = 4'b0101; B = 4'b0011;
    #5;
    A = 4'b1001; B = 4'b0010;
    #5;
    A = 4'b0011; B = 4'b0011;
    #5;
  end
  
  initial begin
    $dumpfile("a.vcd");
    $dumpvars(0, tb);
  end
endmodule
