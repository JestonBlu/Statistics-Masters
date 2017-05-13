PROC IMPORT OUT= WORK.subset2a 
            DATAFILE= "S:\Workshop\sales.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="Australia$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

proc print data=work.subset2a;
run;

proc contents data=work.subset2a;
run;
