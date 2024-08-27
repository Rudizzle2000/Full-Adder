

// Emulates a variable full adder.
// Inputs: A, B, 1-bit cin value

// Ouputs:
//			Calulation "sum"
//			Overflow flag

module varAdder #(parameter WIDTH = 4)(A, B, Cin, Sum, Overflow);
	
	input logic [WIDTH:0] A, B;
	input logic Cin;
	
	output logic [WIDTH:0] Sum;
	output logic Overflow;
	logic [WIDTH + 1:0] Carries;

	// Using a generate statment to verify the design and quickly emulate the chain I/O relationship with single bit Full adder module "FullAdder"
	genvar i;
	generate 
		for (i=0; i < WIDTH + 1; i++) begin : subadder
			// Instantiates the fullAdder module
			fullAdder fa (.a(A[i]), .b(B[i]), .cin(Carries[i]), .sum(Sum[i]), .cout(Carries[i+1]));
		end
	endgenerate
	
	assign Carries[0] = Cin;
	assign Overflow = Sum[4] & Sum[3] & Sum[2] & Sum[1] & Sum[0];
	
endmodule 


// Verifies the functionality of the design of the varAdder module. Generates all 
// 1 - 255 combinations for inputs A and B with cin = 1. 
module varAdder_testbench();

	parameter WIDTH = 4;

	logic [WIDTH:0] A, B;
	logic Cin, Overflow;
	logic [WIDTH:0] Sum;
	
	// Instantiates the VarAdder module
	varAdder #(WIDTH) dut (.A, .B, .Cin, .Sum, .Overflow);
	
	initial begin
	
		Cin=1'b1; #10;
		
		for (int i = 0; i < 2**WIDTH; i++) begin
			A = i;
			
			for (int j = 0; j < 2**WIDTH; j++) begin
				B = j; #10;
			end
		end
		
		$stop;
	end
	
endmodule	