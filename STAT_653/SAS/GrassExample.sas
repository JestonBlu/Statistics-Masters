/*** Grass Data ***/
data grass;
   input method $ variety @;
   do i=1 to 6;
      input yield @;
      output;
   end;
datalines;
A  1  22.1 24.1 19.1 22.1 25.1 18.1
A  2  29.1 17.1 21.6 28.6 17.1 26.6
A  3  25.3 25.8 22.8 28.3 21.3 18.3
A  4  19.8 28.3 26.8 27.3 26.8 26.8
A  5  18.0 15.0 22.0 20.5 26.0 20.5
B  1  13.5 14.5 11.5  6.0 27.0 18.0
B  2  18.9 19.4 12.4 21.4 15.9 17.4
B  3  16.7 10.2 16.7 19.7 18.2 12.2
B  4  15.1  6.5 17.1  7.6 13.6 21.1
B  5  19.8 20.8 16.8 19.3 14.3 12.3
C  1  19.0 22.0 20.0 14.5 19.0 16.0
C  2  22.0 24.0 27.5 18.5 20.0 19.5
C  3  16.4 14.4 21.4 19.9 12.4 21.4
C  4  24.5 16.0 11.0  7.5 14.5 15.5
C  5  10.8 12.3 18.3  6.3  5.8 10.8
;
run;
/*** Calculating the means ***/
proc means data=grass nway noprint;
   class method variety;
   var yield;
   output out=meangrass mean=Yield;
run;

/*** Plotting the Grass data with means ***/
proc sgplot data=meangrass;
   series y=yield x=variety / group=method ;
   title 'Yield vs. Variety for Each Method';
run;
title;
/*** Analyses with PROC MIXED, Contrast and Estimate ***/
proc mixed data=grass ;
   class method variety;
   model yield=method / ddfm=kr;
   random variety method*variety ;
   contrast 'A vs B and C' method 2 -1 -1;
   estimate 'A vs B and C' method 2 -1 -1 / divisor=2 cl alpha=0.02;
   estimate 'Method A mean' intercept 1 method 1 0 0;
run;	 			 	                 
