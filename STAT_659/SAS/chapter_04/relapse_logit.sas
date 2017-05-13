*Relapse of Leukemia;
data relapse;
input group $ relapse $ count; 
dummy=0; if group='traces' then dummy=1;
cards;
traces yes 30
traces no 45
notrace yes 8
notrace no 95
;

proc freq order=data data=relapse; weight count;
title 'Analysis of 2x2 Table Using PROC FREQ';
tables group*relapse/nopercent nocol chisq expected measures plots=mosaicplot;
run;

proc logistic des; freq count; class group;
model relapse=group;
title "Analysis of 2x2 Table using PROC LOGISTIC, default class param";

proc logistic des; freq count; class group (ref='notrace')/param=ref;
model relapse=group;
title "class variable with reference category param";
run;

proc logistic des; freq count;
model relapse=dummy;
title "dummy variable model";
run;


proc genmod des; freq count; class group;
model relapse=group/dist=bin link=logit;
title "PROC GENMOD, default class param";
run;


