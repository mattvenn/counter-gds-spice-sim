`default_nettype none
module r2r_dac_control (
    input wire clk,                 // expect a 10M clock
    input wire n_rst,
    output wire [3:0] count        // 8 bit out to the R2R DAC
    );

    reg rst;
    assign count = counter;
    reg [3:0] counter;

    initial begin
        $dumpfile ("r2r_dac_control.vcd");
        $dumpvars (0, r2r_dac_control);
    end

    // reset handling
    always @(posedge clk or posedge n_rst) begin
        if(n_rst)
            rst <= 1'b0;
        else 
            rst <= 1'b1;
    end

    // counter and r2r output
    always @(posedge clk) begin
        if(rst) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

endmodule
