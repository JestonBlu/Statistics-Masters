/* Table 6.1 in Agresti: Length and Food Choice of 59 Alligators */
data gator;
input length choice $ @@;
cards;


1.24 I  1.30 I  1.30 I  1.32 F  1.32 F  1.40 F  1.42 I  1.42 F
1.45 I  1.45 O  1.47 I  1.47 F  1.50 I  1.52 I  1.55 I  1.60 I
1.63 I  1.65 O  1.65 I  1.65 F  1.65 F  1.68 F  1.70 I  1.73 O
1.78 I  1.78 I  1.78 O  1.80 I  1.80 F  1.85 F  1.88 I  1.93 I
1.98 I  2.03 F  2.03 F  2.16 F  2.26 F  2.31 F  2.31 F  2.36 F
2.36 F  2.39 F  2.41 F  2.44 F  2.46 F  2.56 O  2.67 F  2.72 I
2.79 F  2.84 F  3.25 O  3.28 O  3.33 F  3.56 F  3.58 F  3.66 F
3.68 O  3.71 F  3.89 F

;/*

proc catmod data=gator; response logits; direct length;
model choice = length / noprofile noiter;
title 'Using CATMOD to fit a generalized logit';

proc catmod data=gator;  direct length; model choice=length/noprint  pred=prob;
response/out=predprob1;
title 'Create data set with estimated probs using catmod';
run;
data predprob1; set predprob1; if _TYPE_="PROB";
rename _PRED_=predp; drop _TYPE_ _NUMBER_ _OBS_ _SEOBS_;
  run;
proc gplot data=predprob1; 
symbol1 i=spline color=red value=plus; 
symbol2 i=spline color=black value=circle;
symbol3 i=spline color=blue value=star;
plot predp*length=choice;

title 'Estimated Probabilities for Alligator Choice Data';
run;
*/
proc logistic data=gator ref=last; 
model choice=length/link=glogit;
output out=predout predprobs=i;
title 'Using proc logistic for nominal responses';
run;

proc glimmix data=gator ; 
model choice=length/link=glogit dist=mult solution ;
output out=predout predprobs=i;
title 'Using proc glimmix for nominal responses';
run;
/* The classification table is based on the created _FROM_ and _INTO_ variables formed by asking for
predprobs.*/

proc freq data=predout;
     tables _FROM_*_INTO_ / nocol norow nopercent;
run;


run;
proc logistic data=gator ref=last; 
model choice=length/link=glogit;
output out=predout2 p=predp2;
title 'Using proc logistic for nominal responses';

proc gplot data=predout2; 
symbol1 i=spline color=red value=plus; 
symbol2 i=spline color=black value=circle;
symbol3 i=spline color=blue value=star;
plot predp2*length=_LEVEL_;
title 'Plotting estimated probabilities from proc logistic';
run;

/*The above program fits 2 logits simultaneously.   */
/*We now fit the set of logit equations separatelely */

proc logistic data=gator; where choice NE 'I'; model choice=length;
title 'Model for odds of F over O';

 proc logistic data=gator; where choice NE 'F'; model choice=length;

title 'Model for odds of I over O';

proc logistic data=gator; where choice NE 'O'; model choice=length;
title 'Model for odds of F over I';

run;

