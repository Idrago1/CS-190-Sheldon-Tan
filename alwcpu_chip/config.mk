export DESIGN_NAME = alwcpu_chip
export PLATFORM = nangate45

export VERILOG_INCLUDE_DIRS = \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip

export VERILOG_FILES = \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/chip_top.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/risc_core.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/mem_man.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/memory.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/sim_rom.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/device_box.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/ram128x8.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/rom32x12.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/rom64x12.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/rom128x12.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/rom256x12.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/rom512x12.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/rom1024x12.v \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/rom2048x12.v \



export SDC_FILE = \
$(DESIGN_HOME)/$(PLATFORM)/alwcpu_chip/constraint.sdc




export DIE_AREA = 0 0 1500 1500
export CORE_AREA = 100 100 1400 1400

export GPL_TIMING_DRIVEN = 0
export PLACE_DENSITY = 0.30
export GPL_ROUTABILITY_DRIVEN = 0

export FLOW_VARIANT = base

export SYNTH_MEMORY_MAX_BITS = 50000

export GPL_TIMING_DRIVEN = 0
export GPL_ROUTABILITY_DRIVEN = 0

export SKIP_INCREMENTAL_REPAIR = 1
export SKIP_GATE_CLONING = 1
export SKIP_RESIZER = 1


export SKIP_INCREMENTAL_REPAIR = 1
export SKIP_RESIZER = 1
export SKIP_CTS_REPAIR_TIMING = 1


export SKIP_RESIZER = 1
export SKIP_RESIZER_DESIGN = 1
export GPL_TIMING_DRIVEN = 0
export GPL_ROUTABILITY_DRIVEN = 0
export SKIP_RESIZER_DESIGN = 1
