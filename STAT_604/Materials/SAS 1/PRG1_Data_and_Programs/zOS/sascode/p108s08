data work.price_current;
   set orion.price_current;
   if Product_ID=220200200022 then Unit_Sales_Price=57.30;
   else if Product_ID=240200100056 then Unit_Sales_Price=41.20;
run;

proc means data=work.price_current n min max;
   var Unit_Sales_Price;
run;

proc univariate data=work.price_current;
   var Unit_Sales_Price;
run;

