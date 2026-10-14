`timescale 1ns / 1ns

module Comparator_tb;

reg key_A_n = 1;
reg key_B_n = 1;

wire led_lt_n;
wire led_eq_n;
wire led_gt_n;

Comparator dut (
    .key_A_n (key_A_n),
    .key_B_n (key_B_n),
    .led_lt_n (led_lt_n),
    .led_eq_n (led_eq_n),
    .led_gt_n (led_gt_n)
);

initial begin
$dumpfile("Comparator_tb.vcd");
$dumpvars(0, Comparator_tb);
                                //A B-> lt eq gt-> led_lt_n led_eq_n led_gt_n
#10 {key_A_n, key_B_n} = 2'b10; //0 1-> 1  0  0 -> 0        1        1       (led1 on)
#10 {key_A_n, key_B_n} = 2'b00; //1 1-> 0  1  0 -> 1        0        1       (led2 on)
#10 {key_A_n, key_B_n} = 2'b01; //1 0-> 0  0  1 -> 1        1        0       (led3 on)
#10 $finish;
end

endmodule
