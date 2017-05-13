
data sex;
input premar extramar symm qi count @@;
cards;


 1 1 1 1 144    1 2 2 5  2   1 3 3 5  0   1 4  4 5 0
 2 1 2 5  33    2 2 5 2  4   2 3 6 5  2   2 4  7 5 0
 3 1 3 5  84    3 2 6 5 14   3 3 8 3  6   3 4  9 5 1
 4 1 4 5 126    4 2 7 5 29   4 3 9 5 25   4 4 10 4 5

;
proc genmod data=sex; class symm;
model count = symm / dist=poi link=log;
title 'Symmetry model';
run;


proc genmod data=sex; class extramar premar symm;
model count = symm extramar premar / dist=poi link=log;
title 'Quasi-symmetry model';
run;

proc genmod data=sex; class symm;
model count = symm extramar premar / dist=poi link=log;
title 'Ordinal quasi-symmetry model';
run;

proc genmod data=sex; class extramar premar qi;
model count = extramar premar qi / dist=poi link=log;
title 'Quasi-independence model';

proc freq data=sex; weight count;
tables premar*extramar / agree;
title 'Test of symmetry and kappa coefficient';

run;

data sex1; 
input score below above @@; trials=below+above;
cards;
1 33 2 1 14 2 1 25 1
2 84 0 2 29 0 3 126 0
;
proc genmod data=sex1;
*ods select modelfit type3;
model above/trials= / dist=bin link=logit noint type3;
title 'Symmetry model using Logits';
run;


proc genmod data=sex1;
*ods select modelfit type3;
model above/trials= score/ dist=bin link=logit noint type3;
title 'Ordinal Quasi-Symmetry model using Logits';
run;



data sex2;
input premar $ extramar $ count m11 m12 m13 m21 m22 m23 m31 m32 m33 m44 m1 m2 m3;
cards;
  1 1 144  1  0  0  0  0  0  0  0  0  0  0  0  0
  1 2 2    0  1  0  0  0  0  0  0  0  0  0  0  0
  1 3 0  0  0  1  0  0  0  0  0  0  0  0  0  0
  1 4 0 -1 -1 -1  0  0  0  0  0  0  0  1  0  0 
  2 1 33   0  0  0  1  0  0  0  0  0  0  0  0  0 
  2 2 4    0  0  0  0  1  0  0  0  0  0  0  0  0
  2 3 2    0  0  0  0  0  1  0  0  0  0  0  0  0
 2 4 0   0  0  0 -1 -1 -1  0  0  0  0  0  1  0
   3 1 84  0  0  0  0  0  0  1  0  0  0  0  0  0
  3 2 14   0  0  0  0  0  0  0  1  0  0  0  0  0
 3 3 6     0  0  0  0  0  0  0  0  1  0  0  0  0
 3 4 1     0  0  0  0  0  0 -1 -1 -1  0  0  0  1
  4 1 126 -1  0  0 -1  0  0 -1  0  0  0  1  0  0
  4 2 29   0 -1  0  0 -1  0  0 -1  0  0  0  1  0
   4 3 25  0  0 -1  0  0 -1  0  0 -1  0  0  0  1
 4 4 5     0  0  0  0  0  0  0  0  0  1  0  0  0
      ;
proc genmod;
    model count = m11 m12 m13 m21 m22 m23 m31 m32 m33 m44 m1 m2 m3
        / dist=poi  link=identity;
		title 'Lipsitz et al. test of marginal homogeneity';

proc catmod; weight count;  response marginals;
    model premar*extramar =  _response_  / freq;
    repeated time 2;
	title 'Bhapkar test for marginal homogeneity';
run;

data sexwin;
input win n a b c d; cards;
33 35 1 -1 0 0
84 84 1 0 -1 0
126 126 1 0 0 -1
14 16 0 1 -1 0
29 29 0 1 0 -1
25 26 0 0 1 -1 

proc genmod data=sexwin;
model win/n=a b c d / dist=bin link=logit noint;
title 'Fitting Quasi-symmetry using Bradley-Terry Model';
run;
