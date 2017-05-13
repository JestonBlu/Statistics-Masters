proc means data=orion.order_fact noprint nway;
   class Product_ID;
   var Total_Retail_Price;
   output out=product_orders sum=Product_Revenue;
run;

data product_names;
   merge product_orders orion.product_list;
   by Product_ID;
   keep Product_ID Product_Name Product_Revenue;
run;

proc sort data=product_names;
   by descending Product_Revenue;
run;

proc print data=product_names(obs=10) label;
   var Product_Revenue Product_ID Product_Name;
   label Product_ID='Product Number'
         Product_Name='Product'
         Product_Revenue='Revenue';
   format Product_Revenue eurox12.2;
   title 'Top Ten Products by Revenue';
run;
