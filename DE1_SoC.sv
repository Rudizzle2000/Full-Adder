

// Emulates a 4-bit full adder with 5-bit output.
// Inputs:
// 		Switch 1-4 are for 4-bit input A.
//			Switch 5-8 are for 4-bit input B.

// Ouputs:
//			LEDR 0-5 display the sum of the calulation in binary.
//			HEX 0-5 are used to display the values chosen and the sum. HEX 0-1 For input a. HEX 2-4 for input B. HEX 5-6 for Sum.
module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	parameter WIDTH = 4;

	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [5:0] LEDR;
	input logic [3:0] KEY;
	input logic [8:0] SW;
	
	logic [WIDTH:0] a;
	logic [WIDTH:0] b;
	logic [WIDTH:0] sum;
	logic cout;
	logic cin;
	
	// Assigns Switch 0 to variable cin
	assign cin = SW[0];
	
	// Assigns Switch(1-4) to bits 0-3 of variable a
	assign a[0] = SW[1];
	assign a[1] = SW[2];
	assign a[2] = SW[3];
	assign a[3] = SW[4];
	assign a[4] = 1'b0;
	
	// Assigns Switch(5-8) to bits 0-3 of variable b
	assign b[0] = SW[5];
	assign b[1] = SW[6];
	assign b[2] = SW[7];
	assign b[3] = SW[8];
	assign b[4] = 1'b0;

	// Assigns sum bits(0-4) to LEDR (0-4)
	assign LEDR[0] = sum[0];
	assign LEDR[1] = sum[1];
	assign LEDR[2] = sum[2];
	assign LEDR[3] = sum[3];
	assign LEDR[4] = sum[4];
	
	assign LEDR[5] = cout;
	
	// Variable Full Adder Instantiation
	varAdder #(WIDTH) VAR(.A(a), .B(b), .Cin(cin), .Sum(sum), .Overflow(cout));
	
	// Hex Display Instantiation
	hexDisplay HEX_D(.inputA(a), .inputB(b), .outputSum(sum), .cout(cout), .HEX5(HEX5), .HEX4(HEX4), .HEX3(HEX3), .HEX2(HEX2), .HEX1(HEX1), .HEX0(HEX0));
	
	
endmodule 


// Verifies the functionality of the design of DE1_SoC. Generates all 
// combinations for switches 0 through 8 and disfunctions switch 9. 
module DE1_SoC_testbench();

	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [5:0] LEDR;
	logic [3:0] KEY;
	logic [8:0] SW;
	
	// puts devices under test
	DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);
	
	integer i;
	initial begin 

		SW[9] = 1'b0;
		for (i = 0; i < 2**9; i++) begin
			SW[8 : 0] = i; #10;
		end
	
	end
endmodule

