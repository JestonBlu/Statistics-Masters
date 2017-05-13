  *A study on soft drink tastes was carried out by a company interested in reactions
to a new soft drink that was being targeted for both the United States and Great
Britain.  Investigators poststratified on gender because they thought it was potentially
related to the response.  After receiving a supply of the new soft drink and being
given a week in which to try it, subjects were asked whether they would want to switch
form their current soft drinks to this new drink.;

data soft;
input gender $ country $ switch $ count @@;
cards;
male American y 29 male American n 6
male British  y 19 male British n 15
female American y 7 female American n 23
female British y 24 female British n 29
;
proc freq order=data data=soft;
weight count;
tables gender*switch/chisq nocol nopct;
tables gender*country/chisq nocol nopct;
tables country*switch/chisq nocol nopct relrisk;
tables gender*country*switch/chisq cmh1 nocol nopct expected relrisk;
title 'Soft Drink Switching';
run;
 proc logistic data=soft desc;
 freq count;
 class gender country/param=ref;
 model switch=gender country/aggregate scale=none;
 title "homogeneous association model";

 run;
proc logistic data=soft desc;
freq count;
 class gender country/param=ref;
 model switch=gender|country;
 title "saturated model";
 run;
