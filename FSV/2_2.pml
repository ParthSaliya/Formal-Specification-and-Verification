byte j = 0;
active [2] proctype P() {
    byte temp, i;
    i = 1;
    do
        :: i < 10 -> temp = j; temp++; j = temp; i++; printf("%d\n", j);
        :: else -> break
    od
}