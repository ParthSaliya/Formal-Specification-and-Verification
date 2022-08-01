mtype { SENTENCE, DENY, CONFESS };
chan rooms[2] = [0] of { mtype, byte };

proctype prisoner(byte i) {
    mtype v;
    byte years;

    if
        :: rooms[i] ! CONFESS -> printf("Prisoner %d confessed.\n", i);
        :: rooms[i] ! DENY; printf("Prisoner %d denied.\n", i);
    fi;

    rooms[i] ? SENTENCE, years;

    printf("Prisoner %d was sentenced to %d years of detention.\n", i, years);

}

proctype policeman() {
    mtype m1, m2;
    byte v1, v2;
    rooms[0] ? m1, 0;
    rooms[1] ? m2, 0;

    if
        :: m1 == CONFESS && m2 == CONFESS -> v1 = 5; v2 = 5;
        :: m1 == CONFESS && m2 == DENY -> v1 = 0; v2 = 20;
        :: m1 == DENY && m2 == CONFESS -> v1 = 20; v2 = 0;
        :: m1 == DENY && m2 == DENY -> v1 = 1; v2 = 1;
    fi

    printf("Sentence decided.\n")
    rooms[0] ! SENTENCE, v1;
    rooms[1] ! SENTENCE, v2;


}

init {
run policeman();
run prisoner(0);
run prisoner(1);
}
