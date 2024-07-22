module flip_flop_D(
    input clock,
    input data,
    input preset,
    input reset,
    output reg Q
);

always @(posedge clock or posedge reset) begin
    if (reset) begin
        if (preset) begin
            Q <= 1;
        end
        else begin
            Q <= 0;
        end
    end
    else begin
        Q <= data;
    end
end

endmodule
