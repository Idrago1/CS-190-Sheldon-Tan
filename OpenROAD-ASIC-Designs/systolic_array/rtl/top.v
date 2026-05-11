(* keep_hierarchy = "yes" *)
module systolic_core (
    input clk,
    input rst_n,
    output [127:0] out   //  ADD THIS
);

// Make signals NOT constant
reg alu_start;
reg [8:0] cycle_num;
reg [5:0] matrix_index;

reg [31:0] wdata [0:7];
reg [31:0] ddata [0:7];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        alu_start <= 1'b1;
        cycle_num <= 9'd1;
        matrix_index <= 6'd1;
    end else begin
        cycle_num <= cycle_num + 1;
    end
end

systolic #(
    .ARRAY_SIZE(4)
) uut (
    .clk(clk),
    .rst_n(rst_n),

    .alu_start(alu_start),
    .cycle_num(cycle_num),
    .matrix_index(matrix_index),

    .sram_rdata_w0(wdata[0]),
    .sram_rdata_w1(wdata[1]),
    .sram_rdata_w2(wdata[2]),
    .sram_rdata_w3(wdata[3]),
    .sram_rdata_w4(wdata[4]),
    .sram_rdata_w5(wdata[5]),
    .sram_rdata_w6(wdata[6]),
    .sram_rdata_w7(wdata[7]),

    .sram_rdata_d0(ddata[0]),
    .sram_rdata_d1(ddata[1]),
    .sram_rdata_d2(ddata[2]),
    .sram_rdata_d3(ddata[3]),
    .sram_rdata_d4(ddata[4]),
    .sram_rdata_d5(ddata[5]),
    .sram_rdata_d6(ddata[6]),
    .sram_rdata_d7(ddata[7]),

    .mul_outcome(out)
);

endmodule
