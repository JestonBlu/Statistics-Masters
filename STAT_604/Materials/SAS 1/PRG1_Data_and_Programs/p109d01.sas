********** Creating Variables **********;
data work.comp;
   set orion.sales;
   Bonus=500;
   Compensation=sum(Salary,Bonus);
   BonusMonth=month(Hire_Date);
run;

********** Dropping Variables **********;
data work.comp;
   set orion.sales;
   Bonus=500;
   Compensation=sum(Salary,Bonus);
   BonusMonth=month(Hire_Date);
   drop Gender Salary Job_Title 
        Country Birth_Date Hire_Date;
run;

proc print data=work.comp;
run;
