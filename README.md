# qmulti
## about
qmulti.q is a simple q script to allow multi-line code to be entered into a sntandard kdb+ console

## usage
load the script using \l

	q)\l qmulti.q

to enter multi-line mode, run multi[]

	q)multi[]
	[multimode on]
	>> 

then enter your code. type 'end' to exit multiline mode

	>> func:{[x;y]
	>>   	x+:20;
	>>   y+:50;
	>>   x,y
	>>   };
	>> end
	[multiline off]
	q)func[100;50]
	120 100

note that your code must respect the usual q rules about multi-line functions: each line after the first must be indented

also note that code is evaluated as it is entered

