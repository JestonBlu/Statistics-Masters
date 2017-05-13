ods html; ods graphics on;
* placket_burman.sas
* Analysis of Plackett-Burman  fractional factorial design;
option ls=75 ps=55 nocenter nodate formdlim='*';
data chem;
input run $ f1 $ f2 $ f3 $ f4 $ f5 $ f6 $ f7 $ f8  $ f9 $ f10  $ Y;
cards;
      1  +1    -1   -1   -1   +1   -1   -1   +1   +1    -1  91  
      2  -1    -1   -1   +1   -1   -1   +1   +1   -1    +1  97
      3  -1    -1   +1   -1   -1   +1   +1   -1   +1    -1  89 
      4  -1    +1   -1   -1   +1   +1   -1   +1   -1    +1  82  
      5  +1    -1   -1   +1   +1   -1   +1   -1   +1    +1  82
      6  -1    -1   +1   +1   -1   +1   -1   +1   +1    +1  74  
      7  -1    +1   +1   -1   +1   -1   +1   +1   +1    +1  54 
      8  +1    +1   -1   +1   -1   +1   +1   +1   +1    -1  66  
      9  +1    -1   +1   -1   +1   +1   +1   +1   -1    -1  79 
     10  -1    +1   -1   +1   +1   +1   +1   -1   -1    -1  25
     11  +1    -1   +1   +1   +1   +1   -1   -1   -1    +1  77 
     12  -1    +1   +1   +1   +1   -1   -1   -1   +1    -1  44  
     13  +1    +1   +1   +1   -1   -1   -1   +1   -1    -1  86  
     14  +1    +1   +1   -1   -1   -1   +1   -1   -1    +1  97
     15  +1    +1   -1   -1   -1   +1   -1   -1   +1    +1  84
     16  -1    -1   -1   -1   -1   -1   -1   -1   -1    -1  97

run;
proc print;
run;
proc glm;
class f1-f10;
model Y = f1-f10;
estimate 'f1' f1 1 -1;
estimate 'f2' f2 1 -1;
estimate 'f3' f3 1 -1;
estimate 'f4' f4 1 -1;
estimate 'f5' f5 1 -1;
estimate 'f6' f6 1 -1;
estimate 'f7' f7 1 -1;
estimate 'f8' f8 1 -1;
estimate 'f9' f9 1 -1;
estimate 'f10' f10 1 -1;
run;
data contrast;
input parameter $ effects @@;
cards;
F1  12.5 F2  -18.5 F3   -3 F4   -15.25 F5   -19.5 F6   -9 
 F7  -5.75 F8   4.25 F9   -7 F10   8.75
run;
proc print;
var parameter effects;
proc rank out=new1 normal=blom;
var effects; ranks nquant;
label nquant = 'normal quantiles';
proc gplot; plot effects*nquant=parameter;
title 'Placket Burman Design';
title2 'Normal Probability Plot of Effects';
run;
ods graphics off;ods html close;
