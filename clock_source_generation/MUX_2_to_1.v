`timescale 1ns / 1ps

/*---------------------------------------------------
* 2 to 1 line multiplexer.
* If (S = 1) => Y = I1 else Y = I0
---------------------------------------------------*/

module MUX_2_to_1(I0, I1, S, Y);

	input I0, I1, S;
	output Y;
	
	wire S_bar, temp_0, temp_1;
	
	not not_1 (S_bar, S);
	
	and and_1 (temp_1, I1, S);
	and and_2 (temp_0, I0, S_bar);
	
	or or_1 (Y, temp_1, temp_0);

endmodule
