`timescale 1ns / 1ps

/*---------------------------------------------------
* 6-bit synchronized binary counter 
* Active high reset 
---------------------------------------------------*/

module counter_6_bit(count, clk, reset, out, next);

	input count, clk, reset;
	output [5:0]out;
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
	
	and and_3 (T4, count, out[2], out[1], out[0]);
	
	TFF tff_4 (
	.T(T4),
	.clk(clk),
	.reset(reset),
	.Q(out[3])
	);
	
	and and_4 (T5, count, out[3], out[2], out[1], out[0]);
	
	TFF tff_5 (
	.T(T5),
	.clk(clk),
	.reset(reset),
	.Q(out[4])
	);
	
	and and_5 (T6, count, out[4], out[3], out[2], out[1], out[0]);
	
	TFF tff_6 (
	.T(T6),
	.clk(clk),
	.reset(reset),
	.Q(out[5])
	);
	
	and and_6 (next, count, out[5], out[4], out[3], out[2], out[1], out[0]);

endmodule
