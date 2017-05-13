proc format;
   value ordertypes
      1='Retail'
      2='Catalog'
      3='Internet';
run;

proc means data=orion.order_fact sum;
   var Total_Retail_Price;
   class Order_Date Order_Type;
   format Order_Date year4. Order_Type ordertypes.;
   title 'Revenue (in U.S. Dollars) Earned from All Orders';
run;
