proc sort data=orion.shoes_eclipse
          out=work.eclipsesort;
   by Product_Name;
run;
