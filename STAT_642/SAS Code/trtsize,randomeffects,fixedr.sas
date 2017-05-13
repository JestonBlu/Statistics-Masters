*repsize,randomeffects,fixedt.sas;
options ps=55 ls=70 nocenter nodate;
*SAS Program to compute sample size for experiments with random effects.
Fix number of treatments,t, then determine number of reps, r;
*trtsize,randomeffects,fixedr.SAS;
data;
input  t @@;
r=5;
u1=t-1;
u2=t*(r-1);
sigma_e=2.7566;
sigma_a=2.5;
gamma=.85;
alpha=.05;
tau=(sigma_a/sigma_e)**2;
lambda=sqrt(1+(r)*(tau));
Fcr=finv(1-alpha,u1,u2);
C=(1/lambda**2)*Fcr;
power=1-probf(C,u1,u2);
cards;
3 4 5 6 7 8 9
run;
proc print; var t u1 u2 Fcr lambda power;
run;
