/*
Write a “Hello World” program in PROMELA which has three processes. One 
process prints Hello, another process prints World and the third process ensures that 
the hello process always performs its print statement before the print statement 
associated with the world process. Use two channels to achieve the desired 
behavior. The string “Hello World” should be print 4 times.
*/

chan channel1 = [0] of {byte}
chan channel2 = [0] of {byte}
byte count;
active proctype P() {
    printf("Hello"); count = 1
    do
        :: channel1 ! count; 
    od
}

active proctype Q() {
    printf("Hello"); count = 2
    do
        :: channel1 ! count; 
    od
}

active proctype R() {
    byte i;
    do
        :: channel1 ? count -> printf("%d\n",count)
            if
                :: count == 1 -> break
                :: else -> skip
            fi 
        :: channel2 ? count -> printf("%d\n",count); i++
            if
                :: i == 4 -> break
                :: else -> skip
            fi  
    od
}