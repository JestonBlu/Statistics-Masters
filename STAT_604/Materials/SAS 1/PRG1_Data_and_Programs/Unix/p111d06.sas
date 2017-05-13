********** FORMAT Statement with PROC PRINT **********;
proc print data=orion.sales label;
   var Employee_ID Job_Title Salary 
       Country Birth_Date Hire_Date;
   label Employee_ID='Sales ID'
         Job_Title='Job Title'
         Salary='Annual Salary'
         Birth_Date='Date of Birth'
         Hire_Date='Date of Hire';
   format Salary dollar10.0
          Birth_Date Hire_Date monyy7.;
run;

********** FORMAT Statement with PROC FREQ **********;
proc freq data=orion.sales;
   tables Hire_Date;
   format Hire_Date year4.;
run;

********** Permanent and Temporary Formats **********;
data orion.bonus;
   set orion.sales;
   Bonus=Salary*0.10;
   format Salary Bonus comma8.;
   keep Employee_ID First_Name 
        Last_Name Salary Bonus;
run;

proc print data=orion.bonus;
   format Bonus dollar8.;
run;

