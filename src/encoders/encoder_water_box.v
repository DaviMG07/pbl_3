module encoder_water_box(
    input [3:0] count,
    output [1:0] water_box
);

wire x;
wire [3:0] aux;

and(x, !count[1], count[0]);

or(aux[0], count[1], x);

xnor(aux[1], count[1], count[0]);

and(aux[2], !count[2], aux[0]);

and(water_box[1], count[2], aux[0]);

and(aux[3], count[2], aux[1]);

or(water_box[0], aux[2], aux[3]);

endmodule
