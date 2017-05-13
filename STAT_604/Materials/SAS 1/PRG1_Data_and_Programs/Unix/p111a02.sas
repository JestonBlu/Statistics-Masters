/*********************************************************
*  1. Submit the program.                                *
*  2. View the log to determine how SAS handles          *
*     multiple WHERE statements.                         * 
*  3. Which statement is true concerning the multiple    *
*     WHERE statements?                                  *
*     a. All the WHERE statements are used.              *
*     b. None of the WHERE statements are used.          *
*     c. The first WHERE statement is used.              *
*     d. The last WHERE statement is used.               *
*********************************************************/

proc freq data=orion.sales;
   tables Gender; 
   where Salary > 75000; 
   where Country = 'US';
run;
