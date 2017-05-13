proc print data=orion.qtr2_2007;
   where Order_Date>Delivery_Date or
         Order_Date<'01APR2007'd or
         Order_Date>'30JUN2007'd;
run;

proc freq data=orion.qtr2_2007 nlevels;
   tables Order_ID Order_Type; 
run;
