/*********************************************************
*  1. Submit the program and confirm that a new SAS      *
*     data set was created with 77 observation and       * 
*     12 variables.                                      *
*  2. True or False: The DATA step reads a temporary     *
*     SAS data set to create a permanent SAS data set.   *
*********************************************************/

libname orion 's:\workshop';

data work.mycustomers;
   set orion.customer;
run;

proc print data=work.mycustomers; 
   var Customer_ID Customer_Name 
       Customer_Address;
run;
 
