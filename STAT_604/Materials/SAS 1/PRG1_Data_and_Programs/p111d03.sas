footnote1 'By Human Resource Department';
footnote3 'Confidential';
options ps=20;
proc means data=orion.sales;
   var Salary; 
   title 'Orion Star Sales Employees';
run;

********** Changing and Canceling Titles **********;
proc print data=orion.sales;
   title1 'The First Line';
   title2 'The Second Line';
run;
proc print data=orion.sales;
   title2 'The Next Line';
run;
proc print data=orion.sales;
   title 'The Top Line';
run;
proc print data=orion.sales;
   title3 'The Third Line';
run;
proc print data=orion.sales;
   title;
run;

********** Changing and Canceling Footnotes **********;
footnote1 'Orion Star';
proc print data=orion.sales;
   footnote2 'Sales Employees';
   footnote3 'Confidential';
run;
proc print data=orion.nonsales;
   footnote2 'Non Sales Employees';
run;

title;
footnote;
