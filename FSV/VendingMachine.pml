mtype = {SODA, BEER};
chan payment = [0] of { int };
chan supply = [0] of { mtype, int };

proctype Vendor() {
    int coins, cash, beer_bottles, soda_bottles;
    beer_bottles = 5; soda_bottles = 10;
    cash = 0;
    mtype MSG;
    atomic {
        do
                :: payment ? coins ->
                    if 
                        :: (coins == 20 && soda_bottles > 0) -> MSG = SODA; supply ! MSG; soda_bottles--; cash = cash + coins; 
                        :: (coins == 50 && beer_bottles > 0) -> MSG = BEER; supply ! MSG; beer_bottles--; cash = cash + coins; 
                        :: else -> printf("Please insert some coins!!\n");
                    fi
        od;
        printf("Cash collected: %d\n", cash)
    }
}

proctype Customer() {
    int coins;
    mtype MSG;
    atomic {
        do
            :: coins = 20 -> payment ! coins; supply ? MSG; printf("Inserted coins: %d Got: %e\n", coins, MSG);
            :: coins = 50 -> payment ! coins; supply ? MSG; printf("Inserted coins: %d Got: %e\n", coins, MSG);
        od
    }
}

init {
    atomic {
        run Customer();
        run Vendor();
    }
}