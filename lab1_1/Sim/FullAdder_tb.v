`timescale 1ns / 1ns

module FullAdder_tb;

reg key_A_n = 1;
reg key_B_n = 1;
reg key_Cin_n = 1;

wire led_S_n;
wire led_Cout_n;

FullAdder dut (
    .key_A_n (key_A_n),
    .key_B_n (key_B_n),
    .key_Cin_n (key_Cin_n),
    .led_S_n (led_S_n),
    .led_Cout_n (led_Cout_n)
);

initial begin
$dumpfile("FullAdder_tb.vcd");
$dumpvars(0, FullAdder_tb);
                                            //A B Cin-> S Cout-> led_S_n led_Cout_n
#10 {key_A_n, key_B_n, key_Cin_n} = 3'b110; //0 0 1  -> 1 0   -> 0       1         (S on)
#10 {key_A_n, key_B_n, key_Cin_n} = 3'b101; //0 1 0  -> 1 0   -> 0       1         (S on)
#10 {key_A_n, key_B_n, key_Cin_n} = 3'b100; //0 1 1  -> 0 1   -> 1       0         (Cout on)
#10 {key_A_n, key_B_n, key_Cin_n} = 3'b011; //1 0 0  -> 1 0   -> 0       1         (S on)
#10 {key_A_n, key_B_n, key_Cin_n} = 3'b010; //1 0 1  -> 0 1   -> 1       0         (Cout on)
#10 {key_A_n, key_B_n, key_Cin_n} = 3'b001; //1 1 0  -> 0 1   -> 1       0         (Cout on)
#10 {key_A_n, key_B_n, key_Cin_n} = 3'b000; //1 1 1  -> 1 1   -> 0       0         (both on)
#10 $finish;
end

endmodule
