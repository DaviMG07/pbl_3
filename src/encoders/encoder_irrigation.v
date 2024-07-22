module encoder_irrigation(
    input sprinkler,
    input drip,
    input specific,
    output [1:0] irrigation_data
);

wire [1:0] aux;

// R0 = A . G'
and(irrigation_data[0], sprinkler, !drip);

// R1 = A' · G · S' + A · G' · S
and(aux[0], irrigation_data[0], specific);
and(aux[1], !sprinkler, drip, !specific);
or(irrigation_data[1], aux[0], aux[1]);

endmodule
