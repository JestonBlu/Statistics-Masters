*SAS Program to Compute Power Curve for F-Test
    for t=4,r=3,n=12, Sigma^2 = 0.11585, alpha=.05 F(.05,3,8)=4.066
D=Min Effect Size:;

*Program1-Minimum power when all effect sizes are at least D;
Data;
Input D @@;
t=4;
r=3;
n=r*t;
alpha=.05;
sigma2=.11585;
L=(D**2)*r*t/sigma2;
Fcr=FINV(1-alpha,t-1,n-t);
P=1-PROBF(Fcr,t-1,n-t,L);
Cards;
.025 .05 .075 .10 .1025 .15 .175 .2 .225 .25 .275 .3 .325 .35 .375 .4 .425 .45 .475 .5 .525 .55 .575 .6
.625 .65 .675 .70 .7025 .75 .775 .8 .825 .85 .875 .9 .925 .95 .975 1.0
run;
proc print;
var r t alpha D L P;
Run;

*Program2-Minimum power when at least one effect size is at least D;
Data;
Input D @@;
t=4;
r=3;
n=r*t;
alpha=.05;
sigma2=.11585;
L=(D**2)*r/(2*sigma2);
Fcr=FINV(1-alpha,t-1,n-t);
P=1-PROBF(Fcr,t-1,n-t,L);
Cards;
.025 .05 .075 .10 .1025 .15 .175 .2 .225 .25 .275 .3 .325 .35 .375 .4 .425 .45 .475 .5 .525 .55 .575 .6
.625 .65 .675 .70 .7025 .75 .775 .8 .825 .85 .875 .9 .925 .95 .975 1.0

run;
proc print;
var r t alpha D L P;
Run;
