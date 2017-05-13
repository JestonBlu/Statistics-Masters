data policy;
   input agent promotions $ holders new;
   datalines;
1 A 36 25
1 B 37 27
1 C 35 10
2 A 20  6
2 B 32 10
2 C 28  4
3 A 23  5
3 B 19 12
3 C 22  4
4 A 23 14
4 B 24 9
4 C 25 5
5 A 22 10
5 B 23 12
5 C 23 6
6 A 28 10
6 B 29 10
6 C 28 4
7 A 10 4
7 B 12 4
7 C 10 2
8 A 9 8
8 B 6 4
8 C 6 1
9 A 14 5
9 B 15 10
9 C 15 3
10 A 16 9
10 B 16 7
10 C 16 2
;
run;
data plot;
   set policy;
   emplogit=log(new/(holders-new));
run;

proc sgplot data=plot;
   scatter y=emplogit x=promotions;
run;

proc glimmix data=policy;
   class promotions agent;
   model new/holders = promotions / solution;
   random intercept / subject=agent;
run;
/***Post-Processing Using the GLIMMIX Procedure ***/
proc glimmix data=policy;
   class promotions agent;
   model new/holders = promotions / solution;
   random intercept / subject=agent;
   lsmeans promotions / ilink lines diff oddsratio cl adjust=tukey;
   lsmestimate promotions 'avg(A, B) vs. C' 1 1 -2 divisor=2;
   estimate 'avg(A, B) vs. C' promotions 1 1 -2 / divisor=2;
   lsmestimate promotions 'A' 1;
   estimate 'promotions A' intercept 1 promotions 1;
   output out=glmmout pred           =pred 
                      pred(ilink)    =predilink
                      residual       =residual  
                      residual(ilink)=resilink
					  student        =student;
run;

proc print data=glmmout;
run;
/***ODS to produce residual plots, OddsRatio, mean plots, interaction plots,... ***/
ods graphics on;
proc glimmix data=policy plots=studentpanel;
   class promotions agent;
   model new/holders = promotions / solution;
   random intercept / subject=agent;
   lsmeans promotions / plots=diffplot adjust=tukey ;
run;
ods graphics off;
