/*
Name: Parth Hareshbhai Saliya
Marticulation Number: 1340219
*/
#define N 10
active proctype P() {
	int array[N];
	byte i;
	do
		:: i == 10 -> break
		:: else -> 
				if
					:: array[i] = 1; i++
					:: array[i] = 2; i++
					:: array[i] = 3; i++
					:: array[i] = 4; i++
					:: array[i] = 5; i++
					:: array[i] = 6; i++
					:: array[i] = 7; i++
					:: array[i] = 8; i++
					:: array[i] = 9; i++
					:: array[i] = 10; i++
				fi;
	od
	for(i in array){
		printf("Element_%d :: %d\n", i, array[i])
	}
}