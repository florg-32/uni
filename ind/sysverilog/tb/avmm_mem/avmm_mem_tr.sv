//=============================================================================
// Project  : Industrial HW Verification
//
// File Name: avmm_mem_tr.sv
//
//
// Version:   1.0
//
//=============================================================================
// Description: Sequence item for avmm_sequencer
//=============================================================================

`ifndef AVMM_MEM_TR_SV
`define AVMM_MEM_TR_SV

class avmm_mem_tr extends avmm_tr;

  `uvm_object_utils(avmm_mem_tr)

  // --------------------------------------------------------------------------
  // TODO: Add constraints to meet coverage
  // --------------------------------------------------------------------------
  constraint c_operation { (read | write) == 1; };
  constraint c_wrdata { writedata <= 255; }
  // --------------------------------------------------------------------------
  // END TODO
  // --------------------------------------------------------------------------

endclass : avmm_mem_tr


`endif // AVMM_MEM_TR_SV
