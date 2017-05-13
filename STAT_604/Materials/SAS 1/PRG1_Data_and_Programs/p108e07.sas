data work.qtr2_2007;
   set orion.qtr2_2007;

run;

proc print data=work.qtr2_2007;
   where Order_Date>Delivery_Date or
         Order_Date<'01APR2007'd or
         Order_Date>'30JUN2007'd;
run;
