proc print data=orion.shoes_tracker;
   where Product_Category=' ' or
         Supplier_Country not in ('GB','US');
   var Product_Category Supplier_Name Supplier_Country Supplier_ID;
run;

proc freq data=orion.shoes_tracker nlevels;
   tables Supplier_Name Supplier_ID; 
run;
