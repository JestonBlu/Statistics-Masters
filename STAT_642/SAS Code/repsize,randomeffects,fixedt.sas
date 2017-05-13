*repsize,randomeffects,fixedt.sas;
options ps=55 ls=70 nocenter nodate;
*SAS Program to compute sample size for experiments with random effects.
Fix number of treatments,t, then determine number of reps, r;

data;
input  r @@;
*sigma_e=1;
*sigma_a=sqrt(2);
t=8; 
u1=t-1; 
u2=t*(r-1);
gamma=.90;
alpha=.01;
*tau=(sigma_a/sigma_e)**2;
tau=2;
lambda=sqrt(1+(r)*(tau));
Fcr=finv(1-alpha,u1,u2);
C=(1/lambda**2)*Fcr;
power=1-probf(C,u1,u2);
cards;
2 3 4 5 6 7 8 9 
;
run;
proc print; 
var r u1 u2 C Fcr lambda power;
run;
