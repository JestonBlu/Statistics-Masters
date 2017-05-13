proc freq data=orion.order_fact noprint;
   tables Product_ID / out=product_orders;
run;

data product_names;
   merge product_orders orion.product_list;
   by Product_ID;
   keep Product_ID Product_Name Count;
run;

proc sort data=product_names;
   by descending Count;
run;

proc print data=product_names(obs=10) label;
   var Count Product_ID Product_Name;
   label Product_ID='Product Number'
         Product_Name='Product'
         Count='Orders';
   title 'Top Ten Products by Number of Orders';
run;
