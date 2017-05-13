********** Basic Report **********;
proc print data=orion.sales label;
   var Employee_ID First_Name Last_Name Salary;
run;

********** Enhanced Report **********;
options nocenter;
ods html file='enhanced.html' style=sasweb;
proc print data=orion.sales label;
   var Employee_ID First_Name Last_Name Salary;
   title1 'Orion Sales Employees';
   title2 'Males Only';
   footnote 'Confidential';
   label Employee_ID='Sales ID' First_Name='First Name'
         Last_Name='Last Name' Salary='Annual Salary';
   format Salary dollar8.;
   where Gender='M';   
   by Country;
run;
ods html close;

********** Reset Global Statements **********;
options center;
title;
footnote;
