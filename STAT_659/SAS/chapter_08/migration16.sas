data migrate;
input then $ now $ count m11 m12 m13 m21 m22 m23 m31 m32 m33 m44 m1 m2 m3;
datalines;
ne ne 266 1   0 0  0  0  0  0  0  0 0 0 0 0 
ne mw  15 0   1 0  0  0  0  0  0  0 0 0 0 0 
ne  s  61 0   0 1  0  0  0  0  0  0 0 0 0 0 
ne  w  28 -1 -1 -1 0  0  0  0  0  0 0 1 0 0 
mw ne  10 0   0 0  1  0  0  0  0  0 0 0 0 0 
mw mw 414 0   0 0  0  1  0  0  0  0 0 0 0 0 
mw  s  50 0   0 0  0  0  1  0  0  0 0 0 0 0 
mw  w  40 0   0 0 -1 -1 -1  0  0  0 0 0 1 0 
s  ne   8 0   0 0  0  0  0  1  0  0 0 0 0 0 
s  mw  22 0   0 0  0  0  0  0  1  0 0 0 0 0 
s   s 578 0   0 0  0  0  0  0  0  1 0 0 0 0 
s   w  22 0   0 0  0  0  0 -1 -1 -1 0 0 0 1 
w  ne   7 -1  0 0 -1  0  0 -1  0  0 0 1 0 0 
w  mw   6 0  -1 0  0 -1  0  0 -1  0 0 0 1 0 
w   s  27 0   0 -1 0  0 -1  0  0 -1 0 0 0 1 
w   w 301 0   0  0 0  0  0  0  0  0 1 0 0 0 
;
proc genmod data=migrate;
model count = m11 m12 m13 m21 m22 m23 m31 m32 m33 m44 m1 m2 m3 /
dist=poi link=identity;
title 'Test of Marginal Homogeneity using Loglinear Model for Homogeneity';
proc catmod data=migrate; weight count; response marginals;
model then*now = _response_ / freq;
repeated time 2;
title 'Bhapkar Test of Marginal Homogeneity';
run;

data migrate2;
input res16 res2010 symm qi count @@;
*unif = premar*extramar;
datalines;
1 1 1 1 266  1 2 2 5  15  1 3 3 5  61  1 4  4 5  28
2 1 2 5  10  2 2 5 2 414  2 3 6 5  50  2 4  7 5  40
3 1 3 5   8  3 2 6 5  22  3 3 8 3 578  3 4  9 5  22
4 1 4 5   7  4 2 7 5   6  4 3 9 5  27  4 4 10 4 301
;

proc freq data=migrate2;
weight count; tables res16*res2010/agree;
run;

proc genmod data=migrate2; class res16 res2010;
model count=res16 res2010/dist=poi link=log;
title 'independence';

proc genmod data=migrate2; class symm;
model count = symm / dist=poi link=log;
title ' symmetry';
run;

proc genmod data=migrate2; class res16 res2010 symm;
model count = symm  res16 res2010/ dist=poi link=log; 
title ' QS';
run;

proc genmod data=migrate2; class symm;
model count = symm res2010 res16 / dist=poi link=log; 
title ' ordinal QS, not appropriate here';
run;

proc genmod data=migrate2; class res16 res2010 qi;
model count = res16 res2010 qi / dist=poi link=log; 
title 'quasi indep';
run;

/*proc genmod; class res16 res2010;
model count = res16 res2010 qi unif / dist=poi link=log;
* quasi unif. assoc. ;*/

data migrate3; 
input score below above @@; trials=below+above;
cards;
1 10 15 1 22 50 1 27 22
2 8 61 2 6 40 3 7 28
;
proc genmod data=migrate3;
*ods select modelfit type3;
model above/trials= / dist=bin link=logit noint type3;
title 'Symmetry model using Logits';

proc genmod data=migrate3;
*ods select modelfit type3;
model above/trials= score/ dist=bin link=logit noint type3;
title 'Ordinal Quasi-Symmetry model using Logits, again not appropriate';
run;

data migrate4;
input win n a b c d; cards;
15 25 1 -1 0 0
61  69 1 0 -1 0
28  35 1 0 0 -1
50 72 0 1 -1 0
40 46 0 1 0 -1
22 49 0 0 1 -1 

proc genmod data=migrate4;
model win/n=a b c d / dist=bin link=logit noint;
title 'Fitting Quasi-symmetry using Bradley-Terry Model';
run;
