proc freq data=orion.nonsales;
   tables Gender Country;
run;

proc freq data=orion.nonsales;
   tables Employee_ID;
run;

proc freq data=orion.nonsales nlevels;
   tables Gender Country Employee_ID;
run;

proc freq data=orion.nonsales nlevels;
   tables Gender Country Employee_ID / noprint;
run;

proc freq data=orion.nonsales nlevels;
   tables _all_ / noprint;
run;
