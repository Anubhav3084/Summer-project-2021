# This directory contains all the verilog files that are required for 8-bit parallel in parallel out register.

# PIPO_8_bit_register is the top module.

# D_latch is lowest in hierarchy.
# DFF uses D_latch as master and slave to create flip-flop.
# register_1_bit instantiates MUX_2_to_1 and DFF to create 1-bit register.
# PIPO_8_bit_register instantiates 8 copies of register_1_bit to create a 8-bit register.

# All the codes are written in structural description.

# Input clock is of 100 MHz (in my project)
