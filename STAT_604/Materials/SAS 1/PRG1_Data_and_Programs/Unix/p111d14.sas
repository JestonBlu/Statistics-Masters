********** ODS CSVALL **********;
ods csvall file='myexcel.csv';

proc freq data=orion.sales;
   tables Country;
run;

proc means data=orion.sales;
   var Salary;
run;

ods csvall close;

********** ODS MSOFFICE2K **********;
ods msoffice2k file='myexcel.html';

proc freq data=orion.sales;
   tables Country;
run;

proc means data=orion.sales;
   var Salary;
run;

ods msoffice2k close;

********** ODS EXCELXP **********;
ods tagsets.excelxp file='myexcel.xml';

proc freq data=orion.sales;
   tables Country;
run;

proc means data=orion.sales;
   var Salary;
run;

ods tagsets.excelxp close;




