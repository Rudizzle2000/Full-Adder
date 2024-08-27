

// Shows the inputs chosen for input A, B and the sum calulated.
// Inputs:
// 		4-bit input A.
//			4-bit input B.
//       5-bit output sum
//       1-bit cout value (overflow)

// Ouputs:
//			HEX 0-5 are used to display the values chosen and the sum. HEX 0-1 For input a. HEX 2-4 for input B. HEX 5-6 for Sum.
 
module hexDisplay (inputA, inputB, outputSum, cout, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);

	input logic cout;
	input logic [3:0]inputA, inputB;
	input logic [4:0] outputSum;
	output logic [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	
	// Define binary representation for 7-seg display
	logic [6:0] nothing = 7'b1111111;
	logic [6:0] zero = 7'b1000000;
	logic [6:0] one = 7'b1111001;
	logic [6:0] two = 7'b0100100;
	logic [6:0] three = 7'b0110000;
	logic [6:0] four = 7'b0011001;
	logic [6:0] five = 7'b0010010;
	logic [6:0] six = 7'b0000010;
	logic [6:0] seven = 7'b1111000;
	logic [6:0] eight = 7'b0000000;
	logic [6:0] nine = 7'b0011000;
	logic [6:0] letter_F = 7'b0001110;
	logic [6:0] letter_U = 7'b1000001;
	logic [6:0] letter_L = 7'b1000111;
	
	// Logic for input A HEX0-1
	always_comb begin
	
		if (cout) begin		HEX1 = letter_L; HEX0 = letter_L; end 
		
		else begin
	
			case (inputA)
					
					0: begin		HEX1 = zero; HEX0 = zero;  end
							
					1: begin		HEX1 = zero; HEX0 = one;    end
							
					2: begin		HEX1 = zero; HEX0 = two;    end
						
					3: begin		HEX1 = zero; HEX0 = three;  end
						
					4: begin		HEX1 = zero; HEX0 = four;   end
							
					5: begin		HEX1 = zero; HEX0 = five;   end			
						
					6: begin		HEX1 = zero; HEX0 = six;    end
							
					7: begin		HEX1 = zero; HEX0 = seven;  end
							
					8: begin		HEX1 = zero; HEX0 = eight;  end
					
					9: begin		HEX1 = zero; HEX0 = nine;   end
							
				  10: begin		HEX1 = one; HEX0 = zero;    end
							
				  11: begin		HEX1 = one; HEX0 = one;     end
						
				  12: begin		HEX1 = one; HEX0 = two;     end
							
				  13: begin		HEX1 = one; HEX0 = three;   end
							
				  14: begin		HEX1 = one; HEX0 = four;    end		
						
				  15: begin		HEX1 = one; HEX0 = five;    end
											 
			endcase
		end
		
	end
	
	// Logic for input B HEX2-3
	always_comb begin
	
		if (cout) begin	HEX3 = letter_F; HEX2 = letter_U; end 
		
		else begin
	
			case (inputB)
					
					0: begin		HEX3 = zero; HEX2 = zero;  end
							
					1: begin		HEX3 = zero; HEX2 = one;    end
							
					2: begin		HEX3 = zero; HEX2 = two;    end
						
					3: begin		HEX3 = zero; HEX2 = three;  end
						
					4: begin		HEX3 = zero; HEX2 = four;   end
							
					5: begin		HEX3 = zero; HEX2 = five;   end			
						
					6: begin		HEX3 = zero; HEX2 = six;    end
							
					7: begin		HEX3 = zero; HEX2 = seven;  end
							
					8: begin		HEX3 = zero; HEX2 = eight;  end
					
					9: begin		HEX3 = zero; HEX2 = nine;   end
							
				  10: begin		HEX3 = one; HEX2 = zero;    end
							
				  11: begin		HEX3 = one; HEX2 = one;     end
						
				  12: begin		HEX3 = one; HEX2 = two;     end
							
				  13: begin		HEX3 = one; HEX2 = three;   end
							
				  14: begin		HEX3 = one; HEX2 = four;    end		
						
				  15: begin		HEX3 = one; HEX2 = five;    end
											 
			endcase
		end
		
	end
	
	// Logic for Output sum HEX4-5
	always_comb begin
	
		if (cout) begin	HEX5 = nothing; HEX4 = nothing; end 
		
		else begin
	
			case (outputSum)
					
					0: begin		HEX5 = zero; HEX4 = zero;  end
							
					1: begin		HEX5 = zero; HEX4 = one;    end
							
					2: begin		HEX5 = zero; HEX4 = two;    end
						
					3: begin		HEX5 = zero; HEX4 = three;  end
						
					4: begin		HEX5 = zero; HEX4 = four;   end
							
					5: begin		HEX5 = zero; HEX4 = five;   end			
						
					6: begin		HEX5 = zero; HEX4 = six;    end
							
					7: begin		HEX5 = zero; HEX4 = seven;  end
							
					8: begin		HEX5 = zero; HEX4 = eight;  end
					
					9: begin		HEX5 = zero; HEX4 = nine;   end
							
				  10: begin		HEX5 = one; HEX4 = zero;    end
							
				  11: begin		HEX5 = one; HEX4 = one;     end
						
				  12: begin		HEX5 = one; HEX4 = two;     end
							
				  13: begin		HEX5 = one; HEX4 = three;   end
							
				  14: begin		HEX5 = one; HEX4 = four;    end		
						
				  15: begin		HEX5 = one; HEX4 = five;    end
				  
				  
				  16: begin		HEX5 = one; HEX4 = six;  end
							
				  17: begin		HEX5 = one; HEX4 = seven;    end
							
				  18: begin		HEX5 = one; HEX4 = eight;    end
						
				  19: begin		HEX5 = one; HEX4 = nine;  end
							
				  20: begin		HEX5 = two; HEX4 = zero;   end
								
				  21: begin		HEX5 = two; HEX4 = one;   end			
							
				  22: begin		HEX5 = two; HEX4 = two;    end
								
				  23: begin		HEX5 = two; HEX4 = three;  end
								
			     24: begin		HEX5 = two; HEX4 = four;  end
						
				  25: begin		HEX5 = two; HEX4 = five;   end
							
				  26: begin		HEX5 = two; HEX4 = six;    end
							
				  27: begin		HEX5 = two; HEX4 = seven;     end
						
				  28: begin		HEX5 = two; HEX4 = eight;     end
							
				  29: begin		HEX5 = two; HEX4 = nine;   end
							
				  30: begin		HEX5 = three; HEX4 = zero;    end		
						
				  31: begin		HEX5 = three; HEX4 = one;    end						 
			endcase
		end
		
	end
	
endmodule 



// Verifies the functionality of the design of the varAdder module. Generates all 
// possible inputs for inputs A, B and outputSum. 
module HEX_Display_testbench();

	logic cout;
	logic [3:0]inputA, inputB;
	logic [4:0] outputSum;
	logic [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	
	// Instantiates the HEX_Display module	
	hexDisplay dut (inputA, inputB, outputSum, cout, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);		

	integer i;
	initial begin 
	
		for (i = 0; i <=15; i++) begin
		
			inputA = i; #10;
			
		end
	
	
		for (i = 0; i <=15; i++) begin
		
			inputB = i; #10;  
			
		end
		
		for (i = 0; i <=31; i++) begin
		
			outputSum = i; #10; 
			
		end
		
		cout = 1; #10;
													 
		$stop;
	end		
			
endmodule

