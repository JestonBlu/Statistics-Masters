ods html file='p111s16.html' stylesheet=(url='p111e16c.css');
proc print data=orion.customer_type;
   title 'Customer Type Definitions';
run;
ods html close;
