data wheat;
   input id variety yield moist;
   datalines;
 1       1         41       10
 2       1         69       57
 3       1         53       32
 4       1         66       52
 5       1         64       47
 6       1         64       48
 7       2         49       30
 8       2         44       21
 9       2         44       20
10       2         46       26
11       2         57       44
12       2         42       19
13       3         69       50
14       3         62       40
15       3         50       23
16       3         76       58
17       3         48       21
18       3         55       30
19       4         48       22
20       4         60       40
21       4         45       17
22       4         47       21
23       4         62       44
24       4         43       13
25       5         65       49
26       5         63       44
27       5         71       57
28       5         68       51
29       5         52       27
30       5         68       52
31       6         76       55
32       6         46       11
33       6         45       11
34       6         67       43
35       6         65       38
36       6         79       60
37       7         35       17
38       7         37       20
39       7         30       11
40       7         30       10
41       7         57       48
42       7         49       36
43       8         75       57
44       8         64       41
45       8         46       15
46       8         54       28
47       8         52       23
48       8         52       23
49       9         51       26
50       9         63       44
51       9         42       13
52       9         61       40
53       9         67       48
54       9         69       53
55      10         60       37
56      10         73       58
57      10         66       44
58      10         71       53
59      10         67       48
60      10         74       59
;
run;
proc sgplot data=wheat;  
   series y=yield x=moist / group=variety ;
run; 
/*** Scale independent variables to improve numerical stability***/
data wheat;
   set wheat;
   moist10=moist/10;
run;
/*** Fitting a Random Coefficient Model***/
proc mixed data=wheat;
   class variety;
   model yield = moist10 / ddfm=kr solution;
   random int moist10 / type=un subject=variety solution G;
   estimate "intercept for variety 1" int 1 | int 1 /subject 1;
   estimate "intercept for variety 2" int 1 | int 1 /subject 0 1;
   estimate "intercept for variety 3" int 1 | int 1 /subject 0 0 1;
   estimate "slope for variety 1" moist10 1 | moist10 1 /subject 1;
   estimate "slope for variety 2" moist10 1 | moist10 1 /subject 0 1;
   estimate "slope for variety 3" moist10 1 | moist10 1 /subject 0 0 1;
run;  

*** Plot the population line and subject-specific lines ;
data pop;
   input variety moist10;
   datalines;
   0 1
   0 6
   ;
run;

data plot;
   set pop wheat;
run;

proc mixed data=plot;
   class variety;
   model yield = moist10 / ddfm=kr outp=pred;
   random int moist10 / type=un subject=variety;
run;  

proc print data=pred;
run;

proc format;
   value variety
   0 = 'Population';
run;

proc sgplot data=pred;  
   series y=pred x=Moist10 / group=Variety ;
   format variety variety.;
run; 
 *** Fitting a Random Coefficient Model Using TYPE=FA0(2) ;
proc mixed data=wheat;
   class variety;
   model yield = moist10 / ddfm=kr(firstorder) solution;
   random int moist10 / type=FA0(2) subject=variety G solution;
run;   




