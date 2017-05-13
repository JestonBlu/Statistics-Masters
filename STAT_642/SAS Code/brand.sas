* brand.sas;
* The stopping distance at 25 mph was measured for each of six brands of
automobile tires. There were four replications for each brand.

Brands S1 and S2 were all terrain tires
Brands B1 and B2 were bias     tires
Brands R1 and R2 were radial  tires
Brand S1 is the most widely used brand of tire
;
ods html; ods graphics on;
option ls=80 ps=50 nocenter nodate;
title 'Ecoli';
data old; array Y Y1-Y10;
input Temp $ Y1-Y10; do over Y; SD=Y; output; end;
      drop Y1-Y10;
      label Temp = 'Temperature' SD = 'Ecoli';
cards;
  T10 7.2 7.8 7.1 7.9 8.1 8.8 8.3 8.9 9.3 9.8
  T15 8.1 8.1 8.0 8.9 8.2 8.9 8.1 8.8 9.2 9.9
  T20 9.0 9.9 9.2 9.8 10.0 10.8 10.2 10.7 9.9 9.0
  T25 9.2 9.8 9.1 9.9 10.1 10.8 10.3 10.9 9.3 9.8
  T30 10.2 10.8 10.1 10.9 11.1 11.8 11.3 11.9 9.3 9.9
run;
proc glm data=old order=data;
class Temp;
model  SD=Temp;
*means Temp/hovtest=bf;
lsmeans Temp/STDERR PDIFF CL;
contrast 'T30 vs Other' Temp -1 -1 -1 -1 4;
contrast 'Linear'    Temp   -2 -1 0 1 2;
contrast 'Quadratic'  Temp   2 -1 -2 -1 2;
contrast 'Cubic' Temp   -1 2 0 -2 1;
estimate 'T30 vs Other' Temp -1 -1 -1 -1 4;
estimate 'Linear'    Temp   -2 -1 0 1 2;
estimate 'Quadratic'  Temp   2 -1 -2 -1 2;
estimate 'Cubic' Temp   -1 2 0 -2 1;
contrast 'TRT EFFECT'  Temp -1 -1 -1 -1 4,
					   Temp   -2 -1 0 1 2,
                       Temp   2 -1 -2 -1 2,
                       Temp   -1 2 0 -2 1;

run;
lsmeans   Temp/cl pdiff alpha=.05 adjust=tukey;
lsmeans   Temp/cl pdiff=controll('T10') adjust=DUNNETT alpha=.05;
run;
means Temp/hovtest=bf;
output out=ASSUMP r=RESID p=MEANS;
proc univariate def=5 plot normal; var RESID;
run;
proc gplot;
plot SD*Temp='*';
run;
ods graphics off;ods html close;



