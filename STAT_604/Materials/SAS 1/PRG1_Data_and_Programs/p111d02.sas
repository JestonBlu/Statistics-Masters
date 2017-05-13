options ls=80 date number;

proc means data=orion.sales;
   var Salary;
run;

options nodate pageno=1;

proc freq data=orion.sales;
   tables Country;
run;

options ls=95;

