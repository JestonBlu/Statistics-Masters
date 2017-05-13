********** Documentation Option **********;
ods listing close;
ods tagsets.excelxp file='myexcel1.xml'
                    style=sasweb
                    options(doc='help');

proc freq data=orion.sales;
   tables Country;
   title 'Report 1';
run;

proc means data=orion.sales;
   var Salary;
   title 'Report 2';
run;

ods tagsets.excelxp close;
ods listing;

title;

********** Other Options **********;
ods listing close;
ods tagsets.excelxp file='myexcel2.xml'
                    style=sasweb
                    options(embedded_titles='yes'
                            sheet_Name='First Report');

proc freq data=orion.sales;
   tables Country;
   title 'Report 1';
run;

ods tagsets.excelxp options(sheet_Name='Second Report');
proc means data=orion.sales;
   var Salary;
   title 'Report 2';
run;

ods tagsets.excelxp close;
ods listing;

title;
