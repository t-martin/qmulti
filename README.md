# qmulti
## About
qmulti.q is a simple q script to allow multi-line code to be entered into a standard kdb+ console

## Usage
Load the script using `\l`

	q)\l qmulti.q

To enter multi-line mode, run `multi[]`

	q)multi[]
	[qmulti on]
	>> 

Then enter your code. Type `end` to evaluate your code and exit multiline mode

	>> func:{[x;y] 
	>>   x+:20;
	>>   y+:50;
	>>   x,y
	>>   };
	>> end
	[qmulti off]
	q)func[100;50]
	120 100

Note that your code must respect the usual q rules about multi-line functions: each line after the first must be indented.

Also note that when pasting into putty, a leading tab will be ignored which could case indentation errors. Use spaces instead of tabs.

## Integration with qremote
qmulti will work witih qremote (https://github.com/t-martin/qremote), provided that qremote can find qmulti.q when it is run. 

qmulti.q should be stored in QHOME, QMULTI_HOME or QREMOTE_HOME in order to work with qremote.
