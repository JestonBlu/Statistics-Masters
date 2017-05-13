********** ODS LISTING **********;
ods listing;

proc freq data=orion.sales;
   tables Country;
run;

proc gchart data=orion.sales;
   hbar Country / nostats;
run;
quit;

********** ODS LISTING CLOSE **********;
ods listing close;

proc freq data=orion.sales;
   tables Country;
run;

proc gchart data=orion.sales;
   hbar Country / nostats;
run;
quit;

ods listing;
