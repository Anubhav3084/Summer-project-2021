`timescale 1ns / 1ps

/*---------------------------------------------------
* 3-bit synchronized binary counter 
* Active high reset 
---------------------------------------------------*/

module counter_3_bit(count, clk, reset, out, next);

	input count, clk, reset;
	output [2:0]out;
	output next;
	
	wire T2, T3;
	
	TFF tff_1 (
	.T(count),
	.clk(clk),
	.reset(reset),
	.Q(out[0])
	);
	
	and and_1 (T2, count, out[0]);
	
	TFF tff_2 (
	.T(T2),
	.clk(clk),
	.reset(reset),
	.Q(out[1])
	);
	
	and and_2 (T3, count, out[1], out[0]);
	
	TFF tff_3 (
	.T(T3),
	.clk(clk),
	.reset(reset),
	.Q(out[2])
	);
	
	and and_3 (next, count, out[2], out[1], out[0]);

endmodule
