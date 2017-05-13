data wood;                                                              
input wood pretrt $ stain resistance;                                                       
datalines;                                                                    
1      A      1    5.79
1      A      2    5.22
1      A      3    3.80
1      A      4    3.45
2      B      1    6.21
2      B      2    5.94
2      B      3    4.69
2      B      4    4.36
3      B      1    7.61
3      B      2    5.16
3      B      3    6.30
3      B      4    4.90
4      A      1    5.47
4      A      2    5.31
4      A      3    4.18
4      A      4    4.33
5      B      1    8.80
5      B      2    9.09
5      B      3    6.79
5      B      4    4.31
6      A      1    5.14
6      A      2    7.66
6      A      3    6.29
6      A      4    6.22
7      A      1    6.06
7      A      2    4.88
7      A      3    4.31
7      A      4    3.10
8      B      1    6.89
8      B      2    7.13
8      B      3    7.26
8      B      4    7.39
9      A      1    4.83
9      A      2    4.69
9      A      3    4.11
9      A      4    2.77
10     B      1    6.04
10     B      2    6.00
10     B      3    3.75
10     B      4    4.39
11     B      1    6.60
11     B      2    5.75
11     B      3    6.70
11     B      4    5.90
12     A      1    7.17
12     A      2    6.57
12     A      3    6.29
12     A      4    4.78
13     A      1    7.48
13     A      2    5.65
13     A      3    5.56
13     A      4    3.09
14     B      1    8.55
14     B      2    8.26
14     B      3    9.92
14     B      4    6.05
;
run;
proc means data=wood nway;
class pretrt stain;
var resistance;
output out=meanout mean=resistancemean;
run;
proc sgplot data=meanout;
series y=resistancemean x=pretrt / group=stain ;
title 'Resistance vs. pretrt for Each stain';
run;
proc mixed data=wood cl;
   class pretrt stain wood;                                                 
   model resistance=pretrt stain pretrt*stain / ddfm=kr;    
   random wood; 
run;    

proc mixed data=wood ;
   class pretrt stain wood;                                                 
   model resistance=pretrt stain / ddfm=kr;    
   random wood;
   lsmeans pretrt stain / diff adjust=tukey adjdfe=row; 
run;     
