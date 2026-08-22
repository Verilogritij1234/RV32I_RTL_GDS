# divider.sdc
# Define a 100 MHz clock (10.0 nanosecond period)
create_clock -name clk -period 10.0 [get_ports clk]

# Tell the tool to expect some slight real-world delays on inputs and outputs
set_input_delay  2.0 -clock clk [all_inputs]
set_output_delay 2.0 -clock clk [all_outputs]