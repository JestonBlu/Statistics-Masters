proc sort data=orion.product_list 
          out=work.product_list;
   by Product_Level;
run;

data work.listlevel;
   merge orion.product_level work.product_list ;
   by Product_Level;
run;

proc print data=work.listlevel;
   var Product_ID Product_Name Product_Level Product_Level_Name;
run;
