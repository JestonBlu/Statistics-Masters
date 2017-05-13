proc tabulate data=orion.order_fact;
   where CostPrice_Per_Unit > 250;
   class Product_ID Order_Date;
   format Order_Date year4.;
   var Total_Retail_Price;
   table Order_Date, Total_Retail_Price*sum*Product_ID;
   title 'High Cost Products (Unit Cost > $250)';
run;
