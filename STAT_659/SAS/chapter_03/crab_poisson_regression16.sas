proc format; value wthfmt
	1='<23.25' 2='23.25--24.25' 3='24.25--25.25' 4='25.25--26.25'
	5='26.26--27.25' 6='27.25--28.25' 7='28.25--29.25' 8='>29.25';
data sasuser.crab;
input color spine width satell weight;
if satell>0 then y=1; if satell=0 then y=0; n=1;
weight = weight/1000; color = color - 1;
if color=4 then dark=0; if color < 4 then dark=1;
if      width < 23.25 then group=1;
else if width < 24.25 then group=2;
else if width < 25.25 then group=3;
else if width < 26.25 then group=4;
else if width < 27.25 then group=5;
else if width < 28.25 then group=6;
else if width < 29.25 then group=7;
else group=8; format group wthfmt.;
cards;
3  3  28.3  8  3050
4  3  22.5  0  1550
2  1  26.0  9  2300
4  3  24.8  0  2100
4  3  26.0  4  2600
3  3  23.8  0  2100
2  1  26.5  0  2350
4  2  24.7  0  1900
3  1  23.7  0  1950
4  3  25.6  0  2150
4  3  24.3  0  2150
3  3  25.8  0  2650
3  3  28.2  11 3050
5  2  21.0  0  1850
3  1  26.0  14 2300
2  1  27.1  8  2950
3  3  25.2  1  2000
3  3  29.0  1  3000
5  3  24.7  0  2200
3  3  27.4  5  2700
3  2  23.2  4  1950
2  2  25.0  3  2300
3  1  22.5  1  1600
4  3  26.7  2  2600
5  3  25.8  3  2000
5  3  26.2  0  1300
3  3  28.7  3  3150
3  1  26.8  5  2700
5  3  27.5  0  2600
3  3  24.9  0  2100
2  1  29.3  4  3200
2  3  25.8  0  2600
3  2  25.7  0  2000
3  1  25.7  8  2000
3  1  26.7  5  2700
5  3  23.7  0  1850
3  3  26.8  0  2650
3  3  27.5  6  3150
5  3  23.4  0  1900
3  3  27.9  6  2800
4  3  27.5  3  3100
2  1  26.1  5  2800
2  1  27.7  6  2500
3  1  30.0  5  3300
4  1  28.5  9  3250
4  3  28.9  4  2800
3  3  28.2  6  2600
3  3  25.0  4  2100
3  3  28.5  3  3000
3  1  30.3  3  3600
5  3  24.7  5  2100
3  3  27.7  5  2900
2  1  27.4  6  2700
3  3  22.9  4  1600
3  1  25.7  5  2000
3  3  28.3  15 3000
3  3  27.2  3  2700
4  3  26.2  3  2300
3  1  27.8  0  2750
5  3  25.5  0  2250
4  3  27.1  0  2550
4  3  24.5  5  2050
4  1  27.0  3  2450
3  3  26.0  5  2150
3  3  28.0  1  2800
3  3  30.0  8  3050
3  3  29.0  10 3200
3  3  26.2  0  2400
3  1  26.5  0  1300
3  3  26.2  3  2400
4  3  25.6  7  2800
4  3  23.0  1  1650
4  3  23.0  0  1800
3  3  25.4  6  2250
4  3  24.2  0  1900
3  2  22.9  0  1600
4  2  26.0  3  2200
3  3  25.4  4  2250
4  3  25.7  0  1200
3  3  25.1  5  2100
4  2  24.5  0  2250
5  3  27.5  0  2900
4  3  23.1  0  1650
4  1  25.9  4  2550
3  3  25.8  0  2300
5  3  27.0  3  2250
3  3  28.5  0  3050
5  1  25.5  0  2750
5  3  23.5  0  1900
3  2  24.0  0  1700
3  1  29.7  5  3850
3  1  26.8  0  2550
5  3  26.7  0  2450
3  1  28.7  0  3200
4  3  23.1  0  1550
3  1  29.0  1  2800
4  3  25.5  0  2250
4  3  26.5  1  1967
4  3  24.5  1  2200
4  3  28.5  1  3000
3  3  28.2  1  2867
3  3  24.5  1  1600
3  3  27.5  1  2550
3  2  24.7  4  2550
3  1  25.2  1  2000
4  3  27.3  1  2900
3  3  26.3  1  2400
3  3  29.0  1  3100
3  3  25.3  2  1900
3  3  26.5  4  2300
3  3  27.8  3  3250
3  3  27.0  6  2500
4  3  25.7  0  2100
3  3  25.0  2  2100
3  3  31.9  2  3325
5  3  23.7  0  1800
5  3  29.3  12 3225
4  3  22.0  0  1400
3  3  25.0  5  2400
4  3  27.0  6  2500
4  3  23.8  6  1800
2  1  30.2  2  3275
4  3  26.2  0  2225
3  3  24.2  2  1650
3  3  27.4  3  2900
3  2  25.4  0  2300
4  3  28.4  3  3200
5  3  22.5  4  1475
3  3  26.2  2  2025
3  1  24.9  6  2300
2  2  24.5  6  1950
3  3  25.1  0  1800
3  1  28.0  4  2900
5  3  25.8  10 2250
3  3  27.9  7  3050
3  3  24.9  0  2200
3  1  28.4  5  3100
4  3  27.2  5  2400
3  2  25.0  6  2250
3  3  27.5  6  2625
3  1  33.5  7  5200
3  3  30.5  3  3325
4  3  29.0  3  2925
3  1  24.3  0  2000
3  3  25.8  0  2400
5  3  25.0  8  2100
3  1  31.7  4  3725
3  3  29.5  4  3025
4  3  24.0  10 1900
3  3  30.0  9  3000
3  3  27.6  4  2850
3  3  26.2  0  2300
3  1  23.1  0  2000
3  1  22.9  0  1600
5  3  24.5  0  1900
3  3  24.7  4  1950
3  3  28.3  0  3200
3  3  23.9  2  1850
4  3  23.8  0  1800
4  2  29.8  4  3500
3  3  26.5  4  2350
3  3  26.0  3  2275
3  3  28.2  8  3050
5  3  25.7  0  2150
3  3  26.5  7  2750
3  3  25.8  0  2200
4  3  24.1  0  1800
4  3  26.2  2  2175
4  3  26.1  3  2750
4  3  29.0  4  3275
2  1  28.0  0  2625
5  3  27.0  0  2625
3  2  24.5  0  2000
;

proc genmod data=sasuser.crab; model satell = width / dist=poi link=identity;
output out=out0 predicted=pre0;
label pre0=" Poisson identity link"; 
title 'Poisson regression with identity link'; run;
*Fits poisson regression with log link;
proc sort data=out0 out=out1a; by width;  

proc gplot data=out1a;
symbol1 i=none color=red value=plus;
symbol2 i=sm50 color=black value=none;
legend1  labels=none
        value=("satell" "Poisson identity link" )
        position=(top center inside)
        mode=share;

plot satell*width pre0*width /overlay legend=legend1;
title 'Plot of Number of Satellites as a Function of Width';
run;



proc genmod data=sasuser.crab; model satell = width / dist=poi link=log;
output out=out1 predicted=pre1 stdreschi=res1;
label pre1=" Poisson log link"; 
title 'Poisson regression with log link'; run;
*Fits poisson regression with log link;
proc sort data=out1 out=out1a; by width;  

proc gplot data=out1a;
symbol1 i=none color=red value=plus;
symbol2 i=sm50 color=black value=none;
legend1  labels=none
        value=("satell" "Poisson log link" )
        position=(top center inside)
        mode=share;

plot satell*width pre1*width /overlay legend=legend1;
title 'Plot of Number of Satellites as a Function of Width';
run;
*Plots original data with fitted prediction equations for identity and log links;

proc gplot data=out1a;
plot res1*width;
run;



proc genmod data=out1; model satell = width / dist=negbin link=log;
title 'Negative binomial regression with log link';
label pre2="Neg bin log link";
output out=out2 predicted=pre2 stdreschi=res2;
*Fits negative binomial regression with log link;

proc gplot data=out2;
plot res2*width;
run;


proc genmod data=out2; model satell = width / dist=poi link=identity;
title 'Poisson regression with identity link';
output out=out3 predicted=pre3;
label pre3="identity link";
*Fits Poisson regression with identity link;

proc genmod data=out3; model satell = width / dist=negbin link=identity;
title 'Negative binomial regression with identity link';
output out=out4 predicted=pre4;
label pre4="Neg bin identity link";
*Fits Negative binomial regression with identity link;


proc sort data=out4 out=out5; by width;  

proc gplot data=out5;
symbol1 i=none color=red value=plus;
symbol2 i=sm50 color=black value=none;
symbol3 i=sm50 color=blue value=none;
symbol4 i=sm50 color=green value=none;
symbol5 i=sm50 color=purple value=none;

legend1  labels=none
        value=("satell" "Poisson log link" "Neg bin log link" "Poisson identity link" "Neg bin identity link")
        position=(top center inside)
        mode=share;

plot satell*width pre1*width pre2*width pre3*width pre4*width/overlay legend=legend1;
title "Poisson and Negative Binomial Regression for Crab Data";
run;


proc means data=sasuser.crab; class width; var satell;
output out=crab2 sum=totsat n=num;
*Output data set with number of satellites for each width;

data crab3; set crab2; log_num=log(num);
*Define offset term for fitting Poisson regression;

proc genmod data=crab3; model totsat=width/dist=poi link=log offset=log_num;
title 'Poisson regression model with totals at each width';
*Get goodness of fit statistics for Poisson regression model;
run;
