*SAS Program to Determine Sample size for F-Test with t=4, 
    alpha=.05, u1=6.5,u2=6,u3=6,u4=5.5, variance=.116;

Data;
Input r @@;
t=4;
alpha=.05;
s2=.116;
u1=6.5;
u2=6;
u3=6;
u4=5.5;
mean_u=(u1+u2+u3+u4)/t;
L=r*((u1-mean_u)**2 + (u2-mean_u)**2 + (u3-mean_u)**2 + (u4-mean_u)**2)/s2;
n1=t-1;
n2=t*(r-1);
Fcr=finv(1-alpha,n1,n2);
P=1-PROBF(Fcr,n1,n2,L);
Cards;
2 3 4 5 6 7 8 9 10
run;
proc print;
var  r n1 n2 Fcr L P;
Run;
