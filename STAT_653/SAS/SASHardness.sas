Data Hardness;
input Pattern TipType$ Hardness;
datalines;
1 Purple 9.3
2 Green	9.4
1 Purple 9.4
3 Orange 9.2
2 Green	9.3
4 Blue	9.7
2 Green	9.9
1 Purple 9.6
3 Orange 9.4
3 Orange 9.5
2 Green	9.8
3 Orange 9.7
4 Blue 9.6
1 Purple 10
4 Blue 10
4 Blue 10.2
;
run;
title1 'Analysis of Variance for One-Way Classification';
proc print data=Hardness;
run;
proc sort data=Hardness;
by TipType;
run;
proc univariate data=Hardness plots;
/* by TipType; */
run;
/* Fixed factor*/
proc glm data=hardness; 
class TipType;
model Hardness=TipType;
contrast "blue versus green" TipType 1 -1 0 0;
estimate "blue versus green" TipType 1 -1 0 0;
contrast "blue versus others" TipType 3 -1 -1 -1;
estimate "blue versus others" TipType 3 -1 -1 -1 / divisor=3;
estimate "mean hardness for orange" intercept 1 TipType 0 0 1 0 ;
means TipType / hovtest=bf;
lsmeans TipType / cl;
run;
proc glmpower data=hardness;
class TipType;
model Hardness=TipType;
power
      stddev = 0.274621
      alpha  = 0.05
      ntotal = 16
      power  = .;
run;
proc power;
onewayanova alpha=.05 test=overall
groupmeans=(9.45 9.575 9.6 9.875) npergroup=4 stddev=0.274621
power=.;
run;
/* Random factor*/
proc mixed data=hardness covtest cl; 
class TipType;
model Hardness=;
random TipType;
run;

