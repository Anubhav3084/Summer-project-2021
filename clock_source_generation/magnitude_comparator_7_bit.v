`timescale 1ns / 1ps

module magnitude_comparator_7_bit(A, B, gt, lt, eq);

	input[6:0] A, B;
	
	output gt, lt, eq;
	
	wire [6:0] x, y, z;
	
	magnitude_comparator_1_bit bit_0(
	.A(A[0]),
	.B(B[0]),
	.gt(y[0]),
	.lt(z[0]),
	.eq(x[0])
	);
	
	magnitude_comparator_1_bit bit_1(
	.A(A[1]),
	.B(B[1]),
	.gt(y[1]),
	.lt(z[1]),
	.eq(x[1])
	);
	
	magnitude_comparator_1_bit bit_2(
	.A(A[2]),
	.B(B[2]),
	.gt(y[2]),
	.lt(z[2]),
	.eq(x[2])
	);
	
	magnitude_comparator_1_bit bit_3(
	.A(A[3]),
	.B(B[3]),
	.gt(y[3]),
	.lt(z[3]),
	.eq(x[3])
	);
	
	magnitude_comparator_1_bit bit_4(
	.A(A[4]),
	.B(B[4]),
	.gt(y[4]),
	.lt(z[4]),
	.eq(x[4])
	);
	
	magnitude_comparator_1_bit bit_5(
	.A(A[5]),
	.B(B[5]),
	.gt(y[5]),
	.lt(z[5]),
	.eq(x[5])
	);
	
	magnitude_comparator_1_bit bit_6(
	.A(A[6]),
	.B(B[6]),
	.gt(y[6]),
	.lt(z[6]),
	.eq(x[6])
	);
	
// Equality 
	
	and and_1 (eq, x[6], x[5], x[4], x[3], x[2], x[1], x[0]);
	
//	Greater A > B
	
	and and_2 (t1, x[6], y[5]);
	and and_3 (t2, x[6], x[5], y[4]);
	and and_4 (t3, x[6], x[5], x[4], y[3]);
	and and_5 (t4, x[6], x[5], x[4], x[3], y[2]);
	and and_6 (t5, x[6], x[5], x[4], x[3], x[2], y[1]);
	and and_7 (t6, x[6], x[5], x[4], x[3], x[2], x[1], y[0]);
	
	or or_1 (gt, y[6], t1, t2, t3, t4, t5, t6);
	
// Lesser A < B	
	
	and and_22 (p1, x[6], z[5]);
	and and_33 (p2, x[6], x[5], z[4]);
	and and_44 (p3, x[6], x[5], x[4], z[3]);
	and and_55 (p4, x[6], x[5], x[4], x[3], z[2]);
	and and_66 (p5, x[6], x[5], x[4], x[3], x[2], z[1]);
	and and_77 (p6, x[6], x[5], x[4], x[3], x[2], x[1], z[0]);
	
	or or_2 (lt, z[6], p1, p2, p3, p4, p5, p6);
	
endmodule

















