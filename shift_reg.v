module shift_reg (
    input clk,
    input reset,
    input shift_en,
    input serial_in,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else if (shift_en)
            q <= {q[2:0], serial_in}; // Left shift, insert serial_in at LSB
    end
endmodule
