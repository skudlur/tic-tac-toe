module d_latch_lock0(input logic d, we, output logic q);
	logic a, b;
	or g1 (a, d, we);
	d_latch l1 (d, a, b);
	not g2 (q, b);
endmodule
