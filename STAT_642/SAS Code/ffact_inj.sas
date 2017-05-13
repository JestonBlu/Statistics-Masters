
ods html; ods graphics on;
*ffact_inj.sas
* A fractional factorial design (2^8-4);
option ls=75 ps=55 nocenter nodate formdlim='*';
data chem;
input v1 $ v2 $ v3 $ v4 $ v5 $ v6 $ v7 $ v8  $ Y;
cards;
L L L H H H L H 14.0
H L L L L H H H 16.8
L H L L H L H H 15.0
H H L H L L L H 15.4
L L H H L L H H 27.6
H L H L H L L H 24.0
L H H L L H L H 27.4
H H H H H H H H 22.6
H H H L L L H L 22.3
L H H H H L L L 17.1
H L H H L H L L 21.5
L L H L H H H L 17.5
H H L L H H L L 15.9
L H L H L H H L 21.9
H L L H H L H L 16.7
L L L L L L L L 20.3
run;
proc print;
run;
proc glm;
class v1-v8;
model Y = v1-v8 v1*v2 v1*v3 v1*v4 v1*v5 v1*v6 v1*v7 v1*v8;
estimate 'v1' v1 1 -1;
estimate 'v2' v2 1 -1;
estimate 'v3' v3 1 -1;
estimate 'v4' v4 1 -1;
estimate 'v5' v5 1 -1;
estimate 'v6' v6 1 -1;
estimate 'v7' v7 1 -1;
estimate 'v8' v8 1 -1;
estimate 'v1*v2' v1*v2 1 -1 -1 1;
estimate 'v1*v3' v1*v3 1 -1 -1 1;
estimate 'v1*v4' v1*v4 1 -1 -1 1;
estimate 'v1*v5' v1*v5 1 -1 -1 1;
estimate 'v1*v6' v1*v6 1 -1 -1 1;
estimate 'v1*v7' v1*v7 1 -1 -1 1;
estimate 'v1*v8' v1*v8 1 -1 -1 1;
run;
data contrast;
input parameter $ effects @@;
cards;
v1 -0.7 v2   -0.1 v3   5.5 v4  -0.3 v5  -3.8 v6 -0.1 v7  0.6 v8 1.2 v1*v2 -1.2  v1*v3 1.8 
v1*v4 -0.8 v1*v5  9.2 v1*v6 -0.6 v1*v7  -0.4 v1*v8  -1.2
run;
proc print;
var effects;
proc rank out=new1 normal=blom;
var effects; ranks nquant;
label nquant = 'normal quantiles';
proc gplot; plot effects*nquant=parameter;
title 'Injection Molding';
title2 'Normal Probability Plot of Effects';
run;
ods graphics off;ods html close;
