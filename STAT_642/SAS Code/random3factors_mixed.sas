* random3factors_mixed.sas;
ODS HTML; ODS GRAPHICS ON;
option ls=80 ps=50 nocenter nodate; 
TITLE 'AOV - MIXED FACTOR LEVELS';
DATA RAW; 
INPUT D $ M $ @@;
DO G = 1 TO 8;
INPUT Y @@; OUTPUT; END;
LABEL G='GOLD ALLOW' D = 'DENTIST' 	M = 'CONDENSATION METHOD';
cards;                                                             
1           1    792 824 813 792 792 907  792 835 
 1           2    772 772 782 698 665 1115 835 870 
 1           3    782 803 752 620 835 847 560 585 
 2           1    803 803 715 803 813 858 907 882 
 2           2    752 772 772 782 743 933 792 824 
 2           3    715 707 835 715 673 698 734 681 
 3           1    715 724 743 627 752 858 762 724 
 3           2    792 715 813 743 613 824 847 782 
 3           3    762 606 743 681 743 715 824 681 
 4           1    673 946 792 743 762 894 792 649 
 4           2    657 743 690 882 772 813 870 858 
 4           3    690 245 493 707 289 715 813 312 
 5           1    634 715 707 698 715 772 1048 870 
 5           2    649 724 803 665 752 824 933 835 
 5           3    724 627 421 483 405 536 405 312 
RUN;
PROC PRINT; RUN;
PROC MIXED METHOD=REML CL; 
CLASS D M G;
MODEL Y = M G M*G/RESIDUAL;
RANDOM D D*M D*G/ CL ALPHA=.05;
LSMEANS M G M*G/CL ADJUST=TUKEY;
RUN;
proc glimmix data=raw;
CLASS D M G;
MODEL Y = M G M*G;
lsmeans M G M*G /  plot = meanplot;
run;
ODS GRAPHICS OFF; ODS HTML CLOSE;
