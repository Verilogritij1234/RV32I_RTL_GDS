`timescale 1ns/1ps

module stimulus;

    reg clk;
    reg reset;
    wire [31:0] out_data;

    // Instantiate DUT (Device Under Test)
    cpu_top uut (
        .clk(clk),
        .reset(reset),
        .out_data(out_data)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // toggle every 5ns
    end

    // Stimulus
    initial begin
        // Apply reset
        reset = 1;
        #20;             // hold reset for 20ns
        reset = 0;

        // Run for some cycles
        #200;

        // Finish simulation
        $finish;
    end

    // Monitor outputs
    initial begin
       $monitor("Time=%0t | PC=%d | instr=%h | reg_a=%h | reg_b=%h | out_data=%d",
          $time, uut.pc, uut.instr, uut.reg_a, uut.reg_b, out_data);
    end
    initial begin
        $dumpfile("cpu_top_final.vcd");
$dumpvars(0, stimulus);
    end

endmodule


// iverilog -o cpu_top_tb.out cpu_top.v alu_control.v ALU.v control_unit.v parameterized_RAM.v  regfile.v rom.v  cpu_top_tb.v
// vvp cpu_top_tb.out 
// dumpfile("dump.vcd");
// dumpvars(0, stimulus);
// gtkwave cpu_top.vcd
// gtkwave cpu_top_final.vcd
