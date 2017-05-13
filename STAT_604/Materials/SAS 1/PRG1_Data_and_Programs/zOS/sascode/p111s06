data otherstatus;
   set orion.employee_payroll;
   keep Employee_ID Employee_Hire_Date;
   if Marital_Status='O';
   label Employee_ID='Employee Number'
         Employee_Hire_Date='Hired';
   format Employee_Hire_Date yymmddp10.;
run;

title 'Employees who are listed with Marital Status=O';
proc print data=otherstatus label;
run;

proc contents data=otherstatus;
run;

proc freq data=otherstatus;
   tables Employee_Hire_Date;
   label Employee_Hire_Date='Quarter Hired';
   format Employee_Hire_Date yyq6.;
run;
