********** &SYSDATE and &SYSTIME **********;
proc freq data=orion.sales;
   tables Gender Country;
   title1 'Orion Star Sales Employee Listing';
   title2 "Created on &sysdate9 at &systime";
run;

********** %LET with %SYSFUNC **********;
%let currentdate=%sysfunc(today(),worddate.);
%let currenttime=%sysfunc(time(),timeampm.);

proc freq data=orion.sales;
   tables Gender Country;
   title1 'Orion Star Employee Listing';
   title2 "Created &currentdate";
   title3 "at &currenttime";
run;

title;
