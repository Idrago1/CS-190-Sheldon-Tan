module alwcpu_chip(

    // Pads
    input clk_pad,
    input rst_pad,

    // Test interface
    input scan_en,
    input scan_in,
    output scan_out,

    // Debug pads
    output [7:0] debug_addr,
    output [7:0] debug_data

);

wire clk;
wire rst;

assign clk = clk_pad;
assign rst = rst_pad;

// Device interface
wire [7:0] dvc_wr_addr;
wire [7:0] dvc_rd_addr;
wire [7:0] data_mem2dvc;
wire [7:0] data_dvc2mem;

wire dvc_wr;
wire dvc_rd;

// Simple test stub
assign scan_out = scan_in;

// Debug pads
assign debug_addr = dvc_wr_addr;
assign debug_data = data_mem2dvc;

// No external device attached
assign data_dvc2mem = 8'h00;

ClaiRISC_core cpu (
    .clk(clk),
    .rst(rst),
    .dvc_wr_addr(dvc_wr_addr),
    .dvc_rd_addr(dvc_rd_addr),
    .data_mem2dvc(data_mem2dvc),
    .data_dvc2mem(data_dvc2mem),
    .dvc_wr(dvc_wr),
    .dvc_rd(dvc_rd)
);

endmodule
