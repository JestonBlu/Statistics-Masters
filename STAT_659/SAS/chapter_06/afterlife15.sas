*Table 6.4: Belief in the Afterlife by Race & Gender;
options nocenter nodate ps=55 ls=78;
data afterlif; input race $ gender $ belief $ count @@;
cards;
W F Yes 371 W F Undecided 49 W F No 74
W M Yes 250 W M Undecided 45 W M No 71
B F Yes  64 B F Undecided  9 B F No 15
B M Yes  25 B M Undecided  5 B M No 13
;

proc logistic data=afterlif ref='No'; freq count;
class race (ref='B') gender;
model belief=race gender/link=glogit;
output out=preds predprobs=i;
title 'Belief in afterlife generalized logit model with effects parameterization';
run;

proc print data=preds; 
run;

proc logistic data=afterlif ref='No'; freq count;
class race(ref='B') gender (ref='M')/param=ref;
model belief=race gender / link=glogit aggregate scale=none;
title 'Model with race and gender with dummy variable parameterization';
run;

proc logistic data=afterlif ref='No'; freq count;
class race(ref='B') gender (ref='M')/param=ref;
model belief=race  / link=glogit aggregate=(race gender) scale=none;
title 'Model with race ';
run;

proc logistic data=afterlif ref='No'; freq count;
class race(ref='B') gender (ref='M')/param=ref;
model belief=gender  / link=glogit aggregate=(race gender) scale=none;
title 'Model with gender';
run;
