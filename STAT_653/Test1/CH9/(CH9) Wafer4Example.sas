/*** Handout 9 Wafer4 Example ***/
data wafer4;
   input temp wafer site deposit thick;
   datalines;
 900      1        1      291      1919
 900      1        2      295      1919
 900      1        3      294      1919
 900      2        1      318      2113
 900      2        2      315      2113
 900      2        3      315      2113
 900      3        1      306      1841
 900      3        2      302      1841
 900      3        3      305      1841
 900      4        1      342      2170
 900      4        2      341      2170
 900      4        3      336      2170
 900      5        1      318      2019
 900      5        2      323      2019
 900      5        3      323      2019
 900      6        1      307      1872
 900      6        2      308      1872
 900      6        3      308      1872
 900      7        1      295      1862
 900      7        2      297      1862
 900      7        3      296      1862
 900      8        1      326      2149
 900      8        2      326      2149
 900      8        3      328      2149
1000      1        1      319      2098
1000      1        2      315      2098
1000      1        3      321      2098
1000      2        1      290      1823
1000      2        2      289      1823
1000      2        3      292      1823
1000      3        1      299      1915
1000      3        2      296      1915
1000      3        3      297      1915
1000      4        1      329      2161
1000      4        2      330      2161
1000      4        3      332      2161
1000      5        1      264      1828
1000      5        2      265      1828
1000      5        3      265      1828
1000      6        1      274      1827
1000      6        2      268      1827
1000      6        3      275      1827
1000      7        1      258      1815
1000      7        2      260      1815
1000      7        3      260      1815
1000      8        1      280      1981
1000      8        2      276      1981
1000      8        3      278      1981
1100      1        1      264      1846
1100      1        2      266      1846
1100      1        3      268      1846
1100      2        1      276      2028
1100      2        2      280      2028
1100      2        3      278      2028
1100      3        1      285      1854
1100      3        2      292      1854
1100      3        3      289      1854
1100      4        1      306      2046
1100      4        2      303      2046
1100      4        3      304      2046
1100      5        1      273      1925
1100      5        2      275      1925
1100      5        3      276      1925
1100      6        1      276      1942
1100      6        2      273      1942
1100      6        3      273      1942
1100      7        1      282      2083
1100      7        2      282      2083
1100      7        3      279      2083
1100      8        1      271      2036
1100      8        2      271      2036
1100      8        3      270      2036
;  
run;
/*** Observe if the relation between deposit and thick change from one level of the temperature to another***/
proc sgplot data=wafer4;
   reg y=deposit x=thick / group=temp;
run; 
data new;
input temp wafer thick;
datalines;
900 0 1921
1000 0 1921
1100 0 1921
;
run;
data wafer4;
set wafer4 new;
run;
/*** Fitting ANCOVA Model: allows unequal slopes and can test***/
proc mixed data=wafer4; 
   class temp wafer;
   model deposit=temp thick thick*temp / ddfm=kr solution outpred=pred;
   random wafer(temp) ;
   estimate 'slope for temp 900' thick 1  thick*temp 1 0 0;
   estimate 'slope for temp 1000' thick 1  thick*temp 0 1 0;
   estimate 'slope for temp 1100' thick 1  thick*temp 0 0 1;
   lsmeans temp / at thick=1921;
run; 
proc print data=pred;
run;
 
/*** Fitting ANCOVA Model: equal slopes imposed***/
proc mixed data=wafer4; 
   class temp wafer;
   model deposit=temp thick / solution ddfm=kr;
   random wafer(temp);
run;                                         
/*** Fitting ANCOVA Model: equal slopes imposed. estimates the intercepts of the lines***/
proc mixed data=wafer4; 
   class temp wafer;
   model deposit=temp thick / solution ddfm=kr;
   random wafer(temp);
   estimate 'Intercept for temp 900' intercept 1 temp 1 0 0;
   estimate 'Intercept for temp 1000' intercept 1 temp 0 1 0;
   estimate 'Intercept for temp 1100' intercept 1 temp 0 0 1;
run;
/*** LSMEANS in average and LSMEANS when thick=1850***/
proc mixed data=wafer4; 
   class temp wafer;
   model deposit=temp thick / ddfm=kr;
   lsmeans temp / diff;
   lsmeans temp / at thick=1850 diff;
   random wafer(temp);
run;
*** Clean parameter ANCOVA unequal slopes model, parameter estimates obtained  ***;
proc mixed data=wafer4; 
   class temp wafer;
   model deposit=temp thick*temp / noint ddfm=kr solution;
   random wafer(temp);
   contrast 'slopes are all equal' thick*temp 1 -1 0,
                                   thick*temp 1 0 -1;
run;                                
 *** Clean parameter ANCOVA equal slopes model, parameter estimates obtained  ***;
proc mixed data=wafer4; 
   class temp wafer;
   model deposit=temp thick / noint ddfm=kr solution;
   random wafer(temp);
run;   
 


               

