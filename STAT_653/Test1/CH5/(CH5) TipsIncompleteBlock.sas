proc import out=test
  datafile='\\sf1\Users\faculty\derya\My Documents\Stat653\Spring17\LectureDatasets\Tips_Incomplete_Block.jmp'
  /* notice that the address I typed in quotes is the directory for the file in my computer */
  dbms=JMP replace;
  /* if the file ise excel or csv, use excel or csv instead of jmp above writing dbms */
  run;
/*** PROC SGPLOT and PROC MIXED ***/
proc sgplot data=test;
   series x=Metal_Sheet y=Hardness / group=Tip_Type;
   title 'Hardness vs Tiptype';
run;
title;

proc sgplot data=test;
   vbox Hardness / category=Tip_Type;
run;
/*** PROC MIXED, block is random ***/
proc mixed data=test covtest;
   class Tip_Type Metal_Sheet;
   model Hardness=Tip_Type / e3;
   random Metal_Sheet;
run; 
/*** PROC MIXED, block is random. deniominator df for the fixed affects is KenwardRoger ***/
proc mixed data=test covtest;
   class Tip_Type Metal_Sheet;
   model Hardness=Tip_Type / e3 ddfm=kr;
   random Metal_Sheet;
run; 
/*** PROC MIXED , block is fixed ***/
proc mixed data=test covtest;
   class Tip_Type Metal_Sheet;
   model Hardness=Metal_Sheet Tip_Type/ e3;
run; 

