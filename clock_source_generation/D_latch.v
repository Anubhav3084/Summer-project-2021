`timescale 1ns / 1ps

/*---------------------------------------------------
* D latch with active high reset
* If (reset = 1) => Q = 0
* else if(En = 1) => Q = D
* else latch
---------------------------------------------------*/

module D_latch(D, En, reset, Q);

	input D, En, reset;
	output Q;
	
	wire D_in, D_in_bar, S, R, Q_bar, En_D;

	reg gnd = 1'b0;

//----  D-latch   ---------------
	not not_1 (D_in_bar, D_in);
	
	and and_1 (R, En_D, D_in_bar);
	and and_2 (S, En_D, D_in);
	
	nor nor_1 (Q, R, Q_bar);
	nor nor_2 (Q_bar, S, Q);

// applying reset
	or or_1 (En_D, reset, En);
	
	MUX_2_to_1 mux (
	.I0(D),
	.I1(gnd),
	.S(reset),
	.Y(D_in)
	);
		
endmodule
 