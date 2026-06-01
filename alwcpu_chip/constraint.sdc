create_clock -period 20 [get_ports clk_pad]

set_input_delay 2 -clock clk_pad [get_ports rst_pad]

set_output_delay 2 -clock clk_pad [all_outputs]
