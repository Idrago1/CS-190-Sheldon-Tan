module alwcpu_chip(

    input clk_pad,
    input rst_pad,

    input scan_en,
    input scan_in,
    output scan_out,

    output [7:0] gpio_out,

    output [7:0] debug_addr,
    output [7:0] debug_data

);

wire clk = clk_pad;
wire rst = rst_pad;

wire [7:0] dvc_wr_addr;
wire [7:0] dvc_rd_addr;
wire [7:0] data_mem2dvc;
wire [7:0] data_dvc2mem;

wire dvc_wr;
wire dvc_rd;

assign debug_addr = dvc_wr_addr;
assign debug_data = data_mem2dvc;

assign scan_out = scan_in;

////////////////////////////////////////////////
// GPIO Peripheral
////////////////////////////////////////////////

reg [7:0] gpio_reg;

always @(posedge clk)
begin
    if (rst)
        gpio_reg <= 8'h00;
    else if (dvc_wr && dvc_wr_addr == 8'h10)
        gpio_reg <= data_mem2dvc;
end

assign gpio_out = gpio_reg;

////////////////////////////////////////////////
// Timer Peripheral
////////////////////////////////////////////////

reg [31:0] timer_count;

always @(posedge clk)
begin
    if (rst)
        timer_count <= 32'd0;
    else
        timer_count <= timer_count + 1'b1;
end

////////////////////////////////////////////////
// Extra Registers (increases logic)
////////////////////////////////////////////////

reg [7:0] reg0;
reg [7:0] reg1;
reg [7:0] reg2;
reg [7:0] reg3;

always @(posedge clk)
begin
    if (rst)
    begin
        reg0 <= 0;
        reg1 <= 0;
        reg2 <= 0;
        reg3 <= 0;
    end
    else if (dvc_wr)
    begin
        case (dvc_wr_addr)
            8'h30: reg0 <= data_mem2dvc;
            8'h31: reg1 <= data_mem2dvc;
            8'h32: reg2 <= data_mem2dvc;
            8'h33: reg3 <= data_mem2dvc;
        endcase
    end
end

////////////////////////////////////////////////
// SRAM Interface
////////////////////////////////////////////////



////////////////////////////////////////////////
// Read Mux
////////////////////////////////////////////////

assign data_dvc2mem =
        (dvc_rd_addr == 8'h10) ? gpio_reg :
        (dvc_rd_addr == 8'h20) ? timer_count[7:0] :
        (dvc_rd_addr == 8'h30) ? reg0 :
        (dvc_rd_addr == 8'h31) ? reg1 :
        (dvc_rd_addr == 8'h32) ? reg2 :
        (dvc_rd_addr == 8'h33) ? reg3 :

        8'h00;

////////////////////////////////////////////////
// CPU
////////////////////////////////////////////////

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
