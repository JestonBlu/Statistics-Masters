proc print data=orion.customer split='/';
   where Country='TR';
   title 'Customers from Turkey';
   var Customer_ID Customer_FirstName Customer_LastName
       Birth_Date;
   label Customer_ID='Customer ID'
         Customer_FirstName='First Initial'
         Customer_LastName='Last/Name'
         Birth_Date='Birth Year';
   format Birth_Date year4.
          Customer_FirstName $1.
          Customer_ID z6.;
run;
