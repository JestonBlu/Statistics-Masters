proc means data=orion.price_current n min max;
   var Unit_Cost_Price Unit_Sales_Price Factor;
run;

proc univariate data=orion.price_current;
   var Unit_Sales_Price Factor;
run;
