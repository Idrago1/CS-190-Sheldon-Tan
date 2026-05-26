export DESIGN_NAME = tpu_logic_sram_top
export PLATFORM    = nangate45

export VERILOG_INCLUDE_DIRS = \
$(DESIGN_HOME)/$(PLATFORM)/tpu_logic_sram

export VERILOG_FILES = \
$(DESIGN_HOME)/$(PLATFORM)/tpu_logic_sram/top.v \
$(DESIGN_HOME)/$(PLATFORM)/tpu_logic_sram/systolic.v \
$(DESIGN_HOME)/$(PLATFORM)/tpu_logic_sram/addr_sel.v \
$(DESIGN_HOME)/$(PLATFORM)/tpu_logic_sram/quantize.v \
$(DESIGN_HOME)/$(PLATFORM)/tpu_logic_sram/SRAM_32x128_1rw.v

export SDC_FILE = $(DESIGN_HOME)/$(PLATFORM)/tpu_logic_sram/constraint.sdc

export ADDITIONAL_LEFS = \
$(DESIGN_HOME)/$(PLATFORM)/tpu_logic_sram/SRAM_32x128_1rw.lef

export ADDITIONAL_LIBS = \
$(DESIGN_HOME)/$(PLATFORM)/tpu_logic_sram/SRAM_32x128_1rw_TT_1p0V_25C.lib

export DIE_AREA = 0 0 2000 2000
export CORE_AREA = 100 100 1900 1900

export GPL_TIMING_DRIVEN = 0
export GPL_ROUTABILITY_DRIVEN = 0
export PLACE_DENSITY = 0.10

export FLOW_VARIANT = base

export SKIP_GATE_RESIZING = 1
export SKIP_REPAIR_DESIGN = 1
export SKIP_RESIZE = 1
export SKIP_INCREMENTAL_REPAIR = 1
export SKIP_RESIZER_DESIGN = 1

export SKIP_RESIZER = 1

