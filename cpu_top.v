module cpu_top (
    input clk, reset,
    output [31:0] out_data,
      inout VPWR,
  inout VGND
);
    // Program Counter
    reg [7:0] pc;
    always @(posedge clk or posedge reset) begin
        if (reset) pc <= 0;
        else pc <= pc + 1; // simple sequential fetch
    end

    // Instruction fetch
    wire [31:0] instr;
    rom #( .DEPTH(16), .WIDTH(32) ) instr_mem (
        .clk(clk),
        .addr_rd(pc[3:0]), // lower bits as address
        .data_rom_out(instr)
    );

    // Decode fields (for now, treat instr as opcode directly)
    // RISC-V RV32I fields
wire [4:0] rd     = instr[11:7];
wire [2:0] funct3 = instr[14:12];
wire [4:0] rs1    = instr[19:15];
wire [4:0] rs2    = instr[24:20];  // for 
wire [6:0] funct7 = instr[31:25];    // for funct7 

    // Control signals
    wire reg_write, mem_write, mem_to_reg;
    wire [2:0] alu_op;
    wire [3:0] alu_opcode;

wire [6:0] opcode = instr[6:0];

    control_unit cu (
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .alu_op(alu_op)
    );

    alu_control alu_ctrl (
        .funct3(funct3),
        .funct7(funct7),
        .alu_op(alu_op),
        .alu_opcode(alu_opcode)
    );

    // Register file
    wire [31:0] reg_a, reg_b, write_data;
    regfile rf (
        .clk(clk),
        .we(reg_write),
        .rs1(instr[19:15]), //  adjust for 8-bit ISA
        .rs2(instr[24:20]),
        .rd(instr[11:7]),
        .wd(out_data),
        .rd1(reg_a),
        .rd2(reg_b)
    );

    // ALU
    wire  [31:0] alu_b;
    wire carry_out, borrow, zero, parity, invalid_op;
    ALU #( .BUS_WIDTH(32) ) myalu (
        .a(reg_a),
        .b(alu_b),
        .carry_in(1'b0),
        .opcode(alu_opcode),
        .y(out_data),
        .carry_out(carry_out),
        .borrow(borrow),
        .zero(zero),
        .parity(parity),
        .invalid_op(invalid_op)
    );

    // Data RAM
    wire [31:0] ram_data;
    parameterized_RAM #( .DATA_WIDTH(32), .ADDR_WIDTH(6) ) dataRam (
        .clk(clk),
        .reset(reset),
        .we(mem_write),
        .address(out_data[5:0]),
        .data_in(reg_b),
        .data_ram_out(ram_data)
    );



    // Immediate generator (basic for I-type like ADDI)
wire [31:0] imm_i = {{20{instr[31]}}, instr[31:20]}; // sign-extend

// Choose ALU second operand: register or immediate
assign alu_b = (alu_op == 3'b011) ? imm_i : reg_b;


endmodule


