int a;
active proctype P() {
	int b;	
	do
		:: if
 			:: b = 1
			:: b = 2
			:: b = 3
		fi;
		if
			:: a > 0 -> a = a - b;
			:: else -> a = a + b;
		fi;	
	od
}
