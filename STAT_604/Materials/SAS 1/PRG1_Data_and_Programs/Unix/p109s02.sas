data work.birthday;
   set orion.customer;
   Bday2009=mdy(month(Birth_Date),day(Birth_Date),2009);
   BdayDOW2009=weekday(Bday2009);
   Age2009=(Bday2009-Birth_Date)/365.25;
   keep Customer_Name Birth_Date Bday2009 BdayDOW2009 Age2009;
   format Bday2009 date9. Age2009 3.;
run;

proc print data=work.birthday;
run;
