// TO REVIEW
module driver_display(
    input display_clock,
    input [7:0] digitA,
    input [7:0] digitB,
    input [7:0] digitC,
    input [7:0] digitD,
    output [3:0] digits,
    output [7:0] segments
);

wire [1:0] count;
wire [3:0] digits_n;

counter_3_0(display_clock, , , count);

decoder_2_4(count, digits_n[0], digits_n[1], digits_n[2], digits_n[3]);

not(digits[0], digits_n[0]);
not(digits[1], digits_n[1]);
not(digits[2], digits_n[2]);
not(digits[3], digits_n[3]);

mux_32_2_8(digitA, digitB, digitC, digitD, count, segments);

endmodule
