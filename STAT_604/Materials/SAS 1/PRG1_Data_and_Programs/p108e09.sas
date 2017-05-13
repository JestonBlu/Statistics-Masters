proc print data=work.shoes_tracker;
   where Product_Category=' ' or
         Supplier_Country not in ('GB','US') or
         propcase(Product_Name) ne Product_Name;
run;

proc freq data=work.shoes_tracker;
   tables Supplier_Name*Supplier_ID / missing; 
run;

proc means data=work.shoes_tracker min max range fw=15;
   var Product_ID;
   class Supplier_Name;
run;  

proc univariate data=work.shoes_tracker;
   var Product_ID;
run;
