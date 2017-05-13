options ps=55 ls=70 nocenter nodate;
*APPROACH 4
SAS Program to compute sample size when the specification is that
all effects are greater than D. It is necessary to provide
t=Number of Treatments
D=size of effect to be detected
S=an estimate of the experimental standard deviation(sigma);

data;
input  r @@;
t=4;  alpha=.05;
u1=t-1; u2=t*(r-1);
S=.34;
D=.5;
L=r*t*D**2/(S**2);
phi=sqrt(L/t);
C=finv(1-alpha,u1,u2);
p=1-probf(C,u1,u2,L);
cards;
2 3 4 5 6 7 8 9 10
run;
proc print; var D t r u2 L phi p;
run;
