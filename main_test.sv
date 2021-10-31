module main_test();
	reg [8:0]in;
	reg rst;
	
	main dut(in[8:0], rst);
	
	initial begin
		in = 9'b0; rst = 0;
		#20 in = 9'b0_0000_0001; rst = 0;
		#20 in = 9'b0_0000_0100; rst = 0;
		#20 in = 9'b0_0101_0101; rst = 0;
		#20 in = 9'b0_0110_0111; rst = 0;
		#20 in = 9'b1_1100_0001; rst = 0;
		#20 in = 9'b1_0110_1001; rst = 0;
		#20 in = 9'b0_1111_0101; rst = 0;
		#20 in = 9'b1_1110_0111; rst = 0;
		#20 $finish;
	end
endmodule
