module RGB_pick(input logic a,b, output logic y0, y1);
	twoto1mux m1 (8'b0, 8'b1, a, y0);
	twoto1mux m2 (8'b0, 8'b1, b, y1);
endmodule
