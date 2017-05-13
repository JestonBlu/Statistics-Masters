proc contents data=orion.orders;
run;

proc contents data=orion.order_item;
run;

proc print data=work.allorders;
   var Order_ID Order_Item_Num Order_Type 
       Order_Date Quantity Total_Retail_Price;
run;
