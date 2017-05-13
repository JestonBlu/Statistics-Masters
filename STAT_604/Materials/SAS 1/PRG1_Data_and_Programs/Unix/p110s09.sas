proc sql;
   create table work.listlevelsql as
   select Product_ID, Product_Name, 
          product_level.Product_Level, Product_Level_Name
   from orion.product_level, orion.product_list
   where product_level.Product_Level = product_list.Product_Level;
quit;

proc print data=work.listlevelsql;
run;
