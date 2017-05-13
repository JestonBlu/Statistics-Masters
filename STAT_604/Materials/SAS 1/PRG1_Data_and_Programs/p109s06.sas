data work.gifts;
   set orion.nonsales;
   length Gift1 Gift2 $ 15;
   select(Gender);
     when('F') do;
       Gift1='Perfume';
	   Gift2='Cookware';
     end;
     when('M') do;
	   Gift1='Cologne';
	   Gift2='Lawn Equipment';
     end;
	 otherwise do;
	   Gift1='Coffee';
	   Gift2='Calendar';
     end;
   end;
   keep Employee_ID First Last Gift1 Gift2;
run;  

proc print data=gifts;
run;


