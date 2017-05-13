/*** Resp and Resp1 Datasets ***/
data resp1;
      input center id treatment $ sex $ age baseline4 
      visit1-visit4 @@;
      visit=1;  outcome4=visit1;  output;   
      visit=2;  outcome4=visit2;  output;   
      visit=3;  outcome4=visit3;  output;   
      visit=4;  outcome4=visit4;  output;   
      datalines;
1  1   P  M   46   2  2 2 2 2
1  2   P  M   28   2  0 0 0 0
1  3   A  M   23   3  3 4 4 3
1  4   P  M   44   3  4 3 4 2
1  5   P  F   13   4  4 4 4 4
1  6   A  M   34   1  1 2 1 1
1  7   P  M   43   2  3 2 4 4
1  8   A  M   28   1  2 2 1 2
1  9   A  M   31   3  3 4 4 4
1  10  P  M   37   3  2 3 3 2
1  11  A  M   30   3  4 4 4 3
1  12  A  M   14   2  3 3 3 2
1  13  P  M   23   3  3 1 1 1
1  14  P  M   30   1  0 0 0 0
1  15  P  M   20   4  4 4 4 4
1  16  A  M   22   1  2 2 2 3
1  17  P  M   25   1  1 2 2 2
1  18  A  F   47   2  2 3 4 4
1  19  P  F   31   2  1 0 2 2
1  20  A  M   20   3  3 2 3 1
1  21  A  M   26   2  4 1 4 2
1  22  A  M   46   4  3 4 3 4
1  23  A  M   32   3  4 4 3 3
1  24  A  M   48   2  3 2 0 2
1  25  P  F   35   1  0 0 0 0
1  26  A  M   26   2  2 2 2 2
1  27  P  M   23   4  4 2 4 4
2  1   P  F   36   2  3 3 2 2
2  2   P  M   19   2  3 3 0 0
2  3   A  M   28   0  0 1 2 1
2  4   P  M   37   1  0 0 0 0
2  5   A  M   23   2  3 4 4 4
2  6   A  M   30   3  3 4 4 2
2  7   P  M   15   2  2 3 3 2
2  8   A  M   26   1  2 2 3 2
2  9   P  F   45   2  2 2 2 1
2  10  A  M   31   0  2 3 2 1
2  11  A  M   50   2  2 2 2 2
2  12  P  M   28   2  1 1 1 1
2  13  P  M   26   1  2 1 2 2
2  14  P  M   14   2  2 1 2 3
2  15  A  M   31   1  2 3 1 1
2  16  P  M   13   3  4 4 4 4
2  17  P  M   27   1  2 2 1 2
2  18  P  M   26   2  4 2 4 3
2  19  P  M   49   2  2 2 2 2
2  20  P  M   63   2  2 2 2 2
2  21  A  M   57   3  3 4 3 4
2  22  P  M   27   3  3 4 3 3
2  23  A  M   22   2  1 3 4 4
2  24  A  M   15   0  2 3 3 3
2  25  P  M   43   1  1 1 3 2
2  26  A  F   32   1  2 2 4 2
2  27  A  M   11   4  4 4 4 2
2  28  P  M   24   3  4 4 4 3
2  29  A  M   25   2  3 3 2 3
3  1   P  F   39   1  2 1 1 2
3  2   A  M   25   3  4 3 3 1
3  3   A  M   58   4  4 4 4 4
3  4   P  F   51   3  4 2 4 4
3  5   P  F   32   3  2 2 3 4
3  6   P  M   45   3  4 2 1 2
3  7   P  F   44   3  4 4 4 4
3  8   P  F   48   2  2 1 0 0
3  9   A  M   26   2  3 4 4 4
3  10  A  M   14   1  4 4 4 4
3  11  P  F   48   2  2 2 2 2
3  12  A  M   13   4  4 4 4 4
3  13  P  M   20   1  4 4 4 4
3  14  A  M   37   4  3 2 2 4
3  15  A  M   25   3  4 4 3 3
3  16  A  M   20   2  4 4 4 3
3  17  P  F   58   1  4 2 2 0
3  18  P  M   38   4  3 0 0 0
3  19  A  M   55   4  4 4 4 4
3  20  A  M   24   4  4 4 4 4
3  21  P  F   36   3  3 2 1 3
3  22  P  M   36   2  4 3 3 4
3  23  A  F   60   4  4 3 3 4
3  24  P  M   15   3  2 2 3 3
3  25  A  M   25   2  2 4 4 4
3  26  A  M   35   4  4 4 4 4
3  27  A  M   19   3  3 2 3 3
3  28  P  F   31   3  4 4 4 4
3  29  A  M   21   3  3 4 4 4
4  1   A  F   37   1  3 4 4 4
4  2   P  M   52   2  3 4 3 4
4  3   A  M   55   2  2 3 3 1
4  4   P  M   19   4  2 2 3 3
4  5   P  M   20   3  2 4 4 4
4  6   P  M   42   3  2 2 2 2
4  7   A  M   41   3  4 4 3 4
4  8   A  M   52   1  2 1 2 2
4  9   P  F   47   2  3 3 2 3
4  10  P  M   11   3  4 4 4 4
4  11  P  M   14   2  1 2 3 2
4  12  P  M   15   4  3 3 3 4
4  13  P  M   66   3  3 3 4 4
4  14  A  M   34   2  4 4 2 4
4  15  P  M   43   2  1 0 0 0
4  16  P  M   33   3  3 3 2 3
4  17  P  M   48   4  4 0 0 0
4  18  A  M   20   2  1 1 0 0
4  19  P  F   39   3  2 3 0 0
4  20  A  M   28   2  3 2 2 1
4  21  P  F   38   1  2 0 0 0
4  22  A  M   43   3  3 4 4 2
4  23  A  F   39   2  3 4 4 4
4  24  A  M   68   2  3 3 3 4
4  25  A  F   63   4  4 4 4 4
4  26  A  M   31   4  4 4 4 4
   ;
run;
data resp;
   set resp1;
   outcome = (outcome4=3 or outcome4=4); 
   baseline = (baseline4=3 or baseline4=4); 
   drop visit1-visit4 outcome4 baseline4;
run;
/*** Exploratory Data Analysis Using Logit Plots ***/

proc print data=resp;
run;

*** sex;
proc means data=resp noprint nway;
   class sex;
   var outcome;
   output out=out sum(outcome)=outcome;
run;

data out;
   set out;
   logit=log((outcome)/(_freq_-outcome));
run;

proc sgplot data=out;
   scatter y=logit x=sex ;
   title "Estimated Logit Plot of Sex";
run;
title;

 *** Treatment;
proc means data=resp noprint nway;
   class treatment;
   var outcome;
   output out=out sum(outcome)=outcome;
run;

data out;
   set out;
   logit=log((outcome)/(_freq_-outcome));
run;

proc sgplot data=out;
   scatter y=logit x=treatment ;
   title "Estimated Logit Plot of Treatment";
run;
title;


*** visit;
proc means data=resp noprint nway;
   class visit;
   var outcome;
   output out=out sum(outcome)=outcome;
run;

data out;
   set out;
   logit=log((outcome)/(_freq_-outcome));
run;

proc sgplot data=out;
   scatter y=logit x=visit ;
   xaxis  type=discrete;
   title "Estimated Logit Plot of Visit";
run;
title;


*** age;
proc means data=resp noprint nway;
   class age;
   var outcome;
   output out=out sum(outcome)=outcome;
run;

data out;
   set out;
   logit=log((outcome)/(_freq_-outcome));
run;

proc sgplot data=out;
   scatter y=logit x=age ;
   title "Estimated Logit Plot of Age";
run;
title;


 *** baseline;
proc means data=resp noprint nway;
   class baseline;
   var outcome;
   output out=out sum(outcome)=outcome;
run;

data out;
   set out;
   logit=log((outcome)/(_freq_-outcome));
run;

proc sgplot data=out;
   scatter y=logit x=baseline ;
   xaxis type=discrete;
   title "Estimated Logit Plot of Baseline";
run;
title;
/*** Fitting a Model for Repeated Measures Data ***/

proc glimmix data=resp;
   class id center sex treatment visit;
   model outcome (event='1') = sex|treatment visit age baseline
                             / dist=binary link=logit solution;
   random int / subject=center;
   random int / subject=id(center);
run;

proc glimmix data=resp;
   class id center sex treatment visit;
   model outcome (event='1') = sex|treatment visit age baseline
                             / dist=binary link=logit solution;
   random int / subject=center;
   random _residual_ / subject=id(center) type=cs;
run;


proc glimmix data=resp;
     class id center sex treatment visit;
	  model outcome (event='1') = sex|treatment visit age baseline
                             / dist=binary link=logit solution;
	  random int / subject=center;
      random _residual_ / subject=id(center) type=ar(1);
run;
proc glimmix data=resp ;
   class id center sex treatment visit;
   model outcome (event='1') = sex|treatment visit age baseline
                             / link=logit dist=binary;
   random int / subject=center;
   random _residual_ / subject=id(center) type=ar(1);
   covtest 'No random center effect' ZeroG / estimates;
run;

/* use the UNR structure */
proc glimmix data=resp ;
   class id center sex treatment visit;
   model outcome (event='1') = sex|treatment visit age baseline
                             / link=logit dist=binary;
   random int / subject=center;
   random _residual_ / subject=id(center) type=unr;
run;
/*** Using the COVTEST Statement ***/
proc glimmix data=resp ;
   class id center sex treatment visit;
   model outcome (event='1') = sex|treatment visit age baseline
                             / link=logit dist=binary;
   random int / subject=center;
   random _residual_ / subject=id(center) type=unr;
   covtest 'CS' general 0 1 -1,
                                   0 1 0 -1,
                                   0 1 0 0 -1,
								   0 0 0 0 0 1 -1,
								   0 0 0 0 0 1 0 -1,
								   0 0 0 0 0 1 0 0 -1,
								   0 0 0 0 0 1 0 0 0 -1,
                                   0 0 0 0 0 1 0 0 0 0 -1 / estimates;
run;
/*** More on Repeated Measures Data Analysis ***/
ods graphics on;
proc glimmix data=resp plots=oddsratio;
   class id center sex treatment visit;
   model outcome (event='1') = sex|treatment visit age baseline
                             / link=logit dist=binary oddsratio;
   random int / subject=center;
   random _residual_ / subject=id(center) type=ar(1);
   lsmeans sex*treatment / slice=sex slicediff=sex ilink diff oddsratio 
                           plots=meanplot(sliceby=sex join);
run;
ods graphics off;


proc glimmix data=resp;
   class id center sex treatment visit;
   model outcome (event='1') = sex|treatment visit age baseline
                             / dist=binary link=logit solution;
   random int / subject=center solution ;
   random int / subject=id(center) solution ;
   output out=gout pred=pred pred(ilink)=predilink;
run;

proc print data=gout;
run;


proc glimmix data=resp;
   class id center sex treatment visit;
   model outcome (event='1') = sex|treatment visit age baseline
                             / dist=binary link=logit solution;
   random int / subject=center solution;
   random _residual_ / subject=id(center) type=ar(1) ;
   output out=rout pred=pred pred(ilink)=predilink;
run;

proc print data=rout;
run;

proc glimmix data=resp;
   class id center sex treatment visit;
   model outcome (event='1') = sex|treatment visit age baseline
                             / dist=binary link=logit solution;
   random int / subject=id(center) vcorr v ;
run;

proc glimmix data=resp;
   class id center sex treatment visit;
   model outcome (event='1') = sex|treatment visit age baseline
                             / dist=binary link=logit solution;
   random _residual_ / subject=id(center) type=ar(1) vcorr v;
run;
