*Relapse of Leukemia;
data relapse;
input group $ relapse $ count; 
cards;
traces yes 30
traces no 45
notrace yes 8
notrace no 95
;
proc freq order=data data=relapse; weight count;
*Finding confidence intervals for difference of proportions, RR, and OR;
tables group*relapse/nocol nopct relrisk riskdiff(cl=(newcombe ac wald));
title "Relapse of Leukemia";
run; 

proc freq order=data data=relapse; weight count;
title 'Analysis of 2x2 Table Using PROC FREQ';
tables group*relapse/nopercent nocol chisq expected measures plots=mosaicplot;
run;

proc sort data=relapse; by group;

proc freq data=relapse order=data; weight count; by group;
*Find score interval for each group;
tables relapse/binomial(wilson) alpha=.05;
run;




