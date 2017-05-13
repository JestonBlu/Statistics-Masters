options ps=55 ls=70 nocenter nodate;

*APPROACH 5
SAS Program to compute sample size when the specification is that
at least one pair of treatment means are at least D units apart.
It is necessary to provide
t=Number of Treatments
D=size of effect to be detected
S=an estimate of the experimental standard deviation(sigma);

data;
input  r @@;
t=5; alpha=.01;
u1=t-1; u2=t*(r-1);
S=150;
D=20;
L=r*D**2/(2*(S**2));
phi=sqrt(L/t);
c=finv(1-alpha,u1,u2);
p=1-probf(c,u1,u2,L);
cards;
2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
run;
proc print; var t r c u1 u2 L phi p;
run;
