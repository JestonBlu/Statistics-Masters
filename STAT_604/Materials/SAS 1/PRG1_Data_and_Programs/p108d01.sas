data work.nonsales;
   length Employee_ID 8 First $ 12 Last $ 18 
          Gender $ 1 Salary 8 Job_Title $ 25 Country $ 2
          Birth_Date Hire_Date 8;
   infile 'nonsales.csv' dlm=',';
   input Employee_ID First $ Last $ 
         Gender $ Salary Job_Title $ Country $ 
         Birth_Date :date9. 
         Hire_Date :date9.;
   format Birth_Date Hire_Date ddmmyy10.;
run;

proc print data=work.nonsales;
run;

proc print data=orion.nonsales;
   var Employee_ID Job_Title Birth_Date Hire_Date;
   where Job_Title = ' ' or 
         Birth_Date > Hire_Date;
run;

proc freq data=orion.nonsales;
   tables Gender Country;
run;

proc means data=orion.nonsales n nmiss min max;
   var Salary;
run;

proc univariate data=orion.nonsales;
   var Salary;
run;
