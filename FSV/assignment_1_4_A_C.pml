/*
Name: Parth Hareshbhai Saliya
Marticulation Number: 1340219
*/
#define N 10
active proctype P() {
	int array[N];
	int product = 1;
	int i = 1;
	int n = 1; 
	for(i : 0 .. N-1){
		select(n : 1 .. 10)
		printf("i = %d :: n = %d\n", i, n)
		array[i] = n
	}
	for(i in array){
		product = product * array[i]
		printf("Element :: %d\n", array[i])
	}
	printf("The product is: %d\n", product)
}

/*
-> I was getting the following error:
	"Error: indexing array 'array'
   so, I have used 0 to N-1 range in the first for loop.
*/