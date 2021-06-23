`timescale 1ns / 1ps

module clock_source(clk, reset, Fsw, Fsw_bar);

	input clk, reset;
	output Fsw, Fsw_bar;
	
	reg count = 1;
	
	wire [5:0] cnt_6_bit_val;
	wire rst_cnt_1, rst_1;
	
	reg [5:0]pres6 = 6'b110010;

//-----------------------------------------------------------------------------------------------
// Generation of Fsw clock source
//-----------------------------------------------------------------------------------------------

	or or_1 (rst_1, rst_cnt_1, reset);	// when count == pres6 or reset = 1 then reset counter
	
	counter_6_bit count_6_bit_1 (		// counter 
	.count(count), 
	.clk(clk),
	.reset(rst_1),
	.out(cnt_6_bit_val)
	);
	
// checking for count == presc6 and generating signal for switch

	xnor xnor_Fsw_1 (t1, pres6[0], cnt_6_bit_val[0]);
	xnor xnor_Fsw_2 (t2, pres6[1], cnt_6_bit_val[1]);
	xnor xnor_Fsw_3 (t3, pres6[2], cnt_6_bit_val[2]);
	xnor xnor_Fsw_4 (t4, pres6[3], cnt_6_bit_val[3]);
	xnor xnor_Fsw_5 (t5, pres6[4], cnt_6_bit_val[4]);
	xnor xnor_Fsw_6 (t6, pres6[5], cnt_6_bit_val[5]);
	
	and and_1 (switch_Fsw, t1, t2, t3, t4, t5, t6);

// resetting counter when switch_Fsw flag is toggled	

	MUX_2_to_1 mux1(
	.I0(1'b0),
	.I1(1'b1),
	.S(switch_Fsw),
	.Y(rst_cnt_1)
	);
	
// generating Fsw

// taking care of reset signal with Fsw
	
	not not_1 (Fsw_b, Fsw);
	not not_2 (reset_bar, reset);
	
	and and_2 (I0_1, Fsw, reset_bar);
	and and_3 (I1_1, Fsw_b, reset_bar);

// If switch_Fsw flag is set then we toggle Fsw else latch

	MUX_2_to_1 mux2(
	.I0(I0_1),
	.I1(I1_1),
	.S(switch_Fsw),
	.Y(Fsw)
	);
	
//-----------------------------------------------------------------------------------------------
// Generation of Fsw_bar clock source
//-----------------------------------------------------------------------------------------------

	wire [5:0] cnt_6_bit_val_2;
	wire [2:0] cnt_3_bit_val;
	
	wire rst_cnt_2, rst_2, count_begin;
	
	reg [2:0]pres3 = 3'b101;
	
	counter_3_bit count_3_bit_ (		// counter 
	.count(count), 
	.clk(clk),
	.reset(reset),
	.out(cnt_3_bit_val)
	);

	xnor xnor_1 (p1, pres3[0], cnt_3_bit_val[0]);
	xnor xnor_2 (p2, pres3[1], cnt_3_bit_val[1]);
	xnor xnor_3 (p3, pres3[2], cnt_3_bit_val[2]);
	
	and and_4 (count_begin, p1, p2, p3);
	
	and and_5 (mux_in, reset_bar, start);
	
	MUX_2_to_1 mux3(
	.I0(mux_in),
	.I1(1'b1),
	.S(count_begin),
	.Y(start)
	);
	
	or or_2 (rst_2, rst_cnt_2, reset);	// when count == pres6 or reset = 1 then reset counter
	
	counter_6_bit count_6_bit_2 (		// counter 
	.count(start), 
	.clk(clk),
	.reset(rst_2),
	.out(cnt_6_bit_val_2)
	);
// checking for count == presc6 and generating signal for switch

	xnor xnor_Fsw_bar_1 (q1, pres6[0], cnt_6_bit_val_2[0]);
	xnor xnor_Fsw_bar_2 (q2, pres6[1], cnt_6_bit_val_2[1]);
	xnor xnor_Fsw_bar_3 (q3, pres6[2], cnt_6_bit_val_2[2]);
	xnor xnor_Fsw_bar_4 (q4, pres6[3], cnt_6_bit_val_2[3]);
	xnor xnor_Fsw_bar_5 (q5, pres6[4], cnt_6_bit_val_2[4]);
	xnor xnor_Fsw_bar_6 (q6, pres6[5], cnt_6_bit_val_2[5]);
	
	and and_6 (switch_Fsw_bar, q1, q2, q3, q4, q5, q6);

// resetting counter when switch_Fsw flag is toggled	

	MUX_2_to_1 mux4(
	.I0(1'b0),
	.I1(1'b1),
	.S(switch_Fsw_bar),
	.Y(rst_cnt_2)
	);
	
// generating Fsw

// taking care of reset signal with Fsw
	
	not not_3 (Fsw_bar_b, Fsw_bar);
	
	and and_7 (I0_2, Fsw_bar, reset_bar);
	and and_8 (I1_2, Fsw_bar_b, reset_bar);

// If switch_Fsw flag is set then we toggle Fsw else latch

	MUX_2_to_1 mux5(
	.I0(I0_2),
	.I1(I1_2),
	.S(switch_Fsw_bar),
	.Y(Fsw_bar)
	);


endmodule 
 