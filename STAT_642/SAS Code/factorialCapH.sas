ods html; ods graphics on;
* factorialCapH.sas
 A CR designed experiment was run to investigate the affect of
 3 levels of Ca: 100, 200, 300 and 4 levels of pH: 4, 5, 6, 7 on the increase
 in tree diameter.
 Three trees were randomly assigned to each of the 12 treatments;

option ls=80 ps=50 nocenter nodate;
OPTIONS FORMCHAR="|----|+|---+=|-/\<>*";
title 'Effect of Ca and pH on Tree Growth';
data RAW;
input TRT $ pH $ Ca $ y @@;
cards;
T01 4 100 5.2  T05 4 200 7.6  T09  4 300 6.4
T01 4 100 5.9  T05 4 200 7.0  T09  4 300 6.7
T01 4 100 6.3  T05 4 200 7.6  T09  4 300 6.1
T02 5 100 7.1  T06 5 200 7.5  T10 5 300 7.3
T02 5 100 7.3  T06 5 200 7.3  T10 5 300 7.5
T02 5 100 7.5  T06 5 200 7.1  T10 5 300 7.4
T03 6 100 7.6  T07 6 200 7.6  T11 6 300 7.2
T03 6 100 7.2  T07 6 200 7.4  T11 6 300 7.3
T03 6 100 7.4  T07 6 200 7.8  T11 6 300 7.1
T04 7 100 7.2  T08 7 200 7.4  T12 7 300 6.8
T04 7 100 7.5  T08 7 200 7.0  T12 7 300 6.6
T04 7 100 7.2  T08 7 200 6.9  T12 7 300 6.4
run;
TITLE "ANALYSIS OF FACTORIAL TREATMENT STRUCTURE";
proc glm ;
class Ca pH;
model Y = pH Ca pH*Ca/SS3;
contrast 'Linear Trend in Ca'  Ca -1  0 1;
contrast 'Quad Trend in Ca'    Ca  1 -2 1;
contrast 'Linear Trend in pH'  pH -3 -1  1 3;
contrast 'Quad Trend in pH'    pH  1 -1 -1 1;
contrast 'Cubic Trend in pH'   pH -1  3 -3 1;
contrast  'INTER1'             Ca*pH   3  1 -1 -3  0  0  0  0 -3 -1  1  3;
contrast  'INTER2'             Ca*pH  -1  1  1 -1  0  0  0  0  1 -1 -1  1;
contrast  'INTER3'             Ca*pH   1 -3  3 -1  0  0  0  0 -1  3 -3  1;
contrast  'INTER4'             Ca*pH  -3 -1  1  3  6  2 -2 -6 -3 -1  1  3;
contrast  'INTER5'             Ca*pH   1 -1 -1  1 -2  2  2 -2  1 -1 -1  1;
contrast  'INTER6'             Ca*pH  -1  3 -3  1  2 -6  6 -2 -1  3 -3  1;
contrast  'MAIN OF Ca'         Ca  -1  0 1,
                               Ca   1 -2 1;
contrast  'Main of pH'         pH -3 -1  1 3,
                               pH  1 -1 -1 1,
                               pH -1  3 -3 1;
contrast  'INTERACTION'        Ca*pH   3  1 -1 -3  0  0  0  0 -3 -1  1  3,
                               Ca*pH  -3 -1  1  3  6  2 -2 -6 -3 -1  1  3,
                               Ca*pH  -1  1  1 -1  0  0  0  0  1 -1 -1  1,
                               Ca*pH   1 -1 -1  1 -2  2  2 -2  1 -1 -1  1,
                               Ca*pH   1 -3  3 -1  0  0  0  0 -1  3 -3  1,
                               Ca*pH  -1  3 -3  1  2 -6  6 -2 -1  3 -3  1;

lsmeans Ca pH Ca*pH/stderr pdiff adjust=tukey;
RUN;
TITLE "ANALYSIS OF Cell Means Model";
PROC GLM DATA=RAW;
CLASS TRT;
MODEL Y=TRT/SS3;
contrast 'Linear Trend in Ca'  TRT  -1 -1 -1 -1  0  0  0  0  1  1  1  1;
contrast 'Quad Trend in Ca'    TRT   1  1  1  1 -2 -2 -2 -2  1  1  1  1;
contrast 'Linear Trend in pH'  TRT  -3 -1  1  3 -3 -1  1  3 -3 -1  1  3;
contrast 'Quad Trend in pH'    TRT   1 -1 -1  1  1 -1 -1  1  1 -1 -1  1;
contrast 'Cubic Trend in pH'   TRT  -1  3 -3  1 -1  3 -3  1 -1  3 -3  1;
contrast  'INTER1'             TRT   3  1 -1 -3  0  0  0  0 -3 -1  1  3;
contrast  'INTER2'             TRT  -1  1  1 -1  0  0  0  0  1 -1 -1  1;
contrast  'INTER3'             TRT   1 -3  3 -1  0  0  0  0 -1  3 -3  1;
contrast  'INTER4'             TRT  -3 -1  1  3  6  2 -2 -6 -3 -1  1  3;
contrast  'INTER5'             TRT   1 -1 -1  1 -2  2  2 -2  1 -1 -1  1;
contrast  'INTER6'             TRT  -1  3 -3  1  2 -6  6 -2 -1  3 -3  1;
output out=ASSUMP R=resid P=means;
means TRT/hovtest=bf;
lsmeans TRT/stderr pdiff adjust = Tukey;
PROC PLOT; 
PLOT RESID*TRT/VREF=0;
PROC UNIVARIATE DEF=5 PLOT NORMAL;
VAR RESID;
RUN;
proc glimmix data=raw;
class trt;
model y=trt;
lsmeans TRT /  plot = meanplot cl;
proc glimmix data=raw;
class Ca pH;
model y=Ca pH Ca*pH;
lsmeans Ca*pH /  plot = meanplot cl;
run;
ods graphics off; ods html close;
