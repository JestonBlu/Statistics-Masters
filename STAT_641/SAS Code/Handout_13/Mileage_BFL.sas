option ls=70 ps=50 nocenter nodate;
title 'BFL Test of Homogeneity of Variance';
data mpg;
infile '~longneck/meth1/levene.dat';
input Add Y;
label Y = 'Percent Increase in MPG';

*generate BoxPlots and Tests of Normality;
proc sort;by Add;
proc univariate def=5 plot normal; by Add;

*BFL Test of Equal Variances;
proc glm data=mpg;
class Add;
model  Y = Add;
means Add/hovtest=bf;
run;
