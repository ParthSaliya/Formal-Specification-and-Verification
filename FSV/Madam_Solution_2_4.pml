/*
Name: Parth Hareshbhai Saliya
Marticulation Number: 1340219
*/
#define N 4
mtype = {start, done};
chan hello_channel = [0] of {mtype};
chan world_channel = [0] of {mtype};

active proctype P(){
    byte i;

    for(i: 1 .. N) {
        hello_channel ? start;
        printf("Hello");
        hello_channel ! done;
    }
}

active proctype Q() {
    byte i;

    for(i: 1 .. N){
        world_channel ? start;
        printf("World\n");
        world_channel ! done;
    }
}

active proctype R() {
    byte i;

    for(i: 1 .. N){
        hello_channel ! start;
        hello_channel ? done;
        world_channel ! start;
        world_channel ? done;
     }
}