`timescale 1ns / 1ps

/*----------------------------------------------------------
* D flip-flop with asynchronous reset
* At posedge of clock Q = D 
    else latch
-----------------------------------------------------------*/

module DFF(D, clk, reset, Q);

	input D, clk, reset;
	
	output Q;
	
	wire inv_clk, D2;
	
	not not_1 (inv_clk, clk);
	
	D_latch master (
	.D(D),
	.En(inv_clk),
	.reset(reset),
	.Q(D2)
	);
	
	D_latch slave (
	.D(D2),
	.En(clk),
	.reset(reset),
	.Q(Q)
	);

endmodule
