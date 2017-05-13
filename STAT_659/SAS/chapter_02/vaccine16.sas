*SAS code for the Polio Vaccine data set;
option ls=78 ps=60 nocenter nodate;
data vaccine;
title "Clinical Trial for Polio Vaccine";
input group $ disease $ count; 
cards;
vaccine yes 33
vaccine no 201196
novaccine yes 110
novaccine no 200635
;

proc freq data=vaccine order=data; weight count;
tables group*disease/nopercent nocol chisq expected measures;
run; 

ods trace on /listing;
proc freq data=vaccine order=data; weight count;
tables group*disease/riskdiff(cl=(newcombe ac wald)) relrisk alpha=0.05;
exact or;
ods output PdiffCLs=diffs;
ods trace off;

data diffs;
    set diffs;
    format LowerCL 10.7;
format UpperCL 10.7;
run;
proc print data=diffs;
run; 


