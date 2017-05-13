data Q1Birthdays;
   set orion.employee_payroll;
   BirthMonth=month(Birth_Date);
   if BirthMonth le 3;
run;

proc format;
   value $gender
      'F'='Female'
      'M'='Male';
   value moname
       1='January'
       2='February'
       3='March';
run;

proc freq data=Q1Birthdays;
   tables BirthMonth Employee_Gender;
   format Employee_Gender $gender.
          BirthMonth moname.;
   title 'Employees with Birthdays in Q1';
run;
