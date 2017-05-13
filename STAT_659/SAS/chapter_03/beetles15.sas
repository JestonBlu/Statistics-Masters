options nodate nocenter ls=90 ps=60;
data beetle;
input dose killed total; dose2=(dose-1.7934)**2;
cards;
1.6907 6 59
1.7242 13 60
1.7552 18 62
1.7842 28 56
1.8113 52 63
1.8369 53 59
1.8610 61 62
1.8839 59 60
;proc genmod data=beetle; 
model killed/total=dose/dist=bin link=logit;
title 'Logistic Regression using GENMOD';

proc logistic data=beetle; model killed/total=dose/lackfit influence aggregate scale=none covb;
output out=newdata predicted=pre lower=lb upper=ub reschi=pearson resdev=deviance;
title 'Logistic Regression using LOGISTIC';
proc gplot data=newdata; plot pearson*dose;
run;

proc print data=newdata;
title 'Output Variables from LOGISTIC';

proc logistic; model killed/total=/lackfit aggregate scale=none covb;
output out=newdata1 predicted=pre1 lower=lb1 upper=ub1 reschi=pearson1 resdev=deviance1;
title 'Logistic Regression with Intercept Only using LOGISTIC';
proc gplot data=newdata1; plot pearson1*dose;
run;

proc logistic; model killed/total=dose dose*dose/lackfit influence covb;
output out=newdata2 predicted=pre2 lower=lb2 upper=ub2 reschi=pearson2 resdev=deviance2;
title 'Logistic Regression with Quadratic Term using LOGISTIC';
proc gplot data=newdata2; plot pearson2*dose;
run;


proc genmod; 
model killed/total=dose dose2/dist=bin link=logit type3;
title 'Logistic Regression for Quadratic Model using GENMOD';
run;

proc genmod; model killed/total=dose/dist=bin link=probit;
title 'Regression with probit link';

proc genmod; model killed/total=dose/dist=bin link=cloglog;
title 'Regression with complementary log log link';
run;

data beetle2; set beetle;
count=killed; dead='yes'; output;
count=total-killed; dead='no'; output;
drop total killed;

proc logistic data=beetle2 desc; freq count; model dead=dose/lackfit influence aggregate scale=none covb;
output out=newdata3 predicted=pre3 lower=lb3 upper=ub3 reschi=pearson3 resdev=deviance3;
title 'Logistic Regression using LOGISTIC using freq variable';


proc print data=newdata3;
title 'Output Variables from LOGISTIC using freq variable';
run;
