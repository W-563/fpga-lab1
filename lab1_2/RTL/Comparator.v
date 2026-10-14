`timescale 1ns / 1ns

module Comparator(
    input wire key_A_n,
    input wire key_B_n,
    output wire led_lt_n,
    output wire led_eq_n,
    output wire led_gt_n
);

wire A, B;
assign A = ~key_A_n;
assign B = ~key_B_n;

wire lt, eq, gt;
assign lt = ~A & B;
assign eq = ~(A ^ B);
assign gt = A & ~B;

assign led_lt_n = ~lt;
assign led_eq_n = ~eq;
assign led_gt_n = ~gt;

endmodule