* orthopoly.sas;
*An experiment is run to examine the relationship between the
temperature of the reaction and the percent yield of reaction.
The treatment in this example is the temperature of a chemical reaction.
There are 5 equally spaced values for the temperatures with four
experiments run at each temperature. Thus, 4 orthogonal
polynomial contrasts will be used to examine the effects of temperature
on the response variable.;
ods html;ods graphics on;
option ls=72 ps=60 nocenter nodate; 
title 'Orthogonal Polynomials';

data poly; array Y Y1-Y4;                                                    
input T  Y1-Y4; do over Y; PE=Y; output; end;                            
      drop Y1-Y4;
      label T = 'Temp of React' PE = 'Percent of Water-Gas';
cards;                                                             
550 6 4 5 5
600 32 26 24 22
650 45 45 44 34
700 63 62 44 39 
750 87 85 72 80
run;   
proc plot;
plot PE*T='*';
run;
proc glm; 
class T; 
model PE = T/ss3;                                    
contrast 'LINEAR' T -2 -1 0 1 2;
contrast 'QUADRATIC' T 2 -1 -2 -1 2; 
contrast 'CUBIC' T -1 2 0 -2 1;
contrast 'QUARTIC' T 1 -4 6 -4 1;
*simultaneous test of all 4 contrasts;
contrast '4 TREND CONTRASTS' T -2 -1 0 1 2,
                             T 2 -1 -2 -1 2, 
                             T -1 2 0 -2 1,
                             T 1 -4 6 -4 1;
run;
ods graphics off; ods html close; 
