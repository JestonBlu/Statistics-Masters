proc sort data=orion.order_fact out=order_sorted;
   by order_type;
run;

proc means data=order_sorted;
   by order_type;
   where order_type in (2,3);
   var Total_Retail_Price;
   title 'Orion Star Sales Summary';
run;
