proc print data=orion.nonsales;
   var Employee_ID Last Job_Title;
   where Job_Title = ' ';
run;

proc print data=orion.nonsales;
   var Employee_ID Birth_Date Hire_Date;
   where Hire_Date < '01JAN1974'd;
run;

proc print data=orion.nonsales;
   var Employee_ID Gender Salary Job_Title
       Country Birth_Date Hire_Date;
   where Employee_ID = . or
         Gender not in ('F','M') or
         Salary not between 24000 and 500000 or
         Job_Title = ' ' or
         Country not in ('AU','US') or
         Birth_Date > Hire_Date or
         Hire_Date < '01JAN1974'd;
run;
