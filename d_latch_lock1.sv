module d_latch_lock1(input logic d, we, output logic q);
	logic a;
	or g1 (a, d, we);
	d_latch l1 (d, a, q);
endmodule
