proc import out=test
  datafile='\\sf1\Users\faculty\derya\My Documents\Stat653\Spring17\LectureDatasets\Waterquality.jmp'
  /* notice that the address I typed in quotes is the directory for the file in my computer */
  dbms=JMP replace;
  /* if the file ise excel or csv, use excel or csv instead of jmp above writing dbms */
  run;
/*** PROC SGPLOT and PROC MIXED ***/
proc sgplot data=test;
   series x=Event y=logTSS / group=Location;
   title 'logTSS vs Location';
run;
title;

proc sgplot data=test;
   vbox logTSS / category=Location;
run;
/*** PROC MIXED, block is random ***/
proc mixed data=test covtest;
   class Location Event;
   model logTSS=Location / e3;
   random Event;
run; 
/*** PROC MIXED, block is random. deniominator df for the fixed affects is KenwardRoger ***/
proc mixed data=test covtest;
   class Location Event;
   model logTSS=Location / e3 ddfm=kr;
   random Event;
run; 
/*** PROC MIXED , block is fixed ***/
proc mixed data=test covtest;
   class Location Event;
   model logTSS=Event Location/ e3;

run; 

