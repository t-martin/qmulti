// run multi[] to enter multi line mode
// then enter/paste your code
// type end to exit multi mode

.priv.multiloaded:0b;

k)checksyntax:{x:("#!"~2#*x)_x:-1!'x;y{0N!x y}'"\n"/:'(&~^*:'x)_x@:&(#:'x)&~"/"=*:'x@:&~|':(b?-1)#b:+\-/x~\:/:+,"/\\";}[;"q"]
evaluate:{(::)~@[checksyntax;x;0b]}; 
ismulti:{(2~count p)and`multi~first p:@[parse;x;`]};

multi:{[]
  -1"[multimode on]";
  finished:0b;
  query:enlist "";
  ignore:0b;
  while[not finished;
    1 ">> ";
    input:read0 0;
    if[ismulti input;
      -1"[multimode is already on. ignoring]";
      ignore:1b;
      ];
    if[input~"end"; finished:1b];
    if[not[ignore] and not input~"end";
      query,:enlist input;
      if[evaluate query;
        query:enlist "";
        ];
      ];
    ignore:0b;
    ];
  -1"[multiline off]";
  };

.priv.multiloaded:1b;    
