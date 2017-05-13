data snore;
input snoring disease total;
prop=disease/total;
cards;
0 24 1379 
2 35 638 
4 21 213 
5 30 254
;    
proc genmod data=snore; 
 model disease/total = snoring / dist=bin link=identity ; 
 output out=temp1 p=pid;
 title 'fit with identity link';
proc print data=temp1;

proc genmod data=temp1; 
 model disease/total = snoring / dist=bin link=logit ; 
 output out=temp2 p=plogit;
 title 'logistic regression';
proc print data=temp2;

proc genmod data=temp2; 
 model disease/total = snoring / dist=bin link=probit;
  output out=temp3 p=pprobit;
  title 'probit link';
proc print data=temp3;

proc gplot data=temp3; 
symbol1 i=none color=black value=plus; 
symbol2 i=sm70 color=red value=circle;
symbol3 i=sm70 color=blue value=diamond;
symbol4 i=sm70 color=green value=square;
legend1 value=("observed" "identity" "logit" "probit");
plot prop*snoring pid*snoring plogit*snoring pprobit*snoring/overlay legend=legend1;
title 'Plot of Observed and Predicted Values';
run;


