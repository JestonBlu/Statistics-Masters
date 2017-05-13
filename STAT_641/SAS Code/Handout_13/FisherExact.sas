

*The following example illustrates the Fisher Exact Test;

DATA CAT;
INPUT Result $ Drug $ CNT @@;
CARDS;
S P  14   F P  7
S PV 38   F PV 4
RUN;
PROC FREQ; TABLES Result*Drug/EXPECTED CELLCHI2 CHISQ;
WEIGHT CNT;
EXACT CHISQ;
RUN;
