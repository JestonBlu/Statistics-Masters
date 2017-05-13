data rabbit;
input x count; n=3;
cards;
0 19
1 32 
2 22
3 7
proc genmod data=rabbit; freq count;         *estimate p using mle;
model x/n=/dist=binomial;                    
output out=predbin p=p;                      
title 'Number of Males in Rabbit Litters';
run;
data exp_bin;
set predbin;
do x=0 to 3;
prob_bin=pdf("binomial",x,p,3);              *calculate binomial probability;
output;
end;
stop;
proc print; id x;
var prob_bin;
run;
proc freq data=rabbit;
        table x / chisq(testp=(.21153 .43046 .29199 .06602) df=-1 lrchisq); *lose 1 df;
                weight count;
        run;
