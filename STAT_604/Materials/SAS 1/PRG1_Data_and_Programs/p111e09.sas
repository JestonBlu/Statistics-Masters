proc freq data=orion.employee_payroll;
   tables Employee_Term_Date;
   title 'Employee Status Report';
run;
