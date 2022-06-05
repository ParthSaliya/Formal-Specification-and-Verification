/*
Name: Parth Hareshbhai Saliya
Marticulation Number: 1340219
*/

#define N 30
active proctype P() {
	int array[N];
	int i, j;
	int n; 
    bool isExist = false;
    
    do
        :: j == N -> break;
        :: else ->
            L1: select(n : 1 .. N);
                for(i in array){
                    if
                        :: n == array[i] -> 
                            isExist = true;
                            goto L1
                        :: else -> 
                            isExist = false;
                    fi;
                }
            if
                :: isExist == false ->
                    array[j] = n; 
            fi;
            j++;
    od; 

    for(i in array){
        printf("Element_%d :: %d\n", i, array[i])
    } 
}