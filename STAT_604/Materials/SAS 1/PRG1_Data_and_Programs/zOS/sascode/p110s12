proc sort data=orion.orders
          out=work.orders;
   by Employee_ID;
run;

data work.allorders work.noorders;
   merge orion.staff(in=Staff) work.orders(in=Ord);
   by Employee_ID;
   if Ord=1 then output work.allorders;
   else if Staff=1 and Ord=0 then output work.noorders;
   keep Employee_ID Job_Title Gender Order_ID Order_Type Order_Date;
run;

proc print data=work.allorders;
run;

proc print data=work.noorders;
run;

