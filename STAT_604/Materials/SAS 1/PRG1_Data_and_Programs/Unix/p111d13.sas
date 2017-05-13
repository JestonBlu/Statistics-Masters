********** Style= with HTML **********;
ods html file='myreport.html' style=default; /*Default*/
proc freq data=orion.sales;
   tables Country;
run;
ods html close;

ods html file='myreport.html' style=sasweb;
proc freq data=orion.sales;
   tables Country;
run;
ods html close;

********** Style= with PDF **********;
ods pdf file='myreport.pdf' style=printer; /*Default*/
proc freq data=orion.sales;
   tables Country;
run;
ods pdf close;

ods pdf file='myreport.pdf' style=journal;
proc freq data=orion.sales;
   tables Country;
run;
ods pdf close;

********** Style= with RTF **********;
ods rtf file='myreport.rtf' style=rtf; /*Default*/
proc freq data=orion.sales;
   tables Country;
run;
ods rtf close;

ods rtf file='myreport.rtf' style=ocean;
proc freq data=orion.sales;
   tables Country;
run;
ods rtf close;
