`timescale 1ns / 1ps

/*---------------------------------------------------
* T flip-flop (positive edge triggered)
* Implemented using D latch, master slave method
* If (reset = 1) => Q = 0
* else at positive edge of clock => Q = ~Q;
---------------------------------------------------*/

module TFF(T, clk, reset, Q);

	input T, clk, reset;
	output Q;
	
	wire inv_clk, D1, D2;
	
	not not_1 (inv_clk, clk);
	
	xor xor_1 (D1, T, Q);
	
	D_latch master (
	.D(D1),
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
