data work.subset1;
   set orion.sales;
   where Country='AU' and 
         Job_Title contains 'Rep';
   keep First_Name Last_Name Salary 
        Job_Title Hire_Date;
   label Job_Title='Sales Title'
         Hire_Date='Date Hired';
run;

proc contents data=work.subset1;
run;

proc print data=work.subset1 label;
run;
