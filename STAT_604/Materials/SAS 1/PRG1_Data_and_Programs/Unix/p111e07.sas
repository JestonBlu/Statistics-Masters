data Q1Birthdays;
   set orion.employee_payroll;
   BirthMonth=month(Birth_Date);
   if BirthMonth le 3;
run;

proc freq data=Q1Birthdays;
   tables BirthMonth Employee_Gender;
   title 'Employees with Birthdays in Q1';
run;
