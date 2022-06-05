mtype = {MSG};

chan sharing = [1] of {mtype};

proctype P() {

printf("\nProcess %d has started.\n", _pid);

do
        :: sharing?MSG; // Trying to enter
           skip; // Performing critical activity
           sharing!MSG // Exiting critical section
od

}

init {
    sharing!MSG;
    atomic {
      run P();
      run P();
      run P();
    }
}
