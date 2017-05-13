proc sort data=orion.shoes_eclipse
          out=work.eclipsesort;
   by Product_Name;
run;

proc sort data=orion.shoes_tracker
          out=work.trackersort;
   by Product_Name;
run;

data work.e_t_shoes;
   set work.eclipsesort work.trackersort;
   by Product_Name;
   keep Product_Group Product_Name Supplier_ID;
run;

proc print data=work.e_t_shoes;
run;
