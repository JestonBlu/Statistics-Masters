/*********************************************************
*  1. Submit the program.                                *
*  2. Review the PROC PRINT output.                      *
*  3. Add a WHERE statement to the PROC PRINT step to    *
*     subset _TYPE_ for observations summarized by       *
*     Gender only.                                       *
*  4. Submit the program and verify the results.         *
*********************************************************/

proc means data=orion.sales noprint chartype;
   var Salary;
   class Gender Country;
   output out=work.means2
          min=minSalary max=maxSalary
          sum=sumSalary mean=aveSalary;
run;

proc print data=work.means2;
   where _type_= '10';
run;
