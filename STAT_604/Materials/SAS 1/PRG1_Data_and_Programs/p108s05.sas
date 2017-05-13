proc means data=orion.shoes_tracker min max range fw=15;
   var Product_ID;
   class Supplier_Name;
run;

proc univariate data=orion.shoes_tracker;
   var Product_ID;
run;
