proc print data=work.children;
run;

PROC IMPORT OUT= WORK.children 
            DATAFILE= "S:\Workshop\products.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="Children$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
