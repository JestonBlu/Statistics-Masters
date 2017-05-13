
option ls=75 ps=55 nocenter nodate;          
title 'Strength of Braided Cord';   
data cords; 
input S C @@; 
label S  = 'Strength of Cord' C ='Censoring (1=Yes)';
cards;
36.3 0 52.4 0 54.8 0 57.1 0 60.7 0 41.7 0 52.6 0 54.8 0 57.3 0 
43.9 0 52.7 0 55.1 0 57.7 0 49.4 0 53.1 0 55.4 0 57.8 0
50.1 0 53.6 0 55.9 0 58.1 0 50.8 0 53.6 0 56.0 0 58.9 0
51.9 0 53.9 0 56.1 0 59.0 0 52.1 0 53.9 0 56.5 0 59.1 0
52.3 0 54.1 0 56.9 0 59.6 0 52.3 0 54.6 0 57.1 0 60.4 0
26.8 1 29.6 1 33.4 1 35.0 1 40.0 1 41.9 1 42.5 1
run;
proc lifetest data=cords outsurv=a plots=(s);
 time S*C(1) ;
 proc print data=a;
 run;
