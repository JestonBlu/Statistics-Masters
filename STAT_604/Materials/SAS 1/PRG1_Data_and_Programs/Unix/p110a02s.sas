/*********************************************************
*  1. Complete the program to match-merge the sorted     *
*     SAS data sets referenced in the PROC SORT steps.   *                                  *
*  2. Submit the program. Correct and resubmit,          *
*     if necessary.                                      * 
*  4. What are the modified, completed statement?        *
*********************************************************/

proc sort data=orion.employee_payroll
          out=work.payroll; 
   by Employee_ID;
run;

proc sort data=orion.employee_addresses
          out=work.addresses;
   by Employee_ID;
run;

data work.payadd;
   merge work.payroll work.addresses;
   by Employee_ID;
run;

proc print data=work.payadd;
   var Employee_ID Employee_Name Birth_Date Salary;
   format Birth_Date weekdate.;
run;
