proc tabulate data=orion.order_fact format=dollar12.;
   where CostPrice_Per_Unit > 250;
   class Product_ID Order_Date;
   format Order_Date year4.;
   var Total_Retail_Price;
   table Order_Date=' ', Total_Retail_Price*sum*Product_ID=' '
         / misstext='$0'
           box='High Cost Products (Unit Cost > $250)';
   label Total_Retail_Price='Revenue for Each Product';
   keylabel Sum=' ';
   title;
run;
