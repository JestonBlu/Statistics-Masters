/*********************************************************
*  1. Submit the program.                                *
*  2. Review the results.                                *
*  3. Why are some of the Bonus values missing in the    *
*     PROC PRINT output?                                 *
*********************************************************/

data work.bonus;
   set orion.nonsales;
   if Country='US' 
      then Bonus=500;
   else if Country='AU' 
        then Bonus=300;
run;

proc print data=work.bonus;
   var First Last Country Bonus;
run;
