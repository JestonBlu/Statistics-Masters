/*********************************************************
*  1. Submit the program.                                *
*  2. Review the PROC FREQ output.                       *
*  3. Review the PROC PRINT output from the TABLES       *
*     statement OUT= option.                             *
*  4. Review the PROC PRINT output from the OUTPUT       *
*     statement OUT= option.                             *
*********************************************************/

proc freq data=orion.sales;
   tables Gender / chisq out=freq6 outcum;
   output out=freq7 chisq;
run; 

proc print data=freq6;
run;

proc print data=freq7;
run;
