// Dataflow modeling(조건부 연산자 사용)
// Gate-level model와 비교
module MUX4_to_1 (
  // Input, Output port 선언
  output wire OUT,
  input wire I0, I1, I2, I3,
  input wire S1, S0
);
  // 조건부 연산자 사용
  assign out = S1 ? ( S0 ? I3 : I2 ) : ( S0 ? I1 : I0 );
endmodule
