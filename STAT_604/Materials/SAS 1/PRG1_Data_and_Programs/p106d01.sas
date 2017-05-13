libname orionxls 'sales.xls';

proc contents data=orionxls._all_;
run;

proc print data=orionxls.'Australia$'n;
run;

libname orionxls clear;
