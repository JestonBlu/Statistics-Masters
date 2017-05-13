*weibmle_fuelpumps.sas;
option ls=75 ps=55 nocenter nodate;          
title 'Weibull MLE Estimation of Fuel Pumps Data';   
data time; 
input F @@; 
label F  = 'Time to Failure of Pumps';
cards;
15.321 9.008 20.104 7.729 45.154 8.404 5.332 0.577 4.305
4.517 12.594 6.829 3.291 37.175 0.841 1.317 7.613 20.582
2.030 10.001 4.666 12.933 0.591 39.454 8.875
run;
proc print;
run;
proc lifereg data=time;
 model  F = /dist=weibull covb;
run;
