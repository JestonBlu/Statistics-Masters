proc means data=orion.order_fact;
   class Product_ID;
   var Total_Retail_Price;
run;
