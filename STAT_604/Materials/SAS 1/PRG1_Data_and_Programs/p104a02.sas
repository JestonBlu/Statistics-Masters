/*********************************************************
*  1. Submit the program.                                *
*  2. View the output to retrieve the current data as a  *
*     numeric value referencing January 1, 1960.         * 
*********************************************************/

data work.date;
   CurrentDate=today();
run;

proc print data=work.date;
run;
