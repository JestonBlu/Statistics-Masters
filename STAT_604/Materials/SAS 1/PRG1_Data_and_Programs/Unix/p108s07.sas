data work.qtr2_2007;
   set orion.qtr2_2007;
   if Order_ID=1242012259 then Delivery_Date='12MAY2007'd;
   else if Order_ID=1242449327 then Order_Date='26JUN2007'd;
run;

proc print data=work.qtr2_2007;
   where Order_Date>Delivery_Date or
         Order_Date<'01APR2007'd or
         Order_Date>'30JUN2007'd;
run;
