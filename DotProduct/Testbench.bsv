package Testbench;

import Vector::*;
import GetPut::*;
import ClientServer::*;

import Sys_Configs::*;

import DotProduct::*;

(* synthesize *)
module mkTestbench (Empty);

    DotProduct_IFC #(16, Int #(32)) dotproduct <- mkDotProduct ();

    Reg #(Int #(8)) rg_pc <- mkReg (0);

    rule rl_step;
        rg_pc <= rg_pc + 1;
    endrule: rl_step

    rule rl_feed_inputs (rg_pc < 16);
        dotproduct.request.put (tuple2 (10, 20));
        $display ("%0d: rl_feed_inputs", cur_cycle);
    endrule: rl_feed_inputs

    rule rl_drain_outputs;
        let c <- dotproduct.response.get ();
        $display ("%0d: rl_drain_outputs, c = %0d", cur_cycle, c);
        if (c == 3200) $finish (0);
    endrule: rl_drain_outputs

endmodule: mkTestbench

endpackage: Testbench