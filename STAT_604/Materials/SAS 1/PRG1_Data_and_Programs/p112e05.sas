proc format;
   value ordertypes
      1='Retail'
      2='Catalog'
      3='Internet';
run;

proc means data=orion.order_fact;
   title 'Revenue (in U.S. Dollars) Earned from All Orders';
run;
