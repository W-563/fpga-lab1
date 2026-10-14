`timescale 1ns / 1ns

module FullAdder(
    input wire key_A_n,
    input wire key_B_n,
    input wire key_Cin_n,
    output wire led_S_n,
    output wire led_Cout_n
);

wire A, B, Cin, S, Cout;
assign A = ~key_A_n;
assign B = ~key_B_n;
assign Cin = ~key_Cin_n;

assign S = ^{A, B, Cin};
assign Cout = (A & B)|(Cin & (A ^ B));

assign led_S_n = ~S;
assign led_Cout_n = ~Cout;

endmodule
