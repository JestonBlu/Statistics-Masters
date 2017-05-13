proc print data=orion.customer;
   where Country='TR';
   title 'Customers from Turkey';
   var Customer_ID Customer_FirstName Customer_LastName
       Birth_Date;
run;
