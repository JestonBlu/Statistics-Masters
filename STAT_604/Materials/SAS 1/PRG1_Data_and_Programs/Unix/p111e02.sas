proc means data=orion.order_fact;
   where Order_Type=2;
   var Total_Retail_Price;
run;

proc means data=orion.order_fact;
   where Order_Type=3;
   var Total_Retail_Price;
run;
