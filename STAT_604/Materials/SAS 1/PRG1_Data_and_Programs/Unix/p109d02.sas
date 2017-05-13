********** DROP= and KEEP= Options **********;
data work.comp(drop=Salary Hire_Date);
   set orion.sales(keep=Employee_ID First_Name 
                        Last_Name Salary Hire_Date);
   Bonus=500;
   Compensation=sum(Salary,Bonus);
   BonusMonth=month(Hire_Date);
run;

proc print data=work.comp;
run;
