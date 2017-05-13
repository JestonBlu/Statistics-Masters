proc means data=orion.staff nmiss n maxdec=0 nonobs;
   var Birth_Date Emp_Hire_Date Emp_Term_Date;
   class Gender;
   title 'Number of Missing and Non-Missing Date Values';
run;
