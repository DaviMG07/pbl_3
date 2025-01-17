module units_decoder(
    input [3:0] units,
    output [7:0] segments
);

wire [3:0] x, y;
wire [13:0] aux;

decoder_2_4(units[3:2], x[0], x[1], x[2], x[3]);
decoder_2_4(units[1:0], y[0], y[1], y[2], y[3]);

/*
X0 = units[3]' · units[2]'
X1 = units[3]' · units[2]
X2 = units[3] · units[2]'
X3 = units[3] · units[2]

Y0 = units[1]' · units[0]'
Y1 = units[1]' · units[0]
Y2 = units[1] · units[0]'
Y3 = units[1] · units[0]
*/

// a = X0 · Y1 + X1 · Y0
and(aux[0], x[0], y[1]);
and(aux[1], x[1], y[0]);
or(segments[0], aux[0], aux[1]);

// b =  X1 (Y1 + Y2)
or(aux[2], y[1], y[2]);
and(segments[1], x[1], aux[2]);

// c = X0 · Y2
and(segments[2], x[0], y[2]);

// d = a + X1 · Y3
and(aux[3], x[1], y[3]);
or(segments[3], segments[0], aux[3]);

// e = d + X0 · Y3 + Y1 (X1 + X2)
or(aux[4], x[1], x[2]);
and(aux[5], y[1], aux[4]);
and(aux[6], x[0], y[3]);
or(segments[4], segments[3], aux[6], aux[5]);

// f = X0 (Y1 + Y2) + Y3 (X0 + X1)
or(aux[7], x[0], x[1]);
and(aux[8], y[3], aux[7]);
or(aux[9], y[1], y[2]);
and(aux[10], x[0], aux[9]);
or(segments[5], aux[8], aux[10]);

// g = X0 (Y0 + Y1) + X1 · Y3
and(aux[11], x[1], x[3]);
or(aux[12], y[0], y[1]);
and(aux[13], x[0], aux[12]);
or(segments[6], aux[13], aux[11]);

endmodule
