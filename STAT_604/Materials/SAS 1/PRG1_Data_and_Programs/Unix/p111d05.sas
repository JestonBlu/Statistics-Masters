********** LABEL Statement with PROC FREQ **********;
proc freq data=orion.sales;
   tables Gender Country;
   label Gender='Sales Employee Gender';
run;

********** LABEL Statement with PROC PRINT **********;
proc print data=orion.sales;
   var Employee_ID Job_Title Salary;
   label Employee_ID='Sales ID'
         Job_Title='Job Title'
         Salary='Annual Salary';
run;

********** LABEL Option with PROC PRINT **********;
proc print data=orion.sales label;
   var Employee_ID Job_Title Salary;
   label Employee_ID='Sales ID'
         Job_Title='Job Title'
         Salary='Annual Salary';
run;

********** SPLIT= Option with PROC PRINT **********;
proc print data=orion.sales split='*';
   var Employee_ID Job_Title Salary;
   label Employee_ID='Sales ID'
         Job_Title='Job*Title'
         Salary='Annual*Salary';
run;

********** Permanent Labels **********;
data orion.bonus;
   set orion.sales;
   Bonus=Salary*0.10;
   label Salary='Annual*Salary'
         Bonus='Annual*Bonus';
   keep Employee_ID First_Name 
        Last_Name Salary Bonus;
run;

proc print data=orion.bonus split='*';
run;

********** Temporary versus Permanent Labels **********;
data orion.bonus;
   set orion.sales;
   Bonus=Salary*0.10;
   label Bonus='Annual Bonus';
run;

proc print data=orion.bonus label;
   label Bonus='Mid-Year Bonus';
run;



