/*********************************************************
*  1. Add a STYLE= option to the first ODS statement     *
*     selecting one of the following style definitions:  *
*     HighContrast, Minimal, Listing, or Journal3.       * 
*  2. Submit the program and review the results.         *
*  3. Modify the STYLE= option to use one of the         *
*     following style definitions:                       *
*     Education, Harvest, Rsvp, or Solutions.            *
*  4. Submit the program and review the results.         *
*  5. Do you notice a difference in the results?         *
*********************************************************/

ods html file='myreport.html' style=Minimal;

proc means data=orion.sales;
   var Salary;
   title 'Report One';
run;

proc print data=orion.sales;
   title 'Report Two';
run;

ods html close;

title;
