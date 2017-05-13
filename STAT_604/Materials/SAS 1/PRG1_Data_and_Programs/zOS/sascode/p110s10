proc sort data=orion.product_list
          out=work.product;
   by Supplier_ID;
run;

data work.prodsup;
   merge work.product(in=P) 
         orion.supplier(in=S);
   by Supplier_ID;
   if P=1 and S=0;
run;

proc print data=work.prodsup;
   var Product_ID Product_Name Supplier_ID Supplier_Name;
run;
