libname oralib oracle user=edu001 pw=edu001 
                      path=dbmssrv schema=educ;

proc print data=oralib.supervisors;
run;

data work.staffpay;
   merge oralib.staffmaster 
         oralib.payrollmaster;
   by empid;
run;

libname oralib clear;
