/*** Example with the data set trees  ***/
data trees;
   input tree day y;
   week=day/7;
   datalines;
1  118   30
1  484   58
1  664   87
1 1004  115
1 1231  120
1 1372  142
1 1582  145
2  118   33
2  484   69
2  664  111
2 1004  156
2 1231  172
2 1372  203
2 1582  203
3  118   30
3  484   51
3  664   75
3 1004  108
3 1231  115
3 1372  139
3 1582  140
4  118   32
4  484   62
4  664  112
4 1004  167
4 1231  179
4 1372  209
4 1582  214
5  118   30
5  484   49
5  664   81
5 1004  125
5 1231  142
5 1372  174
5 1582  177
;
run;
/*** Fitting a Nonlinear Mixed Model Using the NLMIXED Procedure  ***/
 
proc sgplot data=trees;
   series y=y x=week / group=tree;
   title 'Orange Trees Growth Curve';
run;
title;

proc sort data=trees;
   by tree;
run;

proc nlmixed data=trees;
   parms b1=180 b2=8 b3=0.6 s2u=10 s2e=5;
   num=b1+u;
   den=1+b2*exp(-b3*week);
   pred=num/den;
   model y ~ normal(pred, s2e);
   random u ~ normal(0, s2u) subject=tree;
   predict pred out=preddata;
run;

proc sgplot data=preddata ;
   scatter y=y x=week / group=tree;
   series y=pred x=week / group=tree name="fit";
   keylegend "fit" / title='Tree';
   title 'Predicted Orange Tree Growth Curve';
run;
title;                                  			


