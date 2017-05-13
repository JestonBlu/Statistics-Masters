libname orion 's:\workshop';

data work.subset1;
   set orion.sales;
run;

proc print data=work.subset1;
run;
