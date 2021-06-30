`timescale 1ns / 1ps

module clock_source(clk, reset, Fsw, Fsw_bar);

	input clk, reset;
	output Fsw, Fsw_bar;

//-----------------------------------------------------------------------------------------------
// Generation of Fsw clock source
//-----------------------------------------------------------------------------------------------

	Clock_source_20_duty_cycle clk_Fsw (
	.start(1'b1), 
	.clk(clk), 
	.reset(reset), 
	.Fsw(Fsw)
	);
	
//-----------------------------------------------------------------------------------------------
// Generation of Fsw_bar clock source
//-----------------------------------------------------------------------------------------------

	wire [2:0]pres3 = 3'b101;
	wire [2:0]cnt_3_bit_val;
	
	counter_3_bit count_3_bit_ (
	.count(1'b1), 
	.clk(clk),
	.reset(reset),
	.out(cnt_3_bit_val)
	);

	xnor xnor_1 (p1, pres3[0], cnt_3_bit_val[0]);
	xnor xnor_2 (p2, pres3[1], cnt_3_bit_val[1]);
	xnor xnor_3 (p3, pres3[2], cnt_3_bit_val[2]);
	
	and and_4 (count_begin, p1, p2, p3);
	
	not not_1 (reset_bar, reset);
	and and_5 (mux_in, reset_bar, start);
	
	MUX_2_to_1 mux3(
	.I0(mux_in),
	.I1(1'b1),
	.S(count_begin),
	.Y(start)
	);
	
	Clock_source_20_duty_cycle clk_Fsw_bar (
	.start(start), 
	.clk(clk), 
	.reset(reset), 
	.Fsw(Fsw_bar)
	);

endmodule 