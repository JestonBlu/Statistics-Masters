*twofac_uneqrep.sas;
* This is the SAS code for the Example dealing with unequal number of reps;
* The data is from a CR 2x3 factorial experiment with an unequal number of
  replications:  n11=3, n12=2, n13=4, n21=2, n22=3, n23=4;
options pagesize=60 linesize=75 nocenter nodate;
title 'Unbalanced factorial experiment with no missing treatments';
data raw;
input A B Y @@;
IF A=1 and B=1 THEN TRT=1;
IF A=1 and B=2 THEN TRT=2;
IF A=1 and B=3 THEN TRT=3;
IF A=2 and B=1 THEN TRT=4;
IF A=2 and B=2 THEN TRT=5;
IF A=2 and B=3 THEN TRT=6;

cards;
1  1 19 1 1 20 1 1 21
1  2 24 1 2 26
1  3 22 1 3 25 1 3 25 1 3 19
2  1 25 2 1 27
2  2 21 2 2 24 2 2 24
2  3 31 2 3 32 2 3 33  2 3 32
;
run;
proc glm;
class A B;
model Y=A B A*B/ss1 ss2 ss3 ss4;
means A B A*B;
lsmeans A B A*B/stderr pdiff adjust=Tukey;
RUN;
proc glm;
class TRT;
model y=TRT/ss1 ss2 ss3 ss4;

contrast  'Main A' TRT 1  1  1 -1 -1 -1;
contrast  'Main B' TRT 1 -1  0  1 -1  0,
                   TRT 1  1 -2  1  1 -2;
contrast 'A*B'     TRT 1 -1  0 -1  1  0,
                   TRT 1  1 -2 -1 -1  2;
lsmeans TRT/stderr pdiff adjust=Tukey;
run;
