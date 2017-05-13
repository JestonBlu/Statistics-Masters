
data crab;
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

proc sort data=sasuser.crab; by width;
proc freq data=sasuser.crab; table y*width/noprint cmh1 chisq; 
	title 'Ungrouped width analyzed as a 66x2 Table';
run;
/* Goodness-of-fit with continuous covariates:  lackfit              */
 /*                       discrete covariates:    scale=none aggregate */
proc logistic des data=sasuser.crab;
model y = /lackfit covb scale=none aggregate=(width); 
title 'Independence model using logistic';
run;

proc logistic des data=sasuser.crab; 
model y = width/lackfit covb scale=none aggregate=(width) clparm=wald; 
title 'Ungrouped width using proc logistic';
output out=p_out p=pi_hat lower=l95cl upper=u95cl reschi=res;
run;
proc gplot data=p_out; plot res*width; run;


proc format; value wthfmt
	1='<23.25' 2='23.25--24.25' 3='24.25--25.25' 4='25.25--26.25'
	5='26.26--27.25' 6='27.25--28.25' 7='28.25--29.25' 8='>29.25';

proc sort data=p_out; by group;
proc means noprint; by group;
  var y pi_hat width;
  output out=gcrab(drop=_TYPE_ rename=(_FREQ_=n))
         mean=p_y p_pi m_width sum=n_y n_pi;

/* Next generate Table 5.2 */
data tab52; set gcrab; n_no=n-n_y; fit_no=n-n_pi;
	x2=sum((n_y-n_pi)**2/n_y,(n_no-fit_no)**2/fit_no);
	g2=2*sum(n_y*log(n_y/n_pi),n_no*log(n_no/fit_no));
	keep group n_y n_no n_pi fit_no x2 g2; rename n_y=n_yes n_pi=fit_yes;
proc summary data=tab52; 
	var n_yes n_no fit_yes fit_no x2 g2;
	output out=x2g2(drop=_type_ _freq_) sum=n_yes n_no fit_yes fit_no x2 g2;
data tab52; set tab52 x2g2;
proc print data=tab52 round;
var group n_yes n_no fit_yes fit_no x2 g2;
title 'Table 5.2';
run;
/* *Logistic regression with group average width ;

proc logistic data=gcrab des;
	model n_y/n=m_width / lackfit scale=none aggregate influence;
	output out=p_out p=pi_hat dfbetas=dfbint dfbeta c=c difchisq=difchisq 
 	difdev=difdev reschi=reschi h=h;
	title 'Grouped width data analyzed using proc logistic';
 Compute adjusted residuals   

data p_out; set p_out; drop dfbint;
	adjres=reschi/sqrt(1-h); adjressq=adjres**2; fit_yes=n*pi_hat;

*Model with intercept only to illustrate residual plots. ; 

proc logistic data=gcrab des; 
	model n_y/n= / scale=none aggregate=(group) iplot;
	output out=ap_out p=afit difchisq=adiffchi difdev=adifdev reschi=areschi;
	title 'Independence model with grouped widths';

data p_out; merge p_out ap_out; afit=n*afit;
proc print data=p_out round;
	var group n n_y afit areschi pi_hat fit_yes reschi adjres;
	title 'Table 5.3';

proc print data=p_out round;
	var group dfbeta c difchisq adjressq difdev adiffchi adifdev;
	title 'Table 5.4';

* Compute adjusted residuals using proc genmod.;  

proc genmod data=gcrab;
	model n_y/n=m_width / dist=bin link=logit;
	output out=p_gen p=pred l=lower u=upper 	
			reschi=rchi stdreschi=srchi resdev=rdev stdresdev=srdev;
	title 'Grouped Widths Analyzed using proc genmod';

	proc print data=p_gen round;
	var group n n_y pred lower upper rchi srchi rdev srdev;

run;*/
