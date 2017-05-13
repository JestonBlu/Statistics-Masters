* Written by R;
*  write.foreign(crops, "STAT_642/Homework/crops.txt", "STAT_642/Homework/crops.sas",  ;

PROC FORMAT;
value Nitrogen 
     1 = "0" 
     2 = "50" 
     3 = "100" 
;

value Crop 
     1 = "Alfalfa" 
     2 = "Guar" 
     3 = "Mungbean" 
     4 = "Soybean" 
;

DATA  rdata ;
INFILE  "C:\Users\Joseph\Projects\learning\Statistics\crops.txt" 
     DSD 
     LRECL= 11 ;
INPUT
 Nitrogen
 Crop
 Reduction
;
FORMAT Nitrogen Nitrogen. ;
FORMAT Crop Crop. ;
RUN;

TITLE 'ANALYSIS OF FACTORIAL TREATMENT STRUCTURE';
proc glm;
class Nitrogen Crop;
model Reduction = Nitrogen Crop Nitrogen*Crop/SS3;
contrast 'Linear Trend in Nitrogen' Nitrogen -1 0 1;
contrast 'Quad Trend in Nitrogen'   Nitrogen 1 -2 1;
contrast 'Linear Trend in Crop'     Crop -3 -1 1 3;
contrast 'Quad Trend in Crop'       Crop 1 -1 -1 1;
contrast 'Cubin Trend in Crop'      Crop -1 3 -3 1;
contrast  'INTER1'             Nitrogen*Crop   3  1 -1 -3  0  0  0  0 -3 -1  1  3;
contrast  'INTER2'             Nitrogen*Crop  -1  1  1 -1  0  0  0  0  1 -1 -1  1;
contrast  'INTER3'             Nitrogen*Crop   1 -3  3 -1  0  0  0  0 -1  3 -3  1;
contrast  'INTER4'             Nitrogen*Crop  -3 -1  1  3  6  2 -2 -6 -3 -1  1  3;
contrast  'INTER5'             Nitrogen*Crop   1 -1 -1  1 -2  2  2 -2  1 -1 -1  1;
contrast  'INTER6'             Nitrogen*Crop  -1  3 -3  1  2 -6  6 -2 -1  3 -3  1;
contrast  'MAIN OF Nitrogen'   Nitrogen  -1  0 1,
                               Nitrogen   1 -2 1;
contrast  'Main of Crop'       Crop -3 -1  1 3,
                               Crop  1 -1 -1 1,
                               Crop -1  3 -3 1;
contrast  'INTERACTION'        Nitrogen*Crop   3  1 -1 -3  0  0  0  0 -3 -1  1  3,
                               Nitrogen*Crop  -3 -1  1  3  6  2 -2 -6 -3 -1  1  3,
                               Nitrogen*Crop  -1  1  1 -1  0  0  0  0  1 -1 -1  1,
                               Nitrogen*Crop   1 -1 -1  1 -2  2  2 -2  1 -1 -1  1,
                               Nitrogen*Crop   1 -3  3 -1  0  0  0  0 -1  3 -3  1,
                               Nitrogen*Crop  -1  3 -3  1  2 -6  6 -2 -1  3 -3  1; 

lsmeans Nitrogen Crop Nitrogen*Crop/stderr pdiff adjust=Tukey;
run;


