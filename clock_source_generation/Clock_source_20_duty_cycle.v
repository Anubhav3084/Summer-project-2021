`timescale 1ns / 1ps

module Clock_source_20_duty_cycle(start, clk, reset, Fsw);

	input clk, reset, start;
	output Fsw;
	
	wire [6:0] cnt_7_bit_val;
	wire rst_cnt_1, rst_1;
	
	reg [6:0]pres7_1 = 7'b1001111;
	reg [6:0]pres7_2 = 7'b1100100;

//-----------------------------------------------------------------------------------------------
// Generation of Fsw clock source
//-----------------------------------------------------------------------------------------------

	or or_1 (rst_1, rst_cnt_1, reset);	// when count == pres6 or reset = 1 then reset counter
	
	counter_7_bit count_7_bit_1 (		// counter 
	.count(start), 
	.clk(clk),
	.reset(rst_1),
	.out(cnt_7_bit_val)
	);
	
// checking for count == presc7_2 and generating signal for switch

	xnor xnor_F_11 (p1, pres7_2[0], cnt_7_bit_val[0]);
	xnor xnor_F_22 (p2, pres7_2[1], cnt_7_bit_val[1]);
	xnor xnor_F_33 (p3, pres7_2[2], cnt_7_bit_val[2]); 
	xnor xnor_F_44 (p4, pres7_2[3], cnt_7_bit_val[3]); 
	xnor xnor_F_55 (p5, pres7_2[4], cnt_7_bit_val[4]);
	xnor xnor_F_66 (p6, pres7_2[5], cnt_7_bit_val[5]);
	xnor xnor_F_77 (p7, pres7_2[6], cnt_7_bit_val[6]);
	
	and and_2 (switch_F_2, p1, p2, p3, p4, p5, p6, p7);
	
	MUX_2_to_1 mux1(
	.I0(1'b0),
	.I1(1'b1),
	.S(switch_F_2),
	.Y(rst_cnt_1)
	);	
	
	magnitude_comparator_7_bit comp(
	.A(cnt_7_bit_val),
	.B(pres7_1),
	.gt(Fsw),
	.lt(abc),	// not required
	.eq(efg)	// not required
	);
	
	
endmodule
