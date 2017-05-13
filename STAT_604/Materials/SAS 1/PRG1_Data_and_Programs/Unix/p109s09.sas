data work.bigdonations;
   set orion.employee_donations;
   Total=sum(Qtr1,Qtr2,Qtr3,Qtr4);
   NoDonation=nmiss(Qtr1,Qtr2,Qtr3,Qtr4);
   if Total < 50 or NoDonation > 0 then delete;
run;

proc print data=work.bigdonations;
   var Employee_ID Qtr1 Qtr2 Qtr3 Qtr4 Total NoDonation;
run;




