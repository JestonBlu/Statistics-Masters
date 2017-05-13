********** Cleaning Country **********;
data work.clean;
   set orion.nonsales; 
   Country=upcase(Country);
run;

proc print data=work.clean;
   var Employee_ID Job_Title Country;
run;

********** Add Cleaning Salary **********;
data work.clean;
   set orion.nonsales; 
   Country=upcase(Country);
   if Employee_ID=120106 then Salary=26960;
   if Employee_ID=120115 then Salary=26500;
   if Employee_ID=120191 then Salary=24015;
run;

proc print data=work.clean;
   var Employee_ID Salary Job_Title Country;
run;

data work.clean;
   set orion.nonsales; 
   Country=upcase(Country);
   if Employee_ID=120106 then Salary=26960;
   else if Employee_ID=120115 then Salary=26500;
   else if Employee_ID=120191 then Salary=24015;
run;

proc print data=work.clean;
   var Employee_ID Salary Job_Title Country;
run;

********** Add Cleaning Hire_Date **********;
data work.clean;
   set orion.nonsales; 
   Country=upcase(Country);
   if Employee_ID=120106 then Salary=26960;
   else if Employee_ID=120115 then Salary=26500;
   else if Employee_ID=120191 then Salary=24015;
   else if Employee_ID=120107 then 
           Hire_Date='21JAN1995'd;
   else if Employee_ID=120111 then 
           Hire_Date='01NOV1978'd;
   else if Employee_ID=121011 then 
           Hire_Date='01JAN1998'd;
run;

proc print data=work.clean;
   var Employee_ID Salary Job_Title Country Hire_Date;
run;
