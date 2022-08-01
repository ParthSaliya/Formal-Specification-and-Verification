byte flag = 0;
int count = 0;
bool end = false
active proctype P() {
    if
        :: flag = 1
        :: flag = 2
    fi;
    if
        :: flag == 1 ->
    do
        :: (count == 0) ->  break
        :: count++; printf("%d\n", count);
        :: count--;  printf("%d\n", count);
    od
    :: else ->
    do
    :: (count == 0) -> break
    :: (count != 0) ->
        if
        :: count++;  printf("%d\n", count);
        :: count--;  printf("%d\n", count);
        fi
    od
    fi;
    end = true
}