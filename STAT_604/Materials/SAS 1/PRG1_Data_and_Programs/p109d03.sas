********** IF-THEN / ELSE Statements **********;
data work.bonus;
   set orion.sales;
   if Country='US' then Bonus=500;
   else if Country='AU' then Bonus=300;
run;

proc print data=work.bonus;
   var First_Name Last_Name Country Bonus;
run;

********** ELSE Statement **********;
data work.bonus;
   set orion.sales;
   if Country='US' then Bonus=500;
   else Bonus=300;
run;

proc print data=work.bonus;
   var First_Name Last_Name Country Bonus;
run;
