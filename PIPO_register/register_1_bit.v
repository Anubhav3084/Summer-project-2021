`timescale 1ns / 1ps

/*----------------------------------------------------------
* 1-bit parallel in parallel out register
* Asynchronous reset
* If (load = 1) => data_out = data_in
    else latch
-----------------------------------------------------------*/

module register_1_bit(data_in, clk, reset, load, data_out);

	input data_in, clk, reset, load;
	
	output data_out;
	
	wire D;
	
	MUX_2_to_1 mux(
	.I0(data_out),
	.I1(data_in),
	.S(load),
	.Y(D)
	);
	
	DFF dff (
	.D(D),
	.clk(clk),
	.reset(reset),
	.Q(data_out)
	);

endmodule
