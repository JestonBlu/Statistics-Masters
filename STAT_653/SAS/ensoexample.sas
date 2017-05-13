data enso;
     input Pressure @@;
	 Month = _n_;
     Year = Month / 12;
   datalines;
   12.9  11.3  10.6  11.2  10.9   7.5   7.7  11.7
   12.9  14.3  10.9  13.7  17.1  14.0  15.3   8.5
    5.7   5.5   7.6   8.6   7.3   7.6  12.7  11.0
   12.7  12.9  13.0  10.9  10.4  10.2   8.0  10.9
   13.6  10.5   9.2  12.4  12.7  13.3  10.1   7.8
    4.8   3.0   2.5   6.3   9.7  11.6   8.6  12.4
   10.5  13.3  10.4   8.1   3.7  10.7   5.1  10.4
   10.9  11.7  11.4  13.7  14.1  14.0  12.5   6.3
    9.6  11.7   5.0  10.8  12.7  10.8  11.8  12.6
   15.7  12.6  14.8   7.8   7.1  11.2   8.1   6.4
    5.2  12.0  10.2  12.7  10.2  14.7  12.2   7.1
    5.7   6.7   3.9   8.5   8.3  10.8  16.7  12.6
   12.5  12.5   9.8   7.2   4.1  10.6  10.1  10.1
   11.9  13.6  16.3  17.6  15.5  16.0  15.2  11.2
   14.3  14.5   8.5  12.0  12.7  11.3  14.5  15.1
   10.4  11.5  13.4   7.5   0.6   0.3   5.5   5.0
    4.6   8.2   9.9   9.2  12.5  10.9   9.9   8.9
    7.6   9.5   8.4  10.7  13.6  13.7  13.7  16.5
   16.8  17.1  15.4   9.5   6.1  10.1   9.3   5.3
   11.2  16.6  15.6  12.0  11.5   8.6  13.8   8.7
    8.6   8.6   8.7  12.8  13.2  14.0  13.4  14.8
   ;
run;
title 'Fitting a Model Using the Radial Smoother';
proc glimmix data=enso;
   model pressure = year;
   random year / type=rsmooth knotmethod=equal(40) knotinfo solution;
   output out=gmxout1 pred=pred;  
run;    *using the default starting value for the variance components;
title;
proc sgplot data=gmxout1; 
  scatter y=pressure x=year;
  series y=pred x=year;
run;
title 'Fitting a Model Using the Radial Smoother with different starting values0';
proc glimmix data=enso;
   model pressure = year;
   random year / type=rsmooth knotmethod=equal(40) solution;
   output out=gmxout2 pred=pred;
   parms (2) (10);
run;

proc sgplot data=gmxout2; 
  scatter y=pressure x=year;
  series y=pred x=year;
run;
title;
title 'Fitting a Model Using the Radial Smoother with different starting values1';
proc glimmix data=enso;
   model pressure = year /s;
   random year / type=rsmooth knotmethod=equal(40) knotinfo solution;
   output out=gmxout3 pred=pred;
   parms (100) (10);
run;

proc sgplot data=gmxout3; 
  scatter y=pressure x=year;
  series y=pred x=year;
run;
title;
/* using different number of knots  */
title 'Using 100 Equally Spaced Knots';
proc glimmix data=enso;
   model pressure = year /s;
   random year / type=rsmooth knotmethod=equal(100) knotinfo solution ;
   output out=gmxout4 pred=pred;
   parms (100) (10);
run;

proc sgplot data=gmxout4; 
   scatter y=pressure x=year;
   series y=pred x=year;
run;

/*** using k-d tree method  **/
title 'Using the k-d Tree Knot Selection Method';
proc glimmix data=enso;
   model pressure = year /s;
   random year / type=rsmooth knotmethod=kdtree(bucket=4) knotinfo solution ;
   output out=gmxout5 pred=pred;  
   parms (100) (10);
run;

proc sgplot data=gmxout5; 
  scatter y=pressure x=year;
  series y=pred x=year;
run;

/*** using knots stored in a data set  **/
proc univariate data=enso;
   var year;
   output out=outdata pctlpre=p pctlpts=0 to 100 by 2.5;
run;

proc transpose data=outdata out=pctls (drop=_name_ _label_ rename=(col1=year));
   var p0--p100;
run;

proc print data=pctls;
run;

title 'Using Knots Corresponding to the Percentiles';
proc glimmix data=enso;
   model pressure = year /s;
   random year / type=rsmooth knotmethod=data(pctls) knotinfo solution;
   output out=gmxout6 pred=pred;  
   parms (100) (10);
run;

proc sgplot data=gmxout6; 
  scatter y=pressure x=year;
  series y=pred x=year;
run;
title;
