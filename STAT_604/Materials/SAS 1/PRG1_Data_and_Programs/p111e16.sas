ods html file='p111s16.html';
proc print data=orion.customer_type;
   title 'Customer Type Definitions';
run;
ods html close;
