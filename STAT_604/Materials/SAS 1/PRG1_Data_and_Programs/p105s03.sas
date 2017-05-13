data work.tony;
   set orion.customer_dim(keep=Customer_FirstName Customer_LastName); 
   where Customer_FirstName =* 'Tony';
run;

proc print data=work.tony;
run;
