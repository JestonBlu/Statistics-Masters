/*** Bakery Data Example, Design 1 ***/
data bakery;
   input flour $ surf $ volume;
datalines;
 1  1  5.7
 1  2  4.3
 1  3  4.5
 2  1  7.2
 2  2  4.1
 2  3  6.0
 3  1  6.9
 3  2  4.6
 3  3  6.0
 4  1  7.5
 4  2  5.4
 4  3  5.8
  ;
run;
/*** PROC SGPLOT and PROC MIXED ***/
proc sgplot data=bakery;
   series x=flour y=volume / group=surf;
   title 'Volume vs flour';
run;
title;

proc sgplot data=bakery;
   vbox volume / category=surf;
run;
/*** PROC MIXED WITH CONTRAST, ESTIMATE, LSMEANS ***/
proc mixed data=bakery covtest;
   class flour surf;
   model volume=surf / e3;
   random flour;
   estimate '1 versus 2' surf 1 -1 0;
   estimate '2 versus 3' surf 0 1 -1;
   estimate '1 versus 2&3' surf 2 -1 -1;
   estimate '1 versus 2&3' surf 1 -0.5 -0.5;
   lsmeans surf / diff cl alpha=0.10;
run; 

