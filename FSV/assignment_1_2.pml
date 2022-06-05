byte i = 0;
active proctype P() {
	
	if
		:: i < 10
		do
			:: i < 10 -> printf("First\n"); i++
			:: i < 10 -> printf("Second\n"); i++
		od
		:: else -> 
		do 
			:: i = 10 -> break
		od
	fi	

	
}
