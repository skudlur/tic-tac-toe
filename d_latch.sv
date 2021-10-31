module d_latch(input logic d, en, output logic q, input logic rst);
	always @ (en or rst or d)
	if (!rst)
		q <= 0;
	else
		if (en)
			q <= d;
endmodule
