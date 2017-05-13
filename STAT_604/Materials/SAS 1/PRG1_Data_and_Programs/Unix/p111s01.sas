options nonumber nodate pagesize=18;
title 'Orion Star Sales Report';
footnote 'Report by SAS Programming Student';
proc means data=orion.order_fact;
   var Total_Retail_Price;
run;
options pagesize=52;
footnote;
