proc tabulate data=orion.customer_dim;
   class Customer_Gender Customer_Group;
   table Customer_Gender, Customer_Group, (n colpctn);
   keylabel colpctn='Percentage' N='Number';
   title 'Customers by Group and Gender';
run;
