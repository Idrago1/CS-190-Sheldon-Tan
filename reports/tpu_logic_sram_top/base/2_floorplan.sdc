###############################################################################
# Created by write_sdc
###############################################################################
current_design tpu_logic_sram_top
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 25.0000 [get_ports {clk}]
set_input_delay 0.0000 -add_delay [get_ports {clk}]
set_input_delay 0.0000 -add_delay [get_ports {rst_n}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[0]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[10]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[11]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[12]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[13]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[14]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[15]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[16]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[17]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[18]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[19]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[1]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[20]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[21]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[22]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[23]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[24]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[25]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[26]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[27]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[28]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[29]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[2]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[30]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[31]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[3]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[4]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[5]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[6]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[7]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[8]}]
set_output_delay 0.0000 -add_delay [get_ports {debug_out[9]}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
