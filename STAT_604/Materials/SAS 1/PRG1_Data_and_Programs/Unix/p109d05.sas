********** Incorrect WHERE Statement **********;
data work.december;
   set orion.sales;
   BonusMonth=month(Hire_Date);
   Bonus=500;
   Compensation=sum(Salary,Bonus);
   where Country='AU' and BonusMonth=12;
run;

proc print data=work.december;
   var Employee_ID Bonus BonusMonth Compensation;
run;

********** WHERE and Subsetting IF Statements **********;
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

********** Subsetting IF Statement **********;
data work.december;
   set orion.sales;
   BonusMonth=month(Hire_Date);
   if Country='AU' and BonusMonth=12;
   Bonus=500;
   Compensation=sum(Salary,Bonus);
run;

proc print data=work.december;
   var Employee_ID Bonus BonusMonth Compensation;
run;



