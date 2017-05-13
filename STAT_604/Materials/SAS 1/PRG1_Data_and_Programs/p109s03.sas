data work.employees;
   set orion.sales;
   FullName=catx(' ',First_Name,Last_Name);
   Yrs2012=intck('year',Hire_Date,'01JAN2012'd);
   format Hire_Date ddmmyy10.;
   label Yrs2012='Years of Employment in 2012';
run;

proc print data=work.employees label;
   var FullName Hire_Date Yrs2012;
run;
