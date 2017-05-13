data otherstatus;
   set orion.employee_payroll;
   keep Employee_ID Employee_Hire_Date;
   if Marital_Status='O';
run;

title 'Employees who are listed with Marital Status=O';
proc print data=otherstatus label;
run;

proc contents data=otherstatus;
run;

proc freq data=otherstatus;
   tables Employee_Hire_Date;
run;
