/***********************************************************************
 * A SystemVerilog top-level netlist to connect testbench to DUT
 **********************************************************************/

module top;

  // user-defined types are defined in instr_register_pkg.sv
  import instr_register_pkg::*;

  // clock variables
  logic clk;
  logic test_clk;
  
  tb_ifc arithmetic_if(clk);

  // instantiate testbench and connect ports
  instr_register_test test (
    .arithmetic_if(arithmetic_if)
   );

  // instantiate design and connect ports
  instr_register dut (
    .clk     (clk),
    .load_en          ( arithmetic_if.load_en          ),
    .reset_n          ( arithmetic_if.reset_n          ),
    .operand_a        ( arithmetic_if.operand_a        ),
    .operand_b        ( arithmetic_if.operand_b        ),
    .opcode           ( arithmetic_if.opcode           ),
    .write_pointer    ( arithmetic_if.write_pointer    ),
    .read_pointer     ( arithmetic_if.read_pointer     ),
    .instruction_word ( arithmetic_if.instruction_word )
   );

  // clock oscillators
  initial begin
    clk <= 0;
    forever #5  clk = ~clk;
  end

  initial begin
    test_clk <=0;
    // offset test_clk edges from clk to prevent races between
    // the testbench and the design
    #4 forever begin
      #2ns test_clk = 1'b1;
      #8ns test_clk = 1'b0;
    end
  end

endmodule: top
