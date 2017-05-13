********** WHERE Statement with PROC PRINT **********;
proc print data=orion.sales;
   var First_Name Last_Name 
       Job_Title Country Salary;
   where Salary > 75000;
run;

********** WHERE Statement with PROC MEANS **********;
proc means data=orion.sales;
   var Salary;
   where Country = 'AU';
run;

