module shift_reg_tb;
    reg clk, reset, shift_en, serial_in;
    wire [3:0] q;

    shift_reg uut(clk, reset, shift_en, serial_in, q);
    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; shift_en = 0; serial_in = 0;
        #10 reset = 0; shift_en = 1;
        $monitor("Time=%0t | serial_in=%b | q=%b", $time, serial_in, q);
        
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        $finish;
    end
endmodule
