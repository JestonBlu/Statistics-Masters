*SAS Program to Compute Power Curve for F-Test with t=4,
    alpha=.05, df1=3, df2=20, F_.05,3,30 = 3.09839, and
    for specified values of L=noncentrality parameter;

Data;
Input L @@;

P=1-PROBF(3.09839,3,20,L);
phi=sqrt(L/4);
Cards;
0 .2  .4  .6 .8 1 1.5 2 2.5 3 3.5 4 4.5 5 6 8 10 12 14  16 19.36
23.04 27.04 31.36 35 40 45
run;
proc print;
var  L P phi;
Run;
