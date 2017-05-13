data work.youngadult;
   set orion.customer_dim;
   where Customer_Gender='F' and 
         Customer_Age between 18 and 36 and
         Customer_Group contains 'Gold';
   keep Customer_Name Customer_Age Customer_BirthDate 
        Customer_Gender Customer_Group;
run;

proc print data=work.youngadult;
run;
