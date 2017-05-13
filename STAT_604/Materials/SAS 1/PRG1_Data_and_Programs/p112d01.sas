proc freq data=orion.sales;
run;

proc freq data=orion.sales;
   tables Gender Country;
run; 

proc freq data=orion.sales;
   tables Gender*Country;
run;

********** Additional Statements **********;
proc format;
   value $ctryfmt 'AU'='Australia'
                  'US'='United States';
run;

options nodate pageno=1;

ods html file='p112d01.html';
proc freq data=orion.sales;
   tables Gender*Country;
   where Job_Title contains 'Rep';
   format Country $ctryfmt.;
   title 'Sales Rep Frequency Report';
run;
ods html close;

********** Options to Suppress Display of Statistics **********;
proc freq data=orion.sales;
   tables Gender Country / nocum nopercent;
run; 

proc freq data=orion.sales;
   tables Gender*Country / nopercent norow nocol;
run;

********** Additional TABLES Statement Options **********;
proc freq data=orion.sales;
   tables Gender*Country / list;
   format Country $ctryfmt.;
run; 

proc freq data=orion.sales;
   tables Gender*Country / crosslist;
   format Country $ctryfmt.;
run;

proc freq data=orion.sales;
   tables Gender*Country / format=12.;
   format Country $ctryfmt.;
run;

********** PROC FREQ Statement Options **********;
options pageno=1;
proc freq data=orion.sales;
   tables Gender Country Employee_ID;
run;

options pageno=1;
proc freq data=orion.sales nlevels;
   tables Gender Country Employee_ID;
run;

options pageno=1;
proc freq data=orion.sales nlevels;
   tables Gender Country Employee_ID / noprint;
run;

options pageno=1;
proc freq data=orion.sales nlevels;
   tables _all_ / noprint;
run;

options pageno=1;
proc freq data=orion.sales page;
   tables Gender Country Employee_ID;
run;

options pageno=1;
proc freq data=orion.sales compress;
   tables Gender Country Employee_ID;
run;
