module tpu_logic_sram_top (
    input clk,
    input rst_n,

    output [31:0] debug_out
);

wire csb;
wire web;
wire [6:0] addr;
wire [31:0] din;

wire [31:0] dout0;
wire [31:0] dout1;
wire [31:0] dout2;
wire [31:0] dout3;

assign csb  = 1'b0;
assign web  = 1'b1;
assign addr = 7'd0;
assign din  = 32'd0;

assign debug_out = dout0 ^ dout1 ^ dout2 ^ dout3;

SRAM_32x128_1rw mem0 (

    .clk0(clk),
    .csb0(csb),
    .web0(web),
    .addr0(addr),
    .din0(din),
    .dout0(dout0)
);

SRAM_32x128_1rw mem1 (

    .clk0(clk),
    .csb0(csb),
    .web0(web),
    .addr0(addr),
    .din0(din),
    .dout0(dout1)
);

SRAM_32x128_1rw mem2 (

    .clk0(clk),
    .csb0(csb),
    .web0(web),
    .addr0(addr),
    .din0(din),
    .dout0(dout2)
);

SRAM_32x128_1rw mem3 (

    .clk0(clk),
    .csb0(csb),
    .web0(web),
    .addr0(addr),
    .din0(din),
    .dout0(dout3)
);

systolic #(
    .ARRAY_SIZE(16)
) uut (
    .clk(clk),
    .srstn(rst_n),

    .alu_start(1'b1),

    .cycle_num(9'd0),

    .sram_rdata_w0(dout0),
    .sram_rdata_w1(dout1),

    .sram_rdata_d0(dout2),
    .sram_rdata_d1(dout3),

    .matrix_index(6'd0),

    .mul_outcome()
);

endmodule
