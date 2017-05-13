options nodate nocenter ps=55 ls=90;
data crabsgrouped;
input width cases satell; log_case=log(cases);
avesatell=satell/cases;
cards;
22.69 14 14
23.84 14 20
24.77 28 67
25.84 39 105
26.79 22 63
27.74 24 93
28.67 18 71
30.41 14 72
;

proc genmod data=crabsgrouped;
model satell=width/dist=poi link=log offset=log_case obstats residuals;
output out=data2 predicted=pre;
title 'Poisson Regression with Grouped Data';



data data3; set data2; pre1=pre/cases; 
proc sort data=data3 out=data4; by width; 

proc gplot data=data4;
symbol1 i=none color=red value=plus;
symbol2 i=sm50 color=black value=none;
symbol3 i=sm99 color=blue value=none;
plot avesatell*width pre1*width avesatell*width/overlay;
title "Poisson Regression Based on Grouped Data";

run;
