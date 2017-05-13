ods html; 
ods graphics on;
*The following program will calculate the;
*Chi-square Homogeneity of Proportions Test;
*for Example 9.6 from the Textbook;
OPTIONS PS=55 LS=75 NOCENTER NODATE;
TITLE 'TWO LEUKEMIA THERAPIES';

DATA LEU;
	INPUT DRUG $ OUTCOME $ CNT @@;
	CARDS;
PVCR S  38   
PVCR F  4
P    S  13   
P    F  8
RUN;

PROC FREQ ORDER=DATA;
	TABLES DRUG*OUTCOME/CHISQ EXPECTED CELLCHI2  RISKDIFF MEASURES;
    WEIGHT CNT;
	EXACT RISKDIFF ;
RUN;
ods graphics off;
ods html close;
