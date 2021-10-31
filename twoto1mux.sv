module twoto1mux (input logic D0, D1, s, output logic y); 

	assign y = s?D1:D0;
	
endmodule
