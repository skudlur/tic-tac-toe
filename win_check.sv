module win_check(input logic [8:0]d, output logic y);
	logic [7:0]a;
	
	and g1 (a[0], d[0], d[1], d[2]);
	and g2 (a[1], d[3], d[4], d[5]);
	and g3 (a[2], d[6], d[7], d[8]);
	and g4 (a[3], d[0], d[3], d[6]);
	and g5 (a[4], d[1], d[4], d[7]);
	and g6 (a[5], d[2], d[5], d[8]);
	and g7 (a[6], d[0], d[4], d[8]);
	and g8 (a[7], d[2], d[4], d[6]);
	
	or g9 (y, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
endmodule
