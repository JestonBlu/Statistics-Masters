proc sort data=orion.product_list
          out=work.product;
   by Supplier_ID;
run;

proc print data=work.prodsup;
   var Product_ID Product_Name Supplier_ID Supplier_Name;
run;
