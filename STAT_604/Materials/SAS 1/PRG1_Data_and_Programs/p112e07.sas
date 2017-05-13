data work.countries(keep=Customer_Country);
   set orion.supplier;
   Customer_Country=Country;
run;

proc means data=orion.customer_dim;
   class Customer_Country;
   var Customer_Age;
   title 'Average Age of Customers in Each Country';
run;
