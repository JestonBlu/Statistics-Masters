* transcrab.sas;
option ls=80 ps=50 nocenter nodate;
title 'Stopping Distance of 6 brands of tires';
data old; 
input Y S;
LY=log(Y);
LS=log(S);
cards;
33.80  50.39
68.72 125.35
50.64 107.44
 9.24  17.39
10.00  19.84
12.64  23.01
run;
proc reg data=old;
model  LS=LY;
run;
