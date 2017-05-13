data work.sports;
   set orion.product_dim;
   where Supplier_Country in ('GB','ES','NL') and 
         Product_Category like '%Sports';
   drop Product_ID Product_Line Product_Group Supplier_ID;
   label Product_Category='Sports Category'
         Product_Name='Product Name (Abbrev)'
		 Supplier_Name='Supplier Name (Abbrev)';
   format Product_Name Supplier_Name $15.;
run;

proc print data=work.sports label;
run;

proc contents data=work.sports;
run;
