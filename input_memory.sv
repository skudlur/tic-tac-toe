module input_memory (input logic [8:0]latch_in, 
							input logic res, dis,
							output logic state,
							output logic [8:0]A, B);
							
	logic [8:0]latch_q_out, and_out;
	logic [8:0]player_a, player_b;
	logic switch_connect;
	logic disable_out;
	logic reset_latch;
	logic or_out;
	
	//latch locks
	d_latch_lock1 d1 (latch_in[0], res, latch_q_out[0]); //1
	d_latch_lock1 d2 (latch_in[1], res, latch_q_out[1]); //2
	d_latch_lock1 d3 (latch_in[2], res, latch_q_out[2]); //3
	d_latch_lock1 d4 (latch_in[3], res, latch_q_out[3]); //4
	d_latch_lock1 d5 (latch_in[4], res, latch_q_out[4]); //5
	d_latch_lock1 d6 (latch_in[5], res, latch_q_out[5]); //6 
	d_latch_lock1 d7 (latch_in[6], res, latch_q_out[6]); //7
	d_latch_lock1 d8 (latch_in[7], res, latch_q_out[7]); //8
	d_latch_lock1 d9 (latch_in[8], res, latch_q_out[8]); //9
	
	//player selection
	player_select s1 (latch_q_out[0], switch_connect, player_a[0], player_b[0]);
	player_select s2 (latch_q_out[1], switch_connect, player_a[1], player_b[1]);
	player_select s3 (latch_q_out[2], switch_connect, player_a[2], player_b[2]);
	player_select s4 (latch_q_out[3], switch_connect, player_a[3], player_b[3]);
	player_select s5 (latch_q_out[4], switch_connect, player_a[4], player_b[4]);
	player_select s6 (latch_q_out[5], switch_connect, player_a[5], player_b[5]);
	player_select s7 (latch_q_out[6], switch_connect, player_a[6], player_b[6]);
	player_select s8 (latch_q_out[7], switch_connect, player_a[7], player_b[7]);
	player_select s9 (latch_q_out[8], switch_connect, player_a[8], player_b[8]);
	
	//player A memory
	d_latch a1 (player_a[0], disable_out, A[0]);
	d_latch a2 (player_a[1], disable_out, A[1]);
	d_latch a3 (player_a[2], disable_out, A[2]);
	d_latch a4 (player_a[3], disable_out, A[3]);
	d_latch a5 (player_a[4], disable_out, A[4]);
	d_latch a6 (player_a[5], disable_out, A[5]);
	d_latch a7 (player_a[6], disable_out, A[6]);
	d_latch a8 (player_a[7], disable_out, A[7]);
	d_latch a9 (player_a[8], disable_out, A[8]);
	
	//player B memory
	d_latch b1 (player_b[0], disable_out, B[0]);
	d_latch b2 (player_b[1], disable_out, B[1]);
	d_latch b3 (player_b[2], disable_out, B[2]);
	d_latch b4 (player_b[3], disable_out, B[3]);
	d_latch b5 (player_b[4], disable_out, B[4]);
	d_latch b6 (player_b[5], disable_out, B[5]);
	d_latch b7 (player_b[6], disable_out, B[6]);
	d_latch b8 (player_b[7], disable_out, B[7]);
	d_latch b9 (player_b[8], disable_out, B[8]);
	
	//and selection for or operation
	and c1 (and_out[0], ~latch_q_out[0], latch_in[0]);
	and c2 (and_out[1], ~latch_q_out[1], latch_in[1]);
	and c3 (and_out[2], ~latch_q_out[2], latch_in[2]);
	and c4 (and_out[3], ~latch_q_out[3], latch_in[3]);
	and c5 (and_out[4], ~latch_q_out[4], latch_in[4]);
	and c6 (and_out[5], ~latch_q_out[5], latch_in[5]);
	and c7 (and_out[6], ~latch_q_out[6], latch_in[6]);
	and c8 (and_out[7], ~latch_q_out[7], latch_in[7]);
	and c9 (and_out[8], ~latch_q_out[8], latch_in[8]);
	
	//disable gate
	xor x1 (disable_out, reset_latch, dis);
	
	//nine input or
	or o1 (or_out, and_out[0], and_out[1], and_out[2], and_out[3], and_out[4], and_out[5], and_out[6], and_out[7], and_out[8]);
	
	//latches for combining and displaying states
	counter_up x2 (1'b1, or_out, reset_latch, switch_connect);
	d_latch x3 (switch_connect, disable_out, state);
endmodule

