/*
Name: Parth Hareshbhai Saliya
Marticulation Number: 1340219
*/

/*Implement a program in PROMELA that prints the first 30 natural numbers (without 0) in 
random order*/

#define N 30
active proctype P() {
	int array[N];
	int product = 1;
	int i = 1;
	int n = 1; 
    bool isExist = false;
	for(i : 0 .. N-1){
		select(n : 1 .. 30)
		printf("i = %d :: n = %d\n", i, n)
        if
            :: i == 0 -> array[0] = n; 
            :: else -> for(i : 0 .. 1){
                if 
                    :: printf("is in else")
                    // :: n == array[i] -> isExist = true;
                    // :: else -> isExist = false;
                fi
                }
        fi
        if
            :: isExist == false -> array[i] = n;
        fi
	}
	for(i in array){
		printf("i = %d :: Element = %d\n", i, array[i])
	}
}