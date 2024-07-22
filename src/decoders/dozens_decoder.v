module dozens_decoder(
    input [1:0] dozens,
    output [7:0] segments
);

and(segments[0], !dozens[1], dozens[0]);

assign segments[1] = 0;

and(segments[2], dozens[1], !dozens[0]);

assign segments[3] = segments[0];

assign segments[4] = dozens[0];

or(segments[5], segments[0], segments[2]);

not(segments[6], !dozens[1]);

endmodule
