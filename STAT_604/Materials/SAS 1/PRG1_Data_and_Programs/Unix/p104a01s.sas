/*********************************************************
*  1. After the DATA step, add a PROC CONTENTS step to   *
*     view the descriptor portion of work.donations.     *                 
*  2. Submit the program and review the results.         *
*  3. How many observations are in the data set?         *
*********************************************************/

data work.donations;
   infile 'donation.dat';
   input Employee_ID Qtr1 Qtr2 Qtr3 Qtr4;
   Total=sum(Qtr1,Qtr2,Qtr3,Qtr4);
run;

proc contents data=work.donations;
run;
