********** OUTPUT OUT= Statment **********;
proc means data=orion.sales sum mean range;
   var Salary;
   class Gender Country;
   output out=work.means1;
run;

proc print data=work.means1;
run;

********** OUTPUT OUT= Statement with Statistics **********;
proc means data=orion.sales noprint;
   var Salary;
   class Gender Country;
   output out=work.means2
          min=minSalary max=maxSalary
          sum=sumSalary mean=aveSalary;
run;

proc print data=work.means2;
run;

********** PROC MEANS Statement Options **********;
proc means data=orion.sales noprint nway;
   var Salary;
   class Gender Country;
   output out=work.means2
          min=minSalary max=maxSalary
          sum=sumSalary mean=aveSalary;
run;

proc print data=work.means2;
run;

proc means data=orion.sales noprint descendtypes;
   var Salary;
   class Gender Country;
   output out=work.means2
          min=minSalary max=maxSalary
          sum=sumSalary mean=aveSalary;
run;

proc print data=work.means2;
run;

proc means data=orion.sales noprint chartype;
   var Salary;
   class Gender Country;
   output out=work.means2
          min=minSalary max=maxSalary
          sum=sumSalary mean=aveSalary;
run;

proc print data=work.means2;
run;

