module counter_up (input logic d, clk, rst, output logic [3:0] counter);
	always @(posedge clk or posedge rst) begin
		if(rst)
			counter <= 4'b0;
		else 
			counter <= counter + 4'b1;
	end
endmodule
