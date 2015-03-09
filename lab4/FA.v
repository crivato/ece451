// Verilog Full Adder Description for ECE451

module FA (a_in, b_in, c_in, clk, sum_out, carry_out);
input a_in, b_in, c_in, clk;
output sum_out, carry_out;
reg a, b, c, s1, so, c1, c2, co, sum_out, carry_out;

always @(posedge clk)		// register inputs
	begin
		a = a_in;
		b = b_in;
		c = c_in;
	end
always @(a or b or c)		// combinational logic
	begin
		c1 = a & b;
		s1 = a ^ b;
		c2 = s1 & c;
		so = s1 ^ c;
		co = c1 | c2;
	end
always @(posedge clk)		// register outputs
	begin
		carry_out = co;
		sum_out = so;
	end
endmodule
