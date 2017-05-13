proc contents data=orion.sales;
run;

proc contents data=orion.nonsales;
run;

data work.allemployees;
   set orion.sales 
       orion.nonsales(rename=(First=First_Name Last=Last_Name));
   keep Employee_ID First_Name Last_Name Job_Title Salary;
run;

proc print data=work.allemployees;
run;
