module RAM_8bit
#(parameter WIDTH = 8)
(
	input		wr_en, rd_en, clk,
	input		[(WIDTH / 2):0] addr,		// 4-bit address from MAR
	inout		[WIDTH - 1:0] bus		// 8-bit bidirectional bus
);

reg [WIDTH - 1:0] mem_reg [0:15];		        // Defining 8-bit wide memory with 16 addresses

assign bus = (rd_en) ? mem_reg[addr] : 8'bz;		// Tri-state buffer to disconnect bus if read enable is low

always @ (posedge clk)
	if (wr_en) mem_reg[addr] <= bus;	        // If write enable is high, store bus values in register
endmodule
