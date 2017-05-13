/* The data show the incidence of nonmelanoma skin cancer among women 
in Minneapolis-St Paul, Minnesota, and Dallas-Fort Worth, Texas. 
The towns are coded 0 for St Paul and 1 for Forth Worth.
One would expect sun exposure to be greater in Texas than in Minnesota.*/

data skin;
input cases 1-3 city $ 5-7 age 9 pop 11-16;
ln=log(pop);
datalines;
1   msp 1	172675
16  msp 2	123065
30  msp 3	96216
71  msp 4	92051
102 msp 5	72159
130 msp 6	54722
133 msp 7	32185
40  msp 8	8328
4   dfw 1	181343
38  dfw 2	146207
119 dfw 3	121374
221 dfw 4	111353
259 dfw 5	83004
310 dfw 6	55932
226 dfw 7	29007
65  dfw 8	7538
;
run;
proc print;run;
/* PROC GLIMMIX*/
proc glimmix data=skin;
class city age;
model cases = city age / dist=poisson offset=ln ddfm=none s;
lsmeans city age /diff;
run;

/*model with all covariates*/
proc genmod data=skin;
class city age;
model cases=city age/ dist=poisson link=log offset=ln residuals type3;
lsmeans city age /diff;
run;

/*** model with only intercept ***/
proc genmod data=skin;
model cases=/dist=poisson link=log offset=ln residuals;
run;
