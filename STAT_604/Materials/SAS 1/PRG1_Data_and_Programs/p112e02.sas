proc format;
   value ordertypes
      1='Retail'
      2='Catalog'
      3='Internet';
run;

proc freq data=orion.orders;
run;
