`timescale 1ns / 1ps

/*----------------------------------------------------------
* 8-bit parallel in parallel out register
* Asynchronous reset
* If (load = 1) => data_out = data_in
    else latch
-----------------------------------------------------------*/

module PIPO_8_bit_register(clk, reset, load, data_in, data_out);

	input clk, load, reset;
	input [7:0]data_in;
	
	output [7:0]data_out;
	
	register_1_bit bit_0(
	.data_in(data_in[0]),
	.clk(clk),
	.reset(reset),
	.load(load),
	.data_out(data_out[0])
	);
	
	register_1_bit bit_1(
	.data_in(data_in[1]),
	.clk(clk),
	.reset(reset),
	.load(load),
	.data_out(data_out[1])
	);
	
	register_1_bit bit_2(
	.data_in(data_in[2]),
	.clk(clk),
	.reset(reset),
	.load(load),
	.data_out(data_out[2])
	);
	
	register_1_bit bit_3(
	.data_in(data_in[3]),
	.clk(clk),
	.reset(reset),
	.load(load),
	.data_out(data_out[3])
	);
	
	register_1_bit bit_4(
	.data_in(data_in[4]),
	.clk(clk),
	.reset(reset),
	.load(load),
	.data_out(data_out[4])
	);
	
	register_1_bit bit_5(
	.data_in(data_in[5]),
	.clk(clk),
	.reset(reset),
	.load(load),
	.data_out(data_out[5])
	);
	
	register_1_bit bit_6(
	.data_in(data_in[6]),
	.clk(clk),
	.reset(reset),
	.load(load),
	.data_out(data_out[6])
	);
	
	register_1_bit bit_7(
	.data_in(data_in[7]),
	.clk(clk),
	.reset(reset),
	.load(load),
	.data_out(data_out[7])
	);

endmodule
