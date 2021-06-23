# This directory contains all the verilog files that are required to generate the desired clock signal.

# Clock_source is the top module.

# All the codes are written in structural description.
# Counter is used to prescale the clock.
# For delay also a 3-bit counter is used which counts and then activates a flag that start the prescaling counter.

# Input clock is of 100 MHz (in my project)
# Fsw clock is of 1 MHz 
# Fsw_bar clock is of 1 MHz with a delay of 50ns.
