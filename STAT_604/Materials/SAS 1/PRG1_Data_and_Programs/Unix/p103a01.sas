***********************************************
* This DATA step uses the DATALINES statement * 
* with an INPUT statement to read data that   *
* is directly entered in the program, rather  *
* than data stored in an external file.       *
***********************************************;

data work.NewEmps;
   input First_Name $ Last_Name $  
         Job_Title $ Salary;
   datalines;
Steven Worton Auditor 40450
Merle Hieds Trainee 24025
;
run;
/*
proc contents data=work.NewEmps;
run;
*/
proc print data=work.NewEmps;
run;


