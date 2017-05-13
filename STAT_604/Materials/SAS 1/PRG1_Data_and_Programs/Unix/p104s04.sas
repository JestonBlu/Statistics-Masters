libname orion '.';

proc contents data=orion._all_ nods;
run;

proc contents data=orion.sales;
run;


