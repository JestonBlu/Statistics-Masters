proc print data=orion.employee_payroll;
   where Dependents=3;
   title 'Employees with 3 Dependents';
   var Employee_ID Salary
       Birth_Date Employee_Hire_Date Employee_Term_Date;
run;
