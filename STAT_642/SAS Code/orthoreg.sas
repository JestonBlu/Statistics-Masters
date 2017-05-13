* orthoreg.sas;
*Compare the analysis of the orthogonal polynomials to a regression analysis;

option ls=72 ps=60 nocenter nodate;
title 'Orthogonal Polynomials';

data old; array Y Y1-Y4;
input T  Y1-Y4; do over Y; PE=Y; output; end;
      drop Y1-Y4;

cards;
550 6 4 5 5
600 32 26 24 22
650 45 45 44 34
700 63 62 44 39
750 87 85 72 80
run;
data poly; set old;
T2=T**2; T3=T**3; T4=T**4;
      label T = 'Temp of React' PE = 'Percent of Water-Gas';
run;
proc plot;
plot PE*T='*';
run;
proc reg data=poly;
model PE= T T2 T3 T4/ p r ss1;
output out=pred p=phat r=res;
run;
proc print;
