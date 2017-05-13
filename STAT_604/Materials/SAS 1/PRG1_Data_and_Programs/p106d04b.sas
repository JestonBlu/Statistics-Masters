PROC EXPORT DATA= ORION.QTR1_2007 
            OUTFILE= "S:\Workshop\qtr2007c.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="qtr1"; 
RUN;
