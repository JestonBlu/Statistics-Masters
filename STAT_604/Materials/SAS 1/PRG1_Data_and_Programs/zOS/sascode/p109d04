********** IF-THEN DO / ELSE DO Statements **********;
data work.bonus;
   set orion.sales;
   if Country='US' then do;
      Bonus=500;
	  Freq='Once a Year';
   end;
   else if Country='AU' then do;
      Bonus=300;
	  Freq='Twice a Year';
   end;
run;

proc print data=work.bonus;
   var First_Name Last_Name Country 
       Bonus Freq;
run;

********** LENGTH Statement **********;
data work.bonus;
   set orion.sales;
   length Freq $ 12;
   if Country='US' then do;
      Bonus=500;
	  Freq='Once a Year';
   end;
   else if Country='AU' then do;
      Bonus=300;
	  Freq='Twice a Year';
   end;
run;

proc print data=work.bonus;
   var First_Name Last_Name Country 
       Bonus Freq;
run;

********** ELSE DO Statement **********;
data work.bonus;
   set orion.sales;
   length Freq $ 12;
   if Country='US' then do;
      Bonus=500;
	  Freq='Once a Year';
   end;
   else do;
      Bonus=300;
	  Freq='Twice a Year';
   end;
run;

proc print data=work.bonus;
   var First_Name Last_Name Country 
       Bonus Freq;
run;
