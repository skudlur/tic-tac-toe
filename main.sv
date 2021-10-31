module main(input logic [8:0]in,
				input logic rst);
	
	logic dis;
	logic a_state;
	logic a_state_not;
	logic [8:0]A, B;
	logic win1, win2;
	logic [8:0]red, blue;
	logic [8:0]tie_out;
	logic tie_out_final;
	logic out_led;
	logic winA, winB;
	
	input_memory m1 (in[8:0], rst, dis, a_state, A[8:0], B[8:0]);
	
	assign a_state_not = ~a_state;
	
	RGB_pick r1 (A[0], B[0], red[0], blue[0]);
	RGB_pick r2 (A[1], B[1], red[1], blue[1]);
	RGB_pick r3 (A[2], B[2], red[2], blue[2]);
	RGB_pick r4 (A[3], B[3], red[3], blue[3]);
	RGB_pick r5 (A[4], B[4], red[4], blue[4]);
	RGB_pick r6 (A[5], B[5], red[5], blue[5]);
	RGB_pick r7 (A[6], B[6], red[6], blue[6]);
	RGB_pick r8 (A[7], B[7], red[7], blue[7]);
	RGB_pick r9 (A[8], B[8], red[8], blue[8]);
	
	win_check w1 (A[8:0], win1);
	win_check w2 (B[8:0], win2);
	
	or g1 (tie_out[0], A[0], B[0]);
	or g2 (tie_out[1], A[1], B[1]);
	or g3 (tie_out[2], A[2], B[2]);
	or g4 (tie_out[3], A[3], B[3]);
	or g5 (tie_out[4], A[4], B[4]);
	or g6 (tie_out[5], A[5], B[5]);
	or g7 (tie_out[6], A[6], B[6]);
	or g8 (tie_out[7], A[7], B[7]);
	or g9 (tie_out[8], A[8], B[8]);
	
	and g10 (tie_out_final, tie_out[0], tie_out[1], tie_out[2], tie_out[3], tie_out[4], tie_out[5], tie_out[6], tie_out[7], tie_out[8]);
	
	or g11 (dis, tie_out_final, win1, win2);
	
	or g12 (out_led, win1, win2);
	
	assign win1 = winA;
	assign win2 = winB;
	
endmodule
