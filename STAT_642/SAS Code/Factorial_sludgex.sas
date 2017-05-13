
* Factorial_sludgex.sas;
* A CR designed experiment was run to investigate the concentration of
  zinc in sewage. Three cities (A,B,C), Factor1, had sludge selected
  from their sewage. Barley was grown in a media containing the sludge
  at three rates (0.5,1.0,1.5) metric tons/acre. The zinc content(ppm) in
  the barley plants was recorded.;
 ods html;ods graphics on;
option ls=80 ps=50 nocenter nodate;
OPTIONS FORMCHAR="|----|+|---+=|-/\<>*";
title 'ZINC IN SLUDGE EXAMPLE-KUEHL EX 6.3';

data raw;
array Y Y1-Y4; INPUT F1 $ F2 $ TRT $ Y1-Y4;   do over Y;
X=Y;
output; end;
      drop  Y1-Y4;
      label F1 = 'CITY' F2 = 'RATE' X = 'ZINC-CONC'
            TRT = 'CITY-RATE';
cards;
A 0.5 A05  26.4 23.5 25.4 22.9
A 1.0 A10 25.2 39.2 25.5 31.9
A 1.5 A15 26.0 44.6 35.5 38.6
B 0.5 B05  30.1 31.0 30.8 32.8
B 1.0 B10 47.7 39.1 55.3 50.7
B 1.5 B15 73.8 71.1 68.4 77.1
C 0.5 C05  19.4 19.3 18.7 19.0
C 1.0 C10 23.2 21.3 23.2 19.9
C 1.5 C15 18.9 19.8 19.6 21.9
Run;

*Analysis using Effects Model;

proc glm;
class F1 F2;
model X = F1 F2 F1*F2/ss4;
means F1 F2 F1*F2;
output out=ASSUMP r=RESID p=MEANS;
PROC PLOT; PLOT RESID*MEANS=F1/vref=0;
PROC PLOT; PLOT MEANS*F2=F1;
proc univariate def=5 plot normal; var RESID;

*Analysis using Cell Means Model;

PROC GLM;
CLASS TRT;
MODEL X = TRT/SS3;
CONTRAST  'LIN-A' TRT    -1  0  1  0  0  0  0  0  0;
CONTRAST  'LIN-B'  TRT    0  0  0 -1  0  1  0  0  0;
CONTRAST  'LIN-C'  TRT    0  0  0  0  0  0 -1  0  1;
CONTRAST  'QUAD-A' TRT    1 -2  1  0  0  0  0  0  0;
CONTRAST  'QUAD-B'  TRT   0  0  0  1 -2  1  0  0  0;
CONTRAST  'QUAD-C'  TRT   0  0  0  0  0  0  1 -2  1;

*The following commands yield a simultaneous test of
the two trend contrasts for each city;

CONTRAST  'City-A'  TRT   -1  0  1  0  0  0  0  0  0,
                    TRT    1 -2  1  0  0  0  0  0  0;
CONTRAST  'City-B'  TRT    0  0  0 -1  0  1  0  0  0,
                    TRT    0  0  0  1 -2  1  0  0  0;
CONTRAST  'City-C'  TRT    0  0  0  0  0  0 -1  0  1,
                    TRT    0  0  0  0  0  0  1 -2  1;
LSMEANS TRT/pdiff stderr adjust=tukey;
MEANS TRT/TUKEY hovtest=bf;
RUN;
proc glimmix data=raw;
class TRT;
model X=TRT;
lsmeans TRT /  plot = meanplot cl;
proc glimmix data=raw;
class F1 F2;
model X = F1 F2 F1*F2;
lsmeans F1*F2 /  plot = meanplot cl;
ods graphics off; ods html close;
