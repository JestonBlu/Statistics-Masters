proc freq data=orion.orders nlevels;
   where Order_Type=1;
   tables Customer_ID Employee_ID / noprint;
   title1 'Unique Customers and Salespersons for Retail Sales';
run;

proc freq data=orion.orders nlevels;
   where Order_Type ne 1;
   tables Customer_ID / noprint;
   title1 'Unique Customers for Catalog and Internet Sales';
run;
