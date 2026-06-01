module alwcpu_soc_top(
    input clk,
    input rst,

    output [7:0] dvc_wr_addr,
    output [7:0] dvc_rd_addr,
    output [7:0] data_mem2dvc,
    output dvc_wr,
    output dvc_rd
);

wire [7:0] data_dvc2mem;

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
