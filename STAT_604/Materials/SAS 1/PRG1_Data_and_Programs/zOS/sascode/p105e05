data work.sports;
   set orion.product_dim;
   where Supplier_Country in ('GB','ES','NL') and 
         Product_Category like '%Sports';
   drop Product_ID Product_Line Product_Group Supplier_ID;
run;

proc print data=work.sports;
run;
