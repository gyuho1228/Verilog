// Dataflow modeling
module fulladd4 (
  // Input, Output port 선언
  output wire [3:0] SUM,
  output wire C_OUT,
  input wire [3:0] X, Y,
  input wire C_IN
);
  // 전가산기의 기능 정의
  assign { C_OUT , SUM } = X + Y + C_IN;
endmodule
