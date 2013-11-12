//Really rough initial LCD Display testing

module LCD(LCD_DATA, LCD_RW, LCD_EN, LCD_RS, LCD_ON, LCD_BLON,  KEY);
	input [0:0] KEY;
	output [7:0] LCD_DATA;
	output LCD_RW, LCD_EN, LCD_RS, LCD_ON, LCD_BLON;
	
	//Basic properties.
	assign LCD_ON = 1'b1;
	assign LCD_BLON = 1'b0;
	assign LCD_RW = 1'b0;

	assign LCD_EN = KEY[0];//In sync with the key to "update" the display
	
	reg done = 1'b0;//Input cleared
	reg [7:0] thing = 8'b00000001;//Output bits
	reg thing2 = 1'b0;//Command or data I believe?
	
	always @(negedge KEY[0])
	begin
	if(~done)
	begin
		thing <= 8'b00000001;//Clear screen
		done <= 1'b1;
		thing2 <= 1'b0;
	end
	else
	begin
		thing <= 8'b01000001;//Write a capital 'A' each cycle.
		thing2 <= 1'b1;
	end
	end
	assign LCD_RS = thing2;
	assign LCD_DATA = thing;
endmodule
