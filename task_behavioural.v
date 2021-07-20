

module task_behavioural(reset, clk, fsw, fsw_bar);

	input reset, clk;
	
    output reg fsw = 1'b0;
    output reg fsw_bar = 1'b1;

    reg [6:0]count = 7'd0;
	reg [6:0]pre1 = 7'd80;
	reg [6:0]pre2 = 7'd100;

	always @(posedge clk or posedge reset)
	begin

		if(reset == 1)
		begin
			count <= 0;
			fsw <= 0;
			fsw_bar <= 0;
		end	

      if (count == pre2) count = 0;

		else if(count < pre1)
		begin
			fsw <= 0;
			fsw_bar <= 1;
		end

		else if(count < pre2 && count > pre1)
		begin	
			fsw <= 1;
			fsw_bar <= 0;
		end

		count <= count + 1;

	end

endmodule
