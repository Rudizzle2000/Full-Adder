

// Emulates a 1-bit full adder with 1-bit output.
// Inputs:
// 		1-bit input A.
//			1-bit input B.
//			1-bit cin value

// Ouputs:
//			Calulation 1-bit "sum"
//			Transfer 1-bit "cout"
module fullAdder (a, b, cin, sum, cout);

	input logic a, b;
	input logic cin;
	output logic sum;
	output logic cout;
	
	assign sum = a ^ b ^ cin;
	assign cout = ((a ^ b) & cin) | (a & b);

endmodule 

// Provides all test cases to test this 1-bit full adder.
module fullAdder_testbench();

	logic a, b, sum, cin, cout;
	
	fullAdder dut (.a, .b, .cin, .sum, .cout);
	
	initial begin
	
		a=4'b0; b=4'b0; cin=0; #10;//0  00
		a=4'b0; b=4'b1; cin=0; #10;//1  01
		a=4'b1; b=4'b0; cin=0; #10;//1  01
		a=4'b1; b=4'b1; cin=0; #10;//2  10
		
		$stop;
	end
	
endmodule		
	

