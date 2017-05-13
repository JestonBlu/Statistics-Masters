data work.shoes_tracker;
   set orion.shoes_tracker;
   Supplier_Country=upcase(Supplier_Country);
   if Supplier_Country='UT' then Supplier_Country='US';
   if Product_Category=' ' then Product_Category='Shoes';
   if Supplier_ID=. then Supplier_ID=2963;
   if Supplier_Name='3op Sports' then Supplier_Name='3Top Sports';
   if _n_=4 then Product_ID=220200300079;  
   else if _n_=8 then Product_ID=220200300129;  
   Product_Name=propcase(Product_Name);
   if Supplier_ID=14682 and Supplier_Name='3Top Sports'
      then Supplier_Name='Greenline Sports Ltd';
run;

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
