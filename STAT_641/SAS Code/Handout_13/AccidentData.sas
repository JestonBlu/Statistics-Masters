*The following program will calculate the ;
*Chi-square Homogeneity of Proportions Test;
*for Accident Example from Handout 11;


OPTIONS PS=55 LS=75 NOCENTER NODATE;
DATA CAT;
INPUT Injury $ Location $ CNT @@;
CARDS;
I 1  35   NI 1 115
I 2  36   NI 2 114
I 3  46   NI 3 104
I 4  20   NI 4 130
I 5  24   NI 5 126
RUN;
PROC FREQ; TABLES Injury*Location/EXPECTED CELLCHI2 CHISQ;
WEIGHT CNT;
EXACT CHISQ;
RUN;
