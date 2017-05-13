libname mnth 'mnth2007.xls';

proc copy  in=orion out=mnth;
   select mnth7_2007 mnth8_2007 mnth9_2007;
run;

proc contents data=mnth._all_;
run;

libname mnth clear;
