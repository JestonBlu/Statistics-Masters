
ods html; ods graphics on;
option ls=75 ps=50 nocenter nodate;

title 'Storage of meat by four methods';
data old;
array Y Y1-Y5;
input T $ Y1-Y5;
do over Y;
TCOUNT=Y;
output; end;
      drop Y1-Y5;
cards;
COMM  7.66 6.98 7.80 .     .
VAC   5.26 5.44 5.80 .     .
MIXED 7.41 7.33 7.04 7.59  .
CO2   3.51 2.91 3.66 2.87 3.04
run;
proc boxplot;
plot TCOUNT*T;
RUN;
proc glimmix data=old order=data;
class T;
model  TCOUNT=T/solution;
lsmeans T/ plot = meanplot cl ;
proc glm data=old order=data;
class T;
model  TCOUNT=T/solution;
lsmeans T/stderr cl ;
means T/HOVTEST=bf;
output out=ASSUMP R=RESID P=PRED;
proc univariate def=5 plot normal; var RESID;
run;
ods graphics off; ods html close;
