#define N 30
active proctype P() {
	int array[N], arr[N];
	int i, j, o, p;
	int n; 
    bool isExist = false;
    
    do
        :: j == 30 -> break;
        :: else ->
            L1:    select(n : 1 .. 30);
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
            printf("j :: %d\n", j)
            j++;
    od;   
    printf("\n\nFinal Array:\n")
    for(i in array){
        printf("Element_%d :: %d\n", i, array[i])
    } 
}


/*#define N 30
active proctype P() {
	int array[N], arr[N];
	int i, j, o, p;
	int n; 
    bool isExist = false;
    // for(i in array){
    //     select(n : 1 .. 30)
    //     array[i] = n
    // }
    for(i in array){
        select(n : 1 .. 30)
        array[i] = n;
        // printf("element :: %d", i);
        for(o in array){
            if
                :: n == array[o] -> j++;
                :: else
            fi
        }
        if
            :: j == 1 -> 
                // printf("the number %d is not repeated\n", n); 
                j = 0;
            :: else -> 
                // printf("the number %d is repeated %d times\n", n, j); 
                j = 0; 
                array[i] = 0; 
                arr[i] = n;
                p++;
        fi
    }
    printf("\n total %d number is repeated\n", p);
    // for(i in array){
	// 	printf("Element_%d :: %d\n", i, array[i])
	// }
    // for(i in arr){
    //     printf("Element_%d :: %d\n", i, arr[i])
    // }
}

// if
//     :: i == 0 -> array[0] = n; 
//     :: else -> for(i : 0 .. 1){
//         if 
//             :: printf("is in else")
//             // :: n == array[i] -> isExist = true;
//             // :: else -> isExist = false;
//         fi
//         }
// fi
// if
//     :: isExist == false -> array[i] = n;
// fi
*/