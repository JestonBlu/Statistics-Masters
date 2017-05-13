/*** Toy Data, Chapter 2 ***/
data toy;     
   length toy $1;
   input toy $ adhesive $ pressure @@;
datalines;
1 c 67.0 1 b 71.9 1 a 72.2
2 c 67.5 2 b 68.8 2 a 66.4
3 c 76.0 3 b 82.6 3 a 74.5
4 c 72.7 4 b 78.1 4 a 67.3
5 c 73.1 5 b 74.2 5 a 73.2
6 c 65.8 6 b 70.8 6 a 68.7
7 c 75.6 7 b 84.9 7 a 69.0
;
run;
/*** PROC SGPLOT and PROC MIXED ***/
proc sgplot data=toy;
   series x=toy y=pressure / group=adhesive;
   title 'Pressure vs Toy Number';
run;
title;

proc sgplot data=toy;
   vbox pressure / category=adhesive;
run;

proc mixed data=toy covtest;
   class adhesive toy;
   model pressure=adhesive / e3;
   random toy;
run; 
/*** PROC MIXED WITH CONTRAST, ESTIMATE, LSMEANS ***/
proc mixed data=toy ;
   class toy adhesive;
   model pressure=adhesive;
   random toy;
   contrast 'adhesive a vs b' adhesive 1 -1 0;
   estimate 'adhesive a vs b' adhesive 1 -1 0;
   estimate 'adhesive c mean' intercept 1 adhesive 0 0 1;
   lsmeans adhesive / diff cl alpha=0.10;
run;     
 /*** PROC GLMMOD ***/
proc glmmod data=toy ;
   class adhesive toy;
   model pressure=adhesive toy;
run;    
