# OpenROAD ASIC Design Repository

This repository contains multiple ASIC physical-design projects developed using:

- OpenROAD
- OpenRAM
- Yosys
- KLayout
- Nangate45 Technology Library

The repository is organized so each design can be independently synthesized, floorplanned, placed, routed, and analyzed.

---

# Repository Structure

```text
OpenROAD-ASIC-Designs/
│
├── gcd/
├── riscv_alu/
├── systolic_array/
├── sram_32x128/
├── setup/
└── docs/
```

Each design folder contains:

```text
rtl/           -> Verilog RTL source files
config/        -> OpenROAD config files
constraints/   -> SDC timing constraints
reports/       -> Area/power/timing reports
screenshots/   -> Layout images
results/       -> Final outputs
```

---

# Tools Used

## OpenROAD
Physical design automation tool for RTL-to-GDSII flow.

Official Website:
https://theopenroadproject.org/

## OpenRAM
Open-source SRAM compiler used for custom memory generation.

Official Website:
https://openram.org/

---

# Installation

## 1. Clone OpenROAD

```bash
git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git
```

---

## 2. Build OpenROAD

```bash
cd OpenROAD-flow-scripts
./build_openroad.sh --local
```

---

## 3. Add OpenROAD to PATH

```bash
echo 'export PATH=$HOME/OpenROAD-flow-scripts/tools/install/OpenROAD/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

Verify installation:

```bash
openroad -version
```

---

# Running a Design

Go into the OpenROAD flow directory:

```bash
cd ~/OpenROAD-flow-scripts/flow
```

Run a design:

```bash
make DESIGN_CONFIG=./designs/nangate45/gcd/config.mk
```

Example designs:
- gcd
- riscv_alu
- systolic_array
- sram_32x128

---

# Viewing Layouts

Open GUI:

```bash
openroad -gui
```

Load database:

```tcl
read_db ./results/nangate45/<design_name>/base/6_final.odb
gui::fit
```

---

# SRAM Generation using OpenRAM

Example SRAM generation:

```bash
python3 sram_compiler.py SRAM_32x128_1rw.py
```

Generated outputs include:
- GDS
- LEF
- Liberty (.lib)
- Verilog model
- SPICE netlist

These SRAM macros can then be integrated into OpenROAD.

---

# Included Designs

## 1. GCD
Basic OpenROAD tutorial design.

## 2. RISC-V ALU
32-bit arithmetic logic unit.

## 3. Systolic Array
Simplified TPU-style accelerator.

## 4. SRAM 32x128
Custom SRAM macro generated using OpenRAM and integrated into OpenROAD.

---

# Example Results

Example metrics collected:
- Area
- Utilization
- Number of cells
- Power consumption
- Final layout screenshots

---

# Notes

Some macro-dominant designs (such as SRAM-only wrappers) may skip:
- timing-driven placement
- gate resizing
- repair optimization

because these stages are unnecessary for macro-only designs.

---

# Contributors

- Ivan Nguyen
- UCR EE/CS Research Project

---

# References

- https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
- https://openram.org/
- https://github.com/abdelazeem201/Systolic-array-implementation-in-RTL-for-TPU
