proctype IntegerDivision(int dividend, divisor) {
    int quotient, remainder;
    quotient = 0;
    remainder = dividend;

    do
        :: remainder >= divisor -> quotient++; remainder = remainder - divisor;
        :: else -> break
    od

    printf("%d is divided by %d = %d and the remainder is %d\n", dividend, divisor, quotient, remainder);
}

init {
    run IntegerDivision(12, 5);
}