
* shrimp_3factors.sas;
ods html; ods graphics on;
option ls=75 ps=55 nocenter nodate;
OPTIONS FORMCHAR="|----|+|---+=|-/\<>*";
title 'Shrimp Cultures-3 Factor Experiment';

data shrimp;
array Y Y1-Y3; INPUT TRT $ T D  S  Y1-Y3;   do over Y;
WG=Y;
output; end;
      drop  Y1-Y3;
      label T = 'TEMPERATURE' D = 'DENSITY' S = 'SALINITY'
            WG = 'WEIGHT GAIN';
cards;
TRT01 25  80 10  86  52  73
TRT02 25  80 25 544 371 482
TRT03 25  80 40 390 290 397
TRT04 25 160 10  53  73  86
TRT05 25 160 25 393 398 208
TRT06 25 160 40 249 265 243
TRT07 35  80 10 439 436 349
TRT08 35  80 25 249 245 330
TRT09 35  80 40 247 277 205
TRT10 35 160 10 324 305 364
TRT11 35 160 25 352 267 316
TRT12 35 160 40 188 223 281
run;
proc glm;
class T D S;
model WG = T|D|S/SS3;
means S*D S*T T*D;
lsmeans  S*T*D/stderr pdiff adjust=tukey;
lsmeans  S*T*D/stderr pdiff;
contrast 'Effect Den' D 1 -1;
contrast 'SLinT25-SLinT35'   S*T 1  0 -1 -1  0  1;
contrast 'SQuadT25-SQuadT35' S*T 1 -2  1 -1  2 -1;
output out=ASSUMP r=RESID p=MEANS;
proc plot; plot resid*means;
proc univariate def=5 plot normal; var RESID;
run;
proc glm;
class trt;
model wg=trt;
means trt/hovtest=bf;
proc glimmix data=shrimp;
class T D S;
model WG = T|D|S;
lsmeans T*D*S /  plot = meanplot;
run;
ods graphics off; ods html close;
