int a;
active proctype P() {
    int b;
    do
        :: select(b : 1..3) -> 
        if
            :: a > 0 -> a = a - b; printf("a : %d\n", a);
            :: else -> a = a + b; printf("a : %d\n", a);
        fi
    od
}