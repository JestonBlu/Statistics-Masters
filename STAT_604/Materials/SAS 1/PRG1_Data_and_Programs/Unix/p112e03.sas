proc freq data=orion.customer_dim;
   tables Customer_Country Customer_Type Customer_Age_Group;
   title1 'Customer Demographics';
   title3 '(Top two levels for each variable?)';
run;
