data relapse;
input group $ relapse $ count;
cards;
traces yes 30
traces no 45
notrace yes 8
notrace no 95
proc print; title 'Leukemia Data Set';
proc freq order=data data=relapse; weight count;
title 'Analysis of 2x2 Table Using PROC FREQ';
tables group*relapse/chisq expected measures;
run;
/*proc catmod; weight count;
title 'Fitting the Saturated Model with PROC CATMOD';
model group*relapse=_response_/pred=freq; loglin group|relapse;

proc catmod; weight count;
title 'Fitting the Independence Model with PROC CATMOD';
model group*relapse=_response_/noresponse noiter  noprofile pred=freq; 
loglin group relapse;
run;
*/

proc genmod order=data data=relapse; class group(ref=last) relapse(ref=last)/param=ref;
title 'Fitting the Independence Model with PROC GENMOD, Set 1';
model count=group relapse/dist=poi link=log predicted type3;
run;

proc genmod order=data data=relapse; class group relapse/param=effect;
title 'Fitting the Independence Model with PROC GENMOD, Effects Model, Set 3';
model count=group relapse/dist=poi link=log;
run;

proc genmod order=data data=relapse; class group(ref=first) relapse(ref=first)/param=ref;
title 'Fitting the Independence Model with PROC GENMOD, Set 2';
model count=group relapse/dist=poi link=log;
run;


proc genmod order=data data=relapse; class group(ref=last) relapse(ref=last)/param=ref;
title 'Fitting the Saturated Model with PROC GENMOD, Set 1';
model count=group |relapse/dist=poi link=log predicted type3;

proc genmod order=data data=relapse; class group relapse;
ods select type3;
title 'Fitting the Saturated Model with PROC GENMOD with Less Output';
model count=group relapse group*relapse/dist=poi link=log type3;
run;

proc genmod order=data data=relapse; class group relapse/param=effect;
title 'Fitting the Saturated Model with PROC GENMOD, Effects Model, Set 3';
model count=group|relapse/dist=poi link=log;
run;

proc genmod order=data data=relapse; class group(ref=first) relapse(ref=first)/param=ref;
title 'Fitting the Saturated Model with PROC GENMOD, Set 2';
model count=group|relapse/dist=poi link=log;
run;
