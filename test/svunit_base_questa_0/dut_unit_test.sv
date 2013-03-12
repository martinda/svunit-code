import svunit_pkg::*;

`include "svunit_defines.svh"
`include "dut.sv"
typedef class c_dut_unit_test;

module dut_unit_test;
  c_dut_unit_test unittest;
  string name = "dut_ut";

  function void setup();
    unittest = new(name);
  endfunction
endmodule

class c_dut_unit_test extends svunit_testcase;

  //===================================
  // This is the class that we're 
  // running the Unit Tests on
  //===================================
  dut my_dut;


  //===================================
  // Constructor
  //===================================
  function new(string name);
    super.new(name);

    `INFO("Use the INFO macro");
    `ERROR("Use the ERROR macro");
  endfunction


  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    my_dut = new(/* New arguments if needed */);
    /* Place Setup Code Here */
  endtask


  //===================================
  // This is where we run all the Unit
  // Tests
  //===================================
  task run_test();
    super.run_test();

  endtask


  //===================================
  // Here we deconstruct anything we 
  // need after running the Unit Tests
  //===================================
  task teardown();
    super.teardown();
    `FAIL_IF(1);
  endtask

  `SVUNIT_TESTS_BEGIN

  `SVTEST(strictly_so_the_teardown_is_called)
  `SVTEST_END(strictly_so_the_teardown_is_called)

  `SVUNIT_TESTS_END

endclass


