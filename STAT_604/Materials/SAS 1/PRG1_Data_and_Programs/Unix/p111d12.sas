ods listing close;
ods html file='myreport.html';
ods pdf file='myreport.pdf';
ods rtf file='myreport.rtf';

proc freq data=orion.sales;
   tables Country;
   title 'Report 1';
run;

proc means data=orion.sales;
   var Salary;
   title 'Report 2';
run;

proc print data=orion.sales;
   var First_Name Last_Name 
       Job_Title Country Salary;
   where Salary > 75000;
   title 'Report 3';
run;

ods _all_ close;
ods listing;

title;

