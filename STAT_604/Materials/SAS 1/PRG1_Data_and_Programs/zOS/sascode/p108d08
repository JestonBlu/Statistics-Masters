data work.clean;
   set orion.nonsales; 
   Country=upcase(Country);
   if Employee_ID=120106 then Salary=26960;
   else if Employee_ID=120115 then Salary=26500;
   else if Employee_ID=120191 then Salary=24015;
   else if Employee_ID=120112 then
           Job_Title='Security Guard I';
   else if Employee_ID=120107 then 
           Hire_Date='21JAN1995'd;
   else if Employee_ID=120111 then 
           Hire_Date='01NOV1978'd;
   else if Employee_ID=121011 then 
           Hire_Date='01JAN1998'd;
   if Gender not in ('F','M') then Gender='F';
   if _N_=7 then Employee_ID=120109;
   else if _N_=14 then Employee_ID=120116;
run;

proc print data=work.clean;
   var Employee_ID Gender Salary Job_Title Country Hire_Date;
run;

********** Validating the Data **********;
proc print data=work.clean;
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

proc freq data=work.clean nlevels;
   tables Gender Country Employee_ID;
run;

proc means data=work.clean n nmiss min max;
   var Salary;
run;

proc univariate data=work.clean;
   var Salary;
run;
