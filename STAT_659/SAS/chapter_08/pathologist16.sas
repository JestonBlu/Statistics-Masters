
data patho;
input pathx pathy symm qi count @@;
cards;
1 1 1 1 22  1 2 2 5 2   1 3 3 5 2   1 4 4 5 0
2 1 2 5 5   2 2 5 2 7   2 3 6 5 14  2 4 7 5 0
3 1 3 5 0   3 2 6 5 2   3 3 8 3 36  3 4 9 5 0
4 1 4 5 0   4 2 7 5 1   4 3 9 5 17  4 4 10 4 10
;

proc freq data=patho; weight count;
tables pathx*pathy/agree norow nocol nopct;
title 'analysis using proc freq';
run;
proc genmod data=patho; class pathx pathy qi;
ods select modelfit type3 obstats;
model count=pathx pathy /dist=poi link=log type3 residuals;
title 'independence model';

proc genmod data=patho; class pathx pathy qi;
ods select modelfit type3 obstats;
model count=pathx pathy qi/dist=poi link=log type3 predicted;
title 'quasi-independence model';
run;

proc genmod data=patho; class symm;
ods select modelfit type3;
model count = symm / dist=poi link=log type3;
title 'Symmetry model using symm';
run;

proc genmod data=patho; class pathx pathy symm;
*ods select modelfit type3 obstats;
model count = symm pathx  / dist=poi link=log type3 predicted;
title 'Quasi-symmetry model using symm';
run;


data patho3;
input  win n a b c d; cards;
5 7 1 -1 0 0
0 2 1 0 -1 0
2 16 0 1 -1 0
1  1 0 1 0 -1
17 17 0 0 1 -1
proc genmod data=patho3;
model win/n=a b c d / dist=bin link=logit noint;
title 'Fitting Quasi-symmetry using Bradley-Terry Model';
run;
