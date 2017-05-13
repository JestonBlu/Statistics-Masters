* rbskinpotential.sas;
* the following program computes AOV for RCBD and 
*  computes SS_TRT for Friedman test;
option ls=90 ps=50 nocenter nodate formdlim='*';
title 'Analysis of RB Design';
ods html; ods graphics on;
data skinpotential;
array Y (I) Y1-Y8; INPUT TRT $ Y1-Y8;   do over Y;
SP=Y; SUBJ=I;
output; end;
      drop  I Y1-Y8;
      label TRT = 'EMOTION' SP = 'SKIN POTENTIAL';
cards;
F 26.1 81.0 10.5 26.6 12.9 57.2 25.0 20.3
H 22.7 53.2  9.7 19.6 13.8 47.1 13.6 23.6
D 22.5 53.7 10.8 21.1 13.7 39.2 13.7 16.3
C 22.6 53.1  8.3 21.6 13.3 37.0 14.8 14.8
RUN;
proc MIXED CL;
class TRT SUBJ;
model SP = TRT/residuals;
random SUBJ;
lsmeans trt/adjust=tukey;
run;
data ranks;
array Y (I) Y1-Y8; INPUT TRT $ Y1-Y8;   do over Y;
RANK=Y; SUBJ=I;
output; end;
      drop  I Y1-Y8;
      label TRT = 'EMOTION' SP = 'RANK OF SKIN POTENTIAL';
cards;
F 4 4 3 4 1 4 4 3
H 3 2 2 1 4 3 1 4
D 1 3 4 2 3 2 2 2 
C 2 1 1 3 2 1 3 1
RUN;
proc GLM DATA=RANKS;
class TRT SUBJ;
model RANK = TRT;
run;
ods graphics off; ods html close;
