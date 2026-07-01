/*
	Simple testbench for the counter.
*/

`timescale 1ns / 1ns // `timescale <time_unit> / <time_precision>

`include "../src/counter.v"

module counter_tb;

  // Testbench signals
  reg clk_tb = 0;
  reg rst_n_tb = 0;
  wire [7:0] count_val_tb;

  // Instantiate the counter module
  counter uut (
      .clk_i(clk_tb),
      .rst_n_i(rst_n_tb),
      .count_o(count_val_tb)
  );

  
  //Generate clock
  /* verilator lint_off STMTDLY */
  always #5 clk_tb = ~clk_tb; // wait 5 time units (e.g. 5ns)
  /* verilator lint_on STMTDLY */

  // Test sequence
  initial begin
		$dumpfile("counter_tb.vcd");
		$dumpvars;
	
		/* verilator lint_off STMTDLY */
		#50 rst_n_tb = 1'b1; // deassert reset
	  #200 $finish; // finish
		/* verilator lint_on STMTDLY */
end

endmodule //counter_tb