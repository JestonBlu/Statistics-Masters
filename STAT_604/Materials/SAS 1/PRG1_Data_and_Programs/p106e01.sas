proc contents data=custfm._all_;
run;

data work.males;

run;

proc print data=work.males label;
run;

libname custfm clear;
