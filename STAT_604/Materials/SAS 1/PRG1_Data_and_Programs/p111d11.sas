********** ODS HTML **********;
ods html file='myreport.html';
proc freq data=orion.sales;
   tables Country;
run;
ods html close;

********** ODS PDF **********;
ods pdf file='myreport.pdf';
proc freq data=orion.sales;
   tables Country;
run;
ods pdf close;

********** ODS RTF **********;
ods rtf file='myreport.rtf';
proc freq data=orion.sales;
   tables Country;
run;
ods rtf close;

********** Single Destination **********;
ods listing close;

ods html file='example.html';

proc freq data=orion.sales;
   tables Country;
run;

ods html close;

ods listing;

********** Multiple Destinations **********;
ods listing;
ods pdf file='example.pdf';
ods rtf file='example.rtf';

proc freq data=orion.sales;
   tables Country;
run;

ods pdf close;
ods rtf close;

********** Multiple Destinations with _ALL_ **********;
ods listing;
ods pdf file='example.pdf';
ods rtf file='example.rtf';

proc freq data=orion.sales;
   tables Country;
run;

ods _all_ close;
ods listing;

********** Multiple Procedures **********;
ods listing;
ods pdf file='example.pdf';
ods rtf file='example.rtf';

proc freq data=orion.sales;
   tables Country;
run;

proc means data=orion.sales;
   var Salary;
run;

ods _all_ close;
ods listing;

********** File Location **********;
ods html file='s:\workshop\example.html';

proc freq data=orion.sales;
   tables Country;
run;

proc means data=orion.sales;
   var Salary;
run;

ods html close;

********** z/OS (OS/390) Example **********;
ods html file='.workshop.report(example)' rs=none;

proc freq data=orion.sales;
   tables Country;
run;

ods html close;



