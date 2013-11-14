module Adder(x1,x2, sign, s);
	input [12:0] x1;
	input [12:0] x2;
	input [0:0] sign; 
	output [13:0] s;
	wire [12:1] co;
	
	Adder(x1[0],1'b0,x2[0],sign[0],co[1],s[0]); //1
	Adder(x1[1],sign[0],x2[1],co[1],co[2],s[1]);//2
	Adder(x1[2],sign[0],x2[2],co[2],co[3],s[2]);//3
	Adder(x1[3],sign[0],x2[3],co[3],co[4],s[3]);//4
	Adder(x1[4],sign[0],x2[4],co[4],co[5],s[4]);//5
	Adder(x1[5],sign[0],x2[5],co[5],co[6],s[5]);//6
	Adder(x1[6],sign[0],x2[6],co[6],co[7],s[6]);//7
	Adder(x1[7],sign[0],x2[7],co[7],co[8],s[7]);//8
	Adder(x1[8],sign[0],x2[8],co[8],co[9],s[8]);//9
	Adder(x1[9],sign[0],x2[9],co[9],co[10],s[9]);//10
	Adder(x1[10],sign[0],x2[10],co[10],co[11],s[10]);//11
	Adder(x1[11],sign[0],x2[11],co[11],co[12],s[11]);//12
	Adder(x1[12],sign[0],x2[12],co[12],s[13],s[12]);//13
	
	//13 itterations
	
endmodule

module Adder(x1,neg,x2,ci,co,s);
	input x1,x2,ci,neg;
	output co,s;
	
	assign co = (x1^neg)&x2 | (x1^neg)&ci | x2&ci;
	assign s = (x1^neg) ^ x2 ^ ci;
endmodule

