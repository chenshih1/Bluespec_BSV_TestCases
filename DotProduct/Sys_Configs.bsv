package Sys_Configs;

ActionValue #(Bit #(32)) cur_cycle = actionvalue
        Bit #(32) t <- $stime;
        return t / 10;
endactionvalue;

endpackage: Sys_Configs