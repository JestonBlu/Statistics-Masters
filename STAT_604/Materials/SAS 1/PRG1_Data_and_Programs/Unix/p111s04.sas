proc print data=orion.employee_payroll label;
   where Dependents=3;
   title 'Employees with 3 Dependents';
   var Employee_ID Salary
       Birth_Date Employee_Hire_Date Employee_Term_Date;
   label Employee_ID='Employee Number'
         Salary='Annual Salary'
         Birth_Date='Birth Date'
         Employee_Hire_Date='Hire Date'
         Employee_Term_Date='Termination Date';
   format Birth_Date Employee_Hire_Date Employee_Term_Date date11.
          Salary dollar11.2;
run;
