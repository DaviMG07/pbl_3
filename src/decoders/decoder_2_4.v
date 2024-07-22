module decoder_2_4(
    input [1:0] data,
    output a,
    output b,
    output c,
    output d
);

and(a, !data[1], !data[0]);
and(b, !data[1], data[0]);
and(c, data[1], !data[0]);
and(d, data[1], data[0]);

endmodule
