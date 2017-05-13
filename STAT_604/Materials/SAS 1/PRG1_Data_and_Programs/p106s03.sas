libname xlsdata 'custcaus.xls' header=no;

proc contents data=xlsdata._all_;
run;

data work.germany;
   set xlsdata.DE;
   label F1='Customer ID'
         F2='Country'
		 F3='Gender'
		 F4='First Name'
		 F5='Last Name'
		 F6='Birth Date';
   format F6 ddmmyy8.;
run;

libname xlsdata clear;

proc print data=work.germany label;
run;
