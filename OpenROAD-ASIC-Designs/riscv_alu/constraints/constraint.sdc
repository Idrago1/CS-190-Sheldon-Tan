create_clock [get_ports alu_op[0]] -name clk -period 25
set_input_delay 0 [all_inputs]
set_output_delay 0 [all_outputs]
