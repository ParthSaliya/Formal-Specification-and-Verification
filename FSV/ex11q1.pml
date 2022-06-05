#define N 100
mtype = {BROKEN, REPAIRED};
chan customer_mover = [0] of {mtype};
chan mover_repairservice = [0] of {mtype};

int sent_item = 0;

active proctype Customer(){
    int fixed = 0, not_fixed = 0;
    mtype recevied_item
    do
        :: sent_item > N -> goto evaluate_result
        :: customer_mover!BROKEN -> sent_item++;
        :: customer_mover?recevied_item -> atomic {
                                                    if
                                                    ::recevied_item == BROKEN -> not_fixed++
                                                    ::recevied_item == REPAIRED -> fixed++
                                                    fi
                                                }
        
    od;
     evaluate_result: assert(fixed>not_fixed    )
}
active proctype RepairService () {
    mtype collected_item
    do
        ::mover_repairservice?collected_item -> atomic{
                                                        if
                                                            :: mover_repairservice!REPAIRED
                                                            :: mover_repairservice!REPAIRED
                                                            :: mover_repairservice!REPAIRED
                                                            :: mover_repairservice!BROKEN

                                                        fi
                                                    }
        :: sent_item > N -> break
    od;

}
active proctype Mover() {
mtype item;
    do
        :: customer_mover?item -> mover_repairservice!item;
        :: mover_repairservice?item -> customer_mover!item;
    od;
}