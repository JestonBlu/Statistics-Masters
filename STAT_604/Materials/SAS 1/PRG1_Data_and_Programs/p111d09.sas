proc sort data=orion.sales out=work.sort;
   by Country descending Gender Last_Name;
run;

********** BY Statement with PROC PRINT **********;
proc print data=work.sort;
   var Employee_ID First_Name Last_Name Salary;
   by Country descending Gender;
run;

********** BY Statement with PROC MEANS **********;
proc means data=work.sort;
   var Salary;
   by Country descending Gender;
run;

********** BY Statement with PROC FREQ **********;
proc freq data=work.sort;
   tables Gender;
   by Country;
run;


