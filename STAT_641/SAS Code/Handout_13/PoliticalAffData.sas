*The following program will calculate the ;
*Chi-square Test of Independence;
*for Political Affiliation Example from Handout 13;


OPTIONS PS=55 LS=75 NOCENTER NODATE;
DATA POL;
INPUT Party $ Income $ CNT @@;
CARDS;
Rep  I1  20      Dem  I1   68   Ind I1  5   Other I1 15
Rep  I2  84      Dem  I2  119   Ind I2 29   Other I2 54 
Rep  I3  17      Dem  I3   26   Ind I3 14   Other I3 14
Rep  I4  94      Dem  I4    7   Ind I4 16   Other I4 10 
RUN;
PROC FREQ; TABLES Party*Income/EXPECTED CELLCHI2 CHISQ;
WEIGHT CNT;
*EXACT CHISQ;
RUN;
