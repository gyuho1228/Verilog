module MUX4_to_1 (
  // Input, Output port 선언
  output reg OUT,
  input wire I0, I1, I2, I3,
  input wire S1, S0
);
  always @ (S1 or S0 or I0 or I1 or I2 or I3) // always
    @(*)과 동일
    case ({S1,S0}) // control signals에 따라 동작
      2’d0 : OUT = I0;
      2’d1 : OUT = I1;
      2’d2 : OUT = I2;
      2’d3 : OUT = I3;
      default: $display(“Invalid control signals”);
    endcase
endmodule
