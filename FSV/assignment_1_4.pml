#define N 10
active proctype P() {
	int array[N];
	int product = 1;
	byte i;
	for(i : 1 .. 10){
		select(i : 1 .. 10);
		array[i] = i
	}
	for(i in array){
		printf("Element :: %d\n", array[i])
	}
}