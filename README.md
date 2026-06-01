# OpenROAD ASIC Design Repository

This repository contains multiple ASIC physical-design projects developed using:

- OpenROAD
- OpenRAM
- Yosys
- KLayout
- Nangate45 Technology Library

---

# Repository Structure

    OpenROAD-ASIC-Designs/
    │
    ├── gcd/
    ├── riscv_alu/
    ├── systolic_array/
    ├── tpu_logic_sram/
    ├── sram_32x128/
    ├── setup/
    ├── reports/
    └── docs/

Each design folder contains:

    rtl/           -> Verilog RTL source files
    config/        -> OpenROAD config files
    constraints/   -> SDC timing constraints
    reports/       -> Area/power/timing reports
    screenshots/   -> Layout images
    results/       -> Final outputs

---

# Included Designs

## 1. GCD

Basic OpenROAD tutorial design.

## 2. RISC-V ALU

32-bit arithmetic logic unit synthesized and placed using OpenROAD.

## 3. Systolic Array

Simplified TPU-style systolic-array accelerator design.

Features:
- Matrix multiplication pipeline
- Parameterized array size
- Quantization logic
- Address-selection logic

## 4. SRAM 32x128

Custom SRAM macro generated using OpenRAM and integrated into OpenROAD.

Generated outputs include:
- Verilog model
- LEF abstract view
- Liberty timing model
- SPICE netlist
- GDS layout

## 5. TPU + SRAM Integrated Accelerator

Custom accelerator integrating:
- systolic-array compute engine
- OpenRAM-generated SRAM macros
- OpenROAD macro floorplanning flow

Successfully completed:
- RTL synthesis
- floorplanning
- macro placement
- PDN generation
- global placement

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

## Yosys

Open-source RTL synthesis framework.

Official Website:  
https://yosyshq.net/yosys/

## KLayout

Layout visualization and GDS inspection tool.

Official Website:  
https://www.klayout.de/

---

# Installation

## 1. Clone OpenROAD

```bash
git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git
```

## 2. Build OpenROAD

```bash
cd OpenROAD-flow-scripts
./build_openroad.sh --local
```

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
- tpu_logic_sram

---

# Viewing Layouts

Open GUI:

```bash
openroad -gui
```

Load database:

```tcl
read_db ./results/nangate45/<design_name>/base/3_3_place_gp.odb

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

# TPU + SRAM Integration Results

## Technology
- Nangate45

## SRAM Configuration
- 32-bit word size
- 128 words
- 4096-bit total capacity

## Accelerator Features
- Systolic-array TPU architecture
- SRAM macro integration
- OpenROAD macro placement

## Successfully Completed
- OpenRAM SRAM generation
- LEF/LIB integration
- synthesis
- floorplanning
- PDN generation
- global placement
- GUI visualization

---

# Contributors

Ivan Nguyen  
UCR EE/CS Research Project

---

# References

OpenROAD Flow Scripts  
https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts

OpenRAM  
https://openram.org/

Systolic Array RTL Reference  
https://github.com/abdelazeem201/Systolic-array-implementation-in-RTL-for-TPU
