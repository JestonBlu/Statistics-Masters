proc print data=orion.nonsales;
   var Employee_ID Job_Title Salary Gender;
   title1 'Distribution of Salary and Gender Values';
   title2 'for Non-Sales Employees';
run;
