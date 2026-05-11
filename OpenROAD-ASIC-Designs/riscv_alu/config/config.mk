export DESIGN_NAME = riscv_alu_32bit
export PLATFORM = nangate45

export VERILOG_FILES = $(DESIGN_HOME)/$(PLATFORM)/riscv_alu_32bit/32risc_v_alu.v

export CLOCK_PORT = alu_op[0]
export CLOCK_PERIOD = 25

export SDC_FILE = $(DESIGN_HOME)/$(PLATFORM)/riscv_alu_32bit/constraint.sdc

export DIE_AREA = 0 0 100 100
export CORE_AREA = 10 10 90 90
