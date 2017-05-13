options linesize=95 pagesize=55 nocenter nodate;
data druguse;
input parent $ student $ count;
cards;
neither never 141
neither occas 44
neither regular 40
one never 68
one occas 44
one regular 51
both never 17
both occas 11
both regular 19
data drugs; set druguse;
if parent='neither' then par=0;
else if parent='one' then par=1;
else par=2;
if student='never' then studen=0;
else if student='occas' then studen=1;
else studen=2;
assoc=par*studen;

proc freq order=data data=druguse; weight count;
tables student*parent/chisq expected norow nocol nopercent deviation cmh1 plots=mosaicplot measures;
title 'Using freq to test independence and linear-by-linear association'; 
run;

proc freq order=data data=druguse; weight count;
tables parent*student/plots=mosaicplot;
title 'Reversing Rows and Columns for Mosaic Plot'; 
run;

proc genmod data=druguse; class parent student; 
model count=parent student/dist=poi link=log type3  residuals;
title 'Using genmod for independence model';
run;

proc freq order=data data=druguse; weight count;
tables parent*student/crosslist(stdres pearsonres) norow nocol nopct;
title 'Residuals using CROSSLIST'; 
run;

/*
proc genmod data=drugs; class parent student;
model count=parent student assoc/dist=poi link=log type3;
title 'Using genmod for LxL association model';

proc genmod data=drugs; class parent student;
model count=parent student par*student/dist=poi link=log type3;
title 'Using genmod for row effects model';

proc genmod data=drugs; class parent student;
model count=parent student parent*studen/dist=poi link=log  type3;
title 'Using genmod for column effects model';

proc genmod data=drugs; class parent student;
model count=parent student par*student parent*studen/dist=poi link=log type3;
title 'Using genmod for row and column effects model';


proc genmod data=drugs; class parent student;
model count=parent|student/dist=poi link=log  type3; 
title 'Using genmod for the saturated model'; */
run;
