chan rendezvous = [0] of {byte}
active proctype P1() {
    byte i; 
    do
        :: i < 10 -> rendezvous ! i; i++
        :: else -> break
    od
}

active proctype P2() {
    byte i;
    do
        :: rendezvous ? i -> printf("%d\n", i);             
            if
                :: i == 9 -> break
                :: else -> skip
            fi
    od
}