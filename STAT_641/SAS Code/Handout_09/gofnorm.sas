*Calculations for GOF for Weight of Chickens Example:
~longneck/meth1/gofnorm.sas;
options ps=72 ls=65;
data;
    input y @@;
    cards;
156 162 168 182 186 190 190 196 202 210 214 220 226
    230 230 236 236 242 246 270
run;
proc univariate plot normal;
    run;
