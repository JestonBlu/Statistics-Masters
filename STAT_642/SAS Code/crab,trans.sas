* crab.sas;
* The relationship between different habitats and the population densities of
Hermit crabs. There are 6 sites. At each site 25 transects are run and the
number of crabs are counted.;

option ls=120 ps=55 nocenter nodate;
title 'Hermit Crab Density';
data count;
infile 'u:\meth2\kuehl\expl4-1.dat';
input Y Site;
label Y = 'Crab Count';

*analysis of transformed data;
data trans;
set count;
label TY1 = 'Transformed Count #2';
TY1=(Y+1/6)**(-.4);
proc boxplot;
plot ty1*site/boxstyle=schematic;
run;
proc glm data=trans;
class Site;
model  TY1 = Site;
*Levine's Test;
means Site/hovtest=bf;
means Site/ tukey;
output out=ASSUMP1 r=RESID1 p=MEANS;
proc univariate def=5 plot normal; var RESID1;
proc rank normal=blom; var RESID1; ranks NQUANT1;
proc plot; plot RESID1*NQUANT1;
label RESID1='Residuals1' NQUANT1='Normal Quantiles1';
run;


