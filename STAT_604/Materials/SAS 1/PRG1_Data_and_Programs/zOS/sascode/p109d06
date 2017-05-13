********** IF-THEN DELETE Statement **********;
data work.december;
   set orion.sales;
   where Country='AU';
   BonusMonth=month(Hire_Date);
   if BonusMonth ne 12 then delete;
   Bonus=500;
   Compensation=sum(Salary,Bonus);
run;

proc print data=work.december;
   var Employee_ID Bonus BonusMonth Compensation;
run;

********** Subsetting IF Statement **********;
data work.december;
   set orion.sales;
   where Country='AU';
   BonusMonth=month(Hire_Date);
   if BonusMonth=12;
   Bonus=500;
   Compensation=sum(Salary,Bonus);
run;

proc print data=work.december;
   var Employee_ID Bonus BonusMonth Compensation;
run;


