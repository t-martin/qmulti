// run multi[] to enter multi line mode
// then enter/paste your code
// type end to exit multi mode

.priv.ml.qmultiloaded:0b;

k).priv.ml.checksyntax:{x:("#!"~2#*x)_x:-1!'x;.priv.ml.display'z'(@;y;)'"\n"/:'(&~^*:'x)_x@:&(#:'x)&~"/"=*:'x@:&~|':(b?-1)#b:+\-/x~\:/:+,"/\\";}[;"q";];
k)rtrimn:{$[~t&77h>t:@x;.z.s'x;"\n"=last x;|ltrimn@|x;x]};
k)ltrimn:{$[~t&77h>t:@x;.z.s'x;"\n"=*x;(+/&\"\n"=x)_x;x]};
trimn:{ltrimn rtrimn x};
.priv.ml.display:{if[not ""~r:trimn .Q.s x;-1 r]};
.priv.ml.evaluater:{[h;x](::)~@[.priv.ml.checksyntax[;h];x;0b]};
.priv.ml.initeval:{.priv.ml.evaluate:.priv.ml.evaluater x};
.priv.ml.ismulti:{(2~count p)and`multi~first p:@[parse;x;`]};
.priv.ml.initremote:{.priv.ml.safemode:1b;.priv.ml.initeval x}

multi:{[]
  -1"[qmulti on]";
  finished:0b;
  query:enlist "";
  ignore:0b;
  while[not finished;
    1 ">> ";
    input:read0 0;
    if[.priv.ml.ismulti input;
      -1"[qmulti is already on. ignoring]";
      ignore:1b;
      ];
    if[input~"end"; finished:1b];
    if[.priv.ml.safemode and input~"\\\\";ignore:1b];
    if[not[ignore] and not input~"end";
      query,:enlist input;
      if[.priv.ml.evaluate query;
        query:enlist "";
        ];
      ];
    ignore:0b;
    ];
  -1"[qmulti off]";
  };

//initlise multiline in local mode
.priv.ml.initeval[0];
.priv.ml.qmultiloaded:1b;
.priv.ml.safemode:0b;    
