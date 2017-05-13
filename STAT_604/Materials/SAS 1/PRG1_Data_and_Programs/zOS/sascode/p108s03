proc print data=orion.shoes_tracker;
   where propcase(Product_Name) ne Product_Name;
   var Product_ID Product_Name;
run;

proc freq data=orion.shoes_tracker;
   tables Supplier_Name*Supplier_ID / missing;
run;
