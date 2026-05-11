export DESIGN_NAME = systolic_core
export PLATFORM = nangate45

export VERILOG_FILES = $(wildcard $(DESIGN_HOME)/$(PLATFORM)/systolic_core/*.v)

export CLOCK_PORT = clk
export CLOCK_PERIOD = 25

export SDC_FILE = $(DESIGN_HOME)/$(PLATFORM)/systolic_core/constraint.sdc

export DIE_AREA = 0 0 200 200
export CORE_AREA = 20 20 180 180
