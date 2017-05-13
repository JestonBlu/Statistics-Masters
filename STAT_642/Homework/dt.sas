* Written by R;
*  write.foreign(dt, "STAT_642/Homework/dt.txt", "STAT_642/Homework/dt.sas",  ;

PROC FORMAT;
value Soil 
     1 = "C" 
     2 = "L" 
     3 = "S" 
;

value Field 
     1 = "1" 
     2 = "10" 
     3 = "11" 
     4 = "12" 
     5 = "13" 
     6 = "14" 
     7 = "15" 
     8 = "16" 
     9 = "17" 
     10 = "18" 
     11 = "19" 
     12 = "2" 
     13 = "20" 
     14 = "21" 
     15 = "22" 
     16 = "23" 
     17 = "24" 
     18 = "25" 
     19 = "26" 
     20 = "27" 
     21 = "28" 
     22 = "29" 
     23 = "3" 
     24 = "30" 
     25 = "4" 
     26 = "5" 
     27 = "6" 
     28 = "7" 
     29 = "8" 
     30 = "9" 
;

DATA  rdata ;
INFILE  "STAT_642/Homework/dt.txt" 
     DSD 
     LRECL= 14 ;
INPUT
 Soil
 Field
 Porosity
;
FORMAT Soil Soil. ;
FORMAT Field Field. ;
RUN;
