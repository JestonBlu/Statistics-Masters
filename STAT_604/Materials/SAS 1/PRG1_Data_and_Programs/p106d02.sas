libname orionxls 'sales.xls';

data work.subset2;
   set orionxls.'Australia$'n;
   where Job_Title contains 'Rep';
   keep First_Name Last_Name Salary 
        Job_Title Hire_Date;
   label Job_Title='Sales Title'
         Hire_Date='Date Hired';
   format Salary comma10. Hire_Date weekdate.;
run;

proc contents data=work.subset2;
run;

proc print data=work.subset2 label;
run;

libname orionxls clear;
