
options ls=78 ps=60 nocenter nodate;
title 'Tea-Tasting Data for Fishers exact test';
data fisher;
input poured $ guess $ count; 
cards;
milk milk 3
milk tea 1
tea milk 1
tea tea 3
proc freq data=fisher; weight count;
tables poured*guess/nopercent nocol norow exact; 
proc freq data=fisher; weight count;
tables poured*guess/nopercent nocol norow; exact chisq or/ point;
proc logistic  data=fisher; freq count;	class poured/param=ref;
model  guess=poured;
exact poured/estimate=both;
exact poured/estimate=both onesided cltype=midp;
title 'Exact Tests for Tea-Tasting Data using logistic';
run;

