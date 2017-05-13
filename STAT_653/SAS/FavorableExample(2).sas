/*** Example with the data set favorable  ***/

data favorable;
   input clinic trt fav unfav;
   n=fav+unfav;
   datalines;
1 1 11 25
1 0 10 27
2 1 16 4
2 0 22 10
3 1 14 5
3 0 7 12
4 1 2 14
4 0 1 16
5 1 6 11
5 0 0 12
6 1 1 10
6 0 0 10
7 1 1 4
7 0 1 8
8 1 4 2
8 0 6 1
;
run;
/*** Fitting a Generalized Linear Mixed Model Using PROC GLIMMIX ***/
proc glimmix data=favorable;
   class trt clinic;
   model fav/n = trt / dist=binomial link=logit;
   random int trt / subject=clinic;
   lsmeans trt / oddsratio ilink diff;
run;     
