data binom;
input x n;
cards;
3 10
0 10
;
proc genmod;
model x/n=/dist=bin link=logit residuals;
run;

data binom2;
input y count;
cards;
1 3
0 7
0 10
proc genmod desc data=binom2;
freq count; model y=/dist=bin link=logit residuals;
run;
