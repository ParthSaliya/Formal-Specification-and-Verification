/*
Name: Parth Hareshbhai Saliya
Marticulation Number: 1340219
*/
#define N 4
mtype = {start, done};
chan hello_channel = [0] of {mtype};
chan world_channel = [0] of {mtype};

proctype P(chan channel){
    byte i;

    for(i: 1 .. N) {
        channel ? start;
        printf("Hello");
        channel ! done;
    }
}

proctype Q(chan channel) {
    byte i;

    for(i: 1 .. N){
        channel ? start;
        printf("World\n");
        channel ! done;
    }
}

proctype R(chan channel_1, channel_2) {
    byte i;

    for(i: 1 .. N){
        channel_1 ! start;
        channel_1 ? done;
        channel_2 ! start;
        channel_2 ? done;
     }
}

init {
    run P(hello_channel);
	run Q(world_channel);
    run R(hello_channel, world_channel);
}