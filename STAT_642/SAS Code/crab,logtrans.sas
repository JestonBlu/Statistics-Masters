* crab_logtrans.sas;
* The relationship between different habitats and the population densities of
Hermit crabs. There are 6 sites. At each site 25 transects are run and the
number of crabs are counted.;

option ls=120 ps=55 nocenter nodate;
title 'Hermit Crab Density - LogTransformation';
data count;
infile 'u:\meth2\kuehl\expl4-1.dat';
input Y Site;
label Y = 'Crab Count';
*analysis of transformed data;
data trans;
set count;
label TY1 = 'Transformed Count log(Y+1)';
TY1 = log(Y+1);
proc boxplot;
plot ty1*site/boxstyle=schematic;
run;
proc glm data=trans;
class Site;
model  TY1 = Site;
*BFL Test;
means Site/hovtest=bf;
means Site/ tukey;
output out=ASSUMP2 r=RESID2 p=MEANS2 STUDENT=SR2;
data TRANSRESID2; set ASSUMP2; TRS2 = sqrt(abs(SR2));
proc univariate def=5 plot normal; var RESID2;
proc gplot data=ASSUMP2; plot RESID2*MEANS2;
proc gplot data=TRANSRESID2; plot TRS2*MEANS2;
run;

