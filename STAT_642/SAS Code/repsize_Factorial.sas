options ps=55 ls=70 nocenter nodate;

*Factorial Experiment - Rep Size
SAS Program to compute sample size when the specification is that
at least one pair of treatment means are at least D units apart.
It is necessary to provide
t=Number of Treatments
D=size of effect to be detected
S=an estimate of the experimental standard deviation(sigma);
title 'rep size calculations for factorial experiment treatment differences';
data factoreffect;
input  r1 @@;
a1=3; 
b1=4;
t1=a1*b1;
alpha1=.05;
u11=t1-1; 
u21=t1*(r1-1);
S1=1.4;
D1=2.5;
L1=r1*D1**2/(2*(S1**2));
phi1=sqrt(L1/t1);
c1=finv(1-alpha1,u11,u21);
p1=1-probf(c1,u11,u21,L1);
cards;
2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
run;
proc print; var t1 r1 c1 u11 u21 L1 phi1 p1;
run;
title 'rep size calculations for factorial experiment main effects';
data maineffect;
input  r2 @@;
a2=3;
b2=4; 
t2=a2*b2;
alpha2=.05;
u12=b2-1; 
u22=t2*(r2-1);
S2=1.4;
D2=2.5;
L2=r2*D2**2/(2*(S2**2));
phi2=sqrt(L2/b2);
c2=finv(1-alpha2,u12,u22);
p2=1-probf(c2,u12,u22,L2);
cards;
2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
run;
proc print; var b2  r2 c2 u12 u22 L2 phi2 p2;
run;
