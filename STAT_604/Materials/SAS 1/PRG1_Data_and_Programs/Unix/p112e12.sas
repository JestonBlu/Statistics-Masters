proc tabulate data=orion.Organization_Dim format=dollar12.;
   class Employee_Gender Company;
   var Salary;
   table Company, (Employee_Gender all)*Salary*mean;
   title 'Average Employee Salaries';
run;
