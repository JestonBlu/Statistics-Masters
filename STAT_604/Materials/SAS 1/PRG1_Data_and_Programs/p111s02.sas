options pagesize=18 number pageno=1 date dtreset;
title1 'Orion Star Sales Analysis';
proc means data=orion.order_fact;
   where Order_Type=2;
   var Total_Retail_Price;
   title3 'Catalog Sales Only';
   footnote "Based on the previous day's posted data";
run;

options pageno=1;
proc means data=orion.order_fact;
   where Order_Type=3;
   var Total_Retail_Price;
   title3 'Internet Sales Only';
   footnote;
run;
options pagesize=52;
