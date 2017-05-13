/*** The treatment structure used in the experiment experiment was a 3x4 factorial 
with three varieties of alphalpha and four dates of third cutting. 
The experimental units were arranged into six plots, each subdivided into four plots. 
The varieties of alphalpha (Cossac, Ladak, Ranger) were assigned randomly to the blocks 
and the dates of third cutting (1:None 2:September 1, 3:September 20, 4:-October 7) were 
randomly assigned to the plots. All four dates were used in each block. 
The variables are:
yield: the plot yield (T/acre)
Date: the third cutting date (1, 2, 3, 4)
Block: factor identifying the block (1 to 6)
variety: alphalpha variety (Cossack, Ladak, Ranger)***/
data spyield;
   input yield date block variety $;
   cards;
2.17 1 1 Ladak
1.88 1 2 Ladak
1.62 1 3 Ladak
2.34 1 4 Ladak
1.58 1 5 Ladak
1.66 1 6 Ladak
1.58 2 1 Ladak
1.26 2 2 Ladak
1.22 2 3 Ladak
1.59 2 4 Ladak
1.25 2 5 Ladak
0.94 2 6 Ladak
2.29 3 1 Ladak
1.60 3 2 Ladak
1.67 3 3 Ladak
1.91 3 4 Ladak
1.39 3 5 Ladak
1.12 3 6 Ladak
2.23 4 1 Ladak
2.01 4 2 Ladak
1.82 4 3 Ladak
2.10 4 4 Ladak
1.66 4 5 Ladak
1.10 4 6 Ladak
2.33 1 1 Cossack
2.01 1 2 Cossack
1.70 1 3 Cossack
1.78 1 4 Cossack
1.42 1 5 Cossack
1.35 1 6 Cossack
1.38 2 1 Cossack
1.30 2 2 Cossack
1.85 2 3 Cossack
1.09 2 4 Cossack
1.13 2 5 Cossack
1.06 2 6 Cossack
1.86 3 1 Cossack
1.70 3 2 Cossack
1.81 3 3 Cossack
1.54 3 4 Cossack
1.67 3 5 Cossack
0.88 3 6 Cossack
2.27 4 1 Cossack
1.81 4 2 Cossack
2.01 4 3 Cossack
1.40 4 4 Cossack
1.31 4 5 Cossack
1.06 4 6 Cossack
1.75 1 1 Ranger
1.95 1 2 Ranger
2.13 1 3 Ranger
1.78 1 4 Ranger
1.31 1 5 Ranger
1.30 1 6 Ranger
1.52 2 1 Ranger
1.47 2 2 Ranger
1.80 2 3 Ranger
1.37 2 4 Ranger
1.01 2 5 Ranger
1.31 2 6 Ranger
1.55 3 1 Ranger
1.61 3 2 Ranger
1.82 3 3 Ranger
1.56 3 4 Ranger
1.23 3 5 Ranger
1.13 3 6 Ranger
1.56 4 1 Ranger
1.72 4 2 Ranger
1.99 4 3 Ranger
1.55 4 4 Ranger
1.51 4 5 Ranger
1.33 4 6 Ranger
;
run;
proc print;run;
proc mixed data=spyield cl;
class variety date block;                                                 
model yield=variety date variety*date / ddfm=kr;    
random block variety*block; 
run;
proc mixed data=spyield cl;
class variety date block;                                                 
model yield=variety date variety*date / ddfm=kr;    
random block variety*block; 
estimate 'variety Cossack broad'
	intercept 1 variety 1 date 0.25 0.25 0.25 0.25 variety*date 0.25 0.25 0.25 0.25;
estimate 'variety Cossack narrow'
	intercept 24 variety 24 date 6 6 6 6 variety*date 6 6 6 6 |
	block 4 4 4 4 4 4 
	variety*block 4 4 4 4 4 4 /divisor=24;
estimate 'variety Ladak narrow'
	intercept 24 variety 0 24 date 6 6 6 6 variety*date 0 0 0 0 6 6 6 6 |
	block 4 4 4 4 4 4 
	variety*block 0 0 0 0 0 0 4 4 4 4 4 4/divisor=24;
estimate 'variety Ladak intermediate'
	intercept 24 variety 0 24 date 6 6 6 6 variety*date 0 0 0 0 6 6 6 6 |
	block 4 4 4 4 4 4 /divisor=24;
estimate 'variety Ladak broad'
	intercept 24 variety 0 24 date 6 6 6 6 variety*date 0 0 0 0 6 6 6 6 /divisor=24;
estimate 'difference=Cossack-Ladak broad'
	variety 12 -12 variety*date 3 3 3 3 -3 -3 -3 -3 /divisor=12;
estimate 'EBLUP block 1'
	intercept 1  | block 1 0 0 0 0 0;
estimate 'EBLUP block 1 Cossack'
	intercept 1 variety 1 0 0 | 
	block 1 0 0 0 0 0 variety*block 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
estimate 'EBLUP block 2 Cossack'
	intercept 1 variety 1 0 0 | 
	block 0 1 0 0 0 0 variety*block 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
estimate 'EBLUP block 1 Ladak 1st date'
	intercept 1 variety 0 1 0 date 1 0 0 0 variety*date 0 0 0 0 1 0 0 0| 
	block 1 0 0 0 0 0 variety*block 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
run;
