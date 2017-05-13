proc tabulate data=orion.customer_dim;
   class Customer_Group Customer_Gender;
   var Customer_Age;
   table Customer_Group all,
         Customer_Gender*Customer_Age*(n mean);
   title 'Ages of Customers by Group and Gender';
run;
