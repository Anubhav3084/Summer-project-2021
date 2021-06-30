`timescale 1ns / 1ps

module magnitude_comparator_1_bit(A, B, gt, lt, eq);

	input A, B;
	output gt, lt, eq;

//	Equality	
	not n_1 (A_b, A);
	not n_2 (B_b, B);
	
	and and_1 (A_eq, A, B);
	and and_2 (A_eq_b, A_b, B_b);
	
	or or_1 (eq, A_eq, A_eq_b);

// A > B
	and and_3 (gt, A, B_b);
	
// A < B
	and and_4 (lt, A_b, B);

endmodule
