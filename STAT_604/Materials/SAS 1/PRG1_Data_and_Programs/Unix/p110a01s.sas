/*********************************************************
*  1. Add a BY statement to the PROC SORT step to sort   *
*     the observations first by ascending Gender and     * 
*     then by descending Employee_ID within the values   *
*     of Gender.                                         *
*  2. Complete the PROC PRINT statement to reference     *
*     the sorted data set.                               * 
*  3. Submit the program and confirm the sort order      *
*     in the PROC PRINT output.                          * 
*  4. What is the Employee_ID value for the first        *
*     observation in the sorted data set?                *
*********************************************************/

proc sort data=orion.sales
          out=work.sortsales;
   by Gender descending Employee_ID;
run;

proc print data=work.sortsales; 
   var Gender Employee_ID First_Name 
       Last_Name Salary;
run;
 
