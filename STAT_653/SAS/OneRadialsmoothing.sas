data OneRadialsmoothing;
input x y;
datalines;
3 4.3
4 4
6 4.9
8 4.9
10 5.7
11 9.0
15 2.9 
;
run;
data knots;
input x;
datalines;
3
9
15
;
run;
Proc Glimmix data=OneRadialsmoothing outdesign=two;
	model y= x x*x /solution;
	random x / solution type=rsmooth knotmethod=data(knots);
	output out=out2 pred(blup) = predblup 
				   pred(noblup) = prednoblup;
run;
proc sgplot;
scatter y=y x=x;
series y=predblup x=x;
run;
proc sgplot;
scatter y=y x=x;
series y=prednoblup x=x;
run;
proc print data=two;
run;
Proc Glimmix data=two;
	model y= x x*x /solution;
	random _z1 _z2 _z3 / type=toep(1) solution;
run;
