# The Beast: Custom 32-bit RV32I RISC-V Processor Core

A fully verified, open-source 32-bit 5-stage pipelined RISC-V processor core (`cpu_top`) designed, synthesized, placed, routed, and verified using a 100% open-source EDA toolchain and the **SkyWater 130nm PDK**.

---

## 🚀 Project Overview

This repository contains the complete RTL-to-GDS2 physical design flow for **"The Beast"**, a custom 32-bit RISC-V integer base (RV32I) microprocessor. The project demonstrates end-to-end silicon implementation—ranging from behavioral modeling in Verilog and functional waveform verification to logic synthesis, power distribution network (PDN) design, clock tree synthesis (CTS), global/detailed placement, routing, and sign-off verification (DRC, LVS, STA, and IR drop analysis).

---

## ✨ Key Features & Architectural Highlights

* **RISC-V RV32I ISA Compliance:** Built around a streamlined 32-bit instruction set optimized for low-power embedded and IoT computing.
* **5-Stage Machine Cycle Architecture:** Features harmonized sub-modules including Program Counter (PC), Instruction ROM, Control Unit, Register File, Parameterized RAM, ALU Control, and a custom ALU.
* **Custom Microarchitectural Extensions:** Enhanced ALU supporting traditional arithmetic/logical operations along with custom status flags (**parity, carry, and borrow**) for specialized computational error tracking.
* **Robust Physical Implementation:** Achieves a clean 25.055% core utilization on a $500 \times 500\ \mu\text{m}$ die boundary, entirely eliminating routing congestion[cite: 1].
* **Flawless Power Integrity:** Power Distribution Network (PDN) analysis yields a worst-case IR drop of just $37.1\ \mu\text{V}$ (**0.00% drop**), ensuring high electrical stability on the 1.8V nominal supply[cite: 1].
* **100% Open-Source Toolchain Provenance:** Developed entirely without commercial proprietary licenses using community-standard EDA tools[cite: 1].

---

## 🛠️ Open-Source EDA Toolchain

| Design Phase | Tools Used | Description |
| :--- | :--- | :--- |
| **RTL & Functional Verification** | VS Code, Icarus Verilog, GTKWave | Behavioral compilation, testbench simulation, and `.vcd` waveform tracing[cite: 1]. |
| **Logic Synthesis** | Yosys, SkyWater 130nm PDK (`.lib`, `.lef`) | Translates RTL into an optimized gate-level netlist (`cpu_top.v`)[cite: 1]. |
| **Placement & Routing (P&R)** | OpenROAD | Handles floorplanning, PDN insertion, CTS, global/detailed placement, and global routing[cite: 1]. |
| **Layout & GDSII Generation** | Magic VLSI, KLayout | Merges DEF files into standard GDSII layout streams and visualizes 3D structures[cite: 1]. |
| **Sign-off & Verification** | KLayout DRC/LVS Engines, OpenROAD STA | Validates Layout-vs-Schematic, Design Rule Checks, and fast-corner hold timing[cite: 1]. |

---

## 📊 Summary of Implementation Metrics (PPA & STA)

| Parameter | Extracted Value | Status / Note |
| :--- | :--- | :--- |
| **Technology Node** | SkyWater 130nm CMOS | Open-source foundry standard[cite: 1] |
| **Core Area** | 219,725.734 $\mu\text{m}^2$ | Core boundary layout[cite: 1] |
| **Standard Cell Area** | 55,501 $\mu\text{m}^2$ | 25.055% utilization ratio[cite: 1] |
| **Total Instances** | 6,247 (3,289 logic cells) | High-density leaf instances[cite: 1] |
| **Target Clock Frequency** | 100 MHz (10.00 ns period) | Fully constrained via SDC file[cite: 1] |
| **Worst Setup Slack** | +0.67 ns | MET (Max delay path)[cite: 1] |
| **Worst Hold Slack (-40°C)** | +0.36 ns | MET (Fast corner sign-off)[cite: 1] |
| **Total Power Consumption**| 6.65 mW | Dominated by sequential/clock power[cite: 1] |

---

## 📂 Repository Directory Structure

```text
├── rtl/
│   ├── cpu_top.v              # Top-level microprocessor integration
│   ├── ALU.v                  # Arithmetic Logic Unit with custom flags
│   ├── alu_control.v          # Decoder for ALU operations
│   ├── control_unit.v         # Instruction decode and control logic
│   ├── regfile.v              # 32-bit register file array
│   ├── parameterized_RAM.v    # Configurable data memory block
│   └── rom.v                  # Instruction memory pre-loaded with test vectors
├── testbench/
│   └── cpu_top_tb.v           # Comprehensive testbench and stimulus generator
├── synthesis/
│   ├── yosys_script.ys        # Yosys synthesis script for Sky130 mapping
│   └── cpu_top_netlist.v      # Generated gate-level netlist
├── openroad/
│   ├── floorplan.tcl          # Floorplanning and die sizing configurations
│   ├── constraint.sdc         # Synopsys Design Constraints for clock and I/O
│   └── outputs/               # Generated DEF and routed outputs
├── gds/
│   └── cpu_top_sky_tapeout.gds# Final layout GDSII binary file
└── README.md                  # Project documentation



1. Prerequisites
Ensure you have the open-source toolchain installed locally or inside a containerized environment (like the OpenLane/OpenROAD flow container)[cite: 1]:

Icarus Verilog (iverilog, vvp)[cite: 1]

GTKWave[cite: 1]

Yosys[cite: 1]


# Clone the repository
git clone [https://github.com/your-username/mini-beast-rv32i-core.git](https://github.com/your-username/mini-beast-rv32i-core.git)
cd mini-beast-rv32i-core/rtl

# Compile design and testbench files
iverilog -o cpu_top_tb.out cpu_top_tb.v cpu_top.v alu_control.v ALU.v control_unit.v parameterized_RAM.v regfile.v rom.v

# Execute simulation to generate VCD waveform dump
vvp cpu_top_tb.out

gtkwave cpu_top.vcd
