* ~longneck/meth2/sas/lsdesign.sas;
option ls=90 ps=60 nocenter nodate; 
title 'Latin Square Design EXAMPLE';

data leather; 
DO I=1 to 4;DO J=1 to 4;INPUT TRT $ Y @@; 
AR=Y; RUN=I; POSITION=J;
output; end;END;                            
      drop  I J Y;
      label TRT = 'GRADE OF LEATHER' AR = 'ABRASION RESISTANCE';
cards;                                                             
G3 31 G4 43 G1 67 G2 36
G4 39 G1 96 G2 40 G3 48
G2 57 G3 33 G4 40 G1 84
G1 85 G2 46 G3 48 G4 50 
RUN;
TITLE 'PROC GLM RESULTS';
PROC GLM;
CLASS TRT RUN POSITION;
MODEL AR = TRT RUN POSITION/ SS3;  
RANDOM RUN POSITION/TEST; 
LSMEANS TRT/STDERR PDIFF ADJUST=TUKEY ;
RUN;
TITLE 'PROC MIXED RESULTS - DEFAULT';
PROC MIXED CL ALPHA=.05;
CLASS TRT RUN POSITION;
MODEL AR = TRT ; 
RANDOM RUN POSITION;          
LSMEANS TRT/ADJUST=TUKEY cl alpha=.05;
RUN;
TITLE 'PROC MIXED RESULTS - KR';
PROC MIXED CL ALPHA=.05;
CLASS TRT RUN POSITION;
MODEL AR = TRT / DDFM=KR; 
RANDOM RUN POSITION;          
LSMEANS TRT/ADJUST=TUKEY cl alpha=.05;
RUN;
