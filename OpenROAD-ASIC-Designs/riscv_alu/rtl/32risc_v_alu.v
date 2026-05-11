module riscv_alu_32bit (
    input  wire [31:0] operand_a,      // First operand
    input  wire [31:0] operand_b,      // Second operand
    input  wire [3:0]  alu_op,         // ALU operation select
    output reg  [31:0] result,         // ALU result
    output wire        zero,           // Zero flag (result == 0)
    output wire        overflow,       // Overflow flag
    output wire        carry_out       // Carry out flag
);
    // ALU Operation Codes (based on RISC-V funct3 + funct7)
    localparam ALU_ADD  = 4'b0000;  // Addition
    localparam ALU_SUB  = 4'b0001;  // Subtraction
    localparam ALU_SLL  = 4'b0010;  // Shift left logical
    localparam ALU_SLT  = 4'b0011;  // Set less than (signed)
    localparam ALU_SLTU = 4'b0100;  // Set less than (unsigned)
    localparam ALU_XOR  = 4'b0101;  // Bitwise XOR
    localparam ALU_SRL  = 4'b0110;  // Shift right logical
    localparam ALU_SRA  = 4'b0111;  // Shift right arithmetic
    localparam ALU_OR   = 4'b1000;  // Bitwise OR
    localparam ALU_AND  = 4'b1001;  // Bitwise AND
    // Internal signals for arithmetic operations
    wire [32:0] add_result;
    wire [32:0] sub_result;
    wire        add_overflow;
    wire        sub_overflow;
    // Addition with carry
    assign add_result = {1'b0, operand_a} + {1'b0, operand_b};
    // Subtraction with borrow
    assign sub_result = {1'b0, operand_a} - {1'b0, operand_b};
    // Overflow detection for signed operations
    assign add_overflow = (operand_a[31] == operand_b[31]) &&
                         (result[31] != operand_a[31]);
    assign sub_overflow = (operand_a[31] != operand_b[31]) &&
                         (result[31] != operand_a[31]);
    // ALU operation logic
    always @(*) begin
        case (alu_op)
            ALU_ADD:  result = add_result[31:0];
            ALU_SUB:  result = sub_result[31:0];
            ALU_SLL:  result = operand_a << operand_b[4:0];  // Shift amount is lower 5 bits
            ALU_SLT:  result = ($signed(operand_a) < $signed(operand_b)) ? 32'd1 : 32'd0;
            ALU_SLTU: result = (operand_a < operand_b) ? 32'd1 : 32'd0;
            ALU_XOR:  result = operand_a ^ operand_b;
            ALU_SRL:  result = operand_a >> operand_b[4:0];
            ALU_SRA:  result = $signed(operand_a) >>> operand_b[4:0];  // Arithmetic shift
            ALU_OR:   result = operand_a | operand_b;
            ALU_AND:  result = operand_a & operand_b;
            default:  result = 32'd0;
        endcase
    end
    // Status flags
    assign zero = (result == 32'd0);
    assign carry_out = (alu_op == ALU_ADD) ? add_result[32] :
                       (alu_op == ALU_SUB) ? sub_result[32] : 1'b0;
    assign overflow = (alu_op == ALU_ADD) ? add_overflow :
                      (alu_op == ALU_SUB) ? sub_overflow : 1'b0;
endmodule
