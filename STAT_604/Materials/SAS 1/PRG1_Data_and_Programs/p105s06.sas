data work.tony;
   set orion.customer_dim(keep=Customer_FirstName Customer_LastName); 
   where Customer_FirstName =* 'Tony';
   format Customer_FirstName Customer_LastName $upcase.;
   label Customer_FirstName='CUSTOMER*FIRST NAME'
         Customer_LastName='CUSTOMER*LAST NAME';
run;

proc print data=work.tony split='*';
run;
