options ls=78 ps=55 nocenter nodate;
data infants;
input malform alcohol count @@; assoc=alcohol*malform;
cards;


1 0 17066    1 0.5 14464   1 1.5 788  1 4 126 1 7 37
2 0    48    2 0.5    38   2 1.5 5    2 4   1 2 7 1

;
proc freq; weight count;
tables malform*alcohol / norow  nopercent measures chisq cmh1 plots=mosaicplot;
title 'CMH Test using freq using table scores';

proc freq; weight count;
tables malform*alcohol / norow nocol nopercent measures chisq cmh1 score=ridit;
title 'CMH Test using freq using midrank scores';

run;

proc genmod; class malform alcohol;
model count=malform alcohol/dist=p link=log;
title 'Loglinear model for independence';

proc genmod; class malform alcohol;
model count=malform alcohol assoc/dist=p link=log type3;
title 'Loglinear model for linear-by-linear association';

proc genmod; class malform alcohol; ods select type3;
model count=malform|alcohol/dist=p link=log type3;
title 'Saturated loglinear model';

proc logistic des; freq count; class alcohol;
model malform=alcohol;
title 'Logistic Regression as a Nominal Predictor';

proc logistic des; freq count;
model malform=alcohol;
title 'Logistic Regression as an Ordinal Predictor';

proc logistic des; freq count; class alcohol(ref='0')/param=ref;
model malform=alcohol;
title 'Logistic Regession as an Nominal Predictor, Set Reference to 0 Alcohol';
run;


proc logistic des; freq count;
model malform=alcohol;
exact alcohol;
title 'Logistic Regression as an Ordinal Predictor, exact test';
run;
