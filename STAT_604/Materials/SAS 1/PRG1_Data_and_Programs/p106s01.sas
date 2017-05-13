libname custfm 'custfm.xls';

proc contents data=custfm._all_;
run;

data work.males;
   set custfm.'Males$'n;
   keep First_Name Last_Name Birth_Date;
   format Birth_Date year4.;
   label Birth_Date='Birth Year';
run;

proc print data=work.males label;
run;

libname custfm clear;
