// Dataflow modeling(논리식 사용)
// Gate-level model와 비교
module MUX4_to_1 (
  // Input, Output port 선언
  output wire OUT,
  input wire I0, I1, I2, I3,
  input wire S1, S0
);
  // 출력에 대한 논리식
  assign out = (~S1 & ~S0 & I0) | (~S1 & S0 & I1) | (S1 & ~S0 & I2) | (S1 & S0 & I3);
endmodule
