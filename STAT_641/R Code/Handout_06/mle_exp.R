t = c(15.321,9.008,20.104,7.729,45.154,8.404,5.332,0.577,4.305,4.517,12.594,
     6.829,3.291,37.175,0.841,1.317,7.613,20.582,2.030,10.001,4.666,12.933,
     0.591,39.454,8.875)
t = sort(t)
n = 25
i = seq(1,25,1)
u = (i-.5)/n
x =  -log(1-u)

#postscript("u:/meth1/Rfiles/exp_refplot.ps",height=8,horizontal=FALSE)

plot(x,t, xlab="Q(u) = -log(1-u)",ylab="Y = Time to Failure",lab=c(13,11,7),
main="Exponential Reference Distribution Plot")
abline(lm(t~x))
text(.7,40,"Equation of line:")
text(.7,38,"y = -.80 + 12.54*x")

#postscript("u:/meth1/Rfiles/mle_exp.ps",height=6,horizontal=FALSE)

b = seq(3,25,.01)
LK = (b^(-25))*exp(-289.243/b)*(10)^38
out =  cbind(b,LK)
LKmax  =  max(LK)
bmax  =  which(LK==max(LK))
MLE  =  b[bmax]
par(cex=.65)
plot(b,LK, type="l",lab=c(30,16,7))
par(cex=.99)
title("Likelihood Function for Exponential Model",xlab="Beta",ylab="Likelihood Function *(10**(38))")
abline("v"=b[bmax],lty=2)
abline("h"=max(LK),lty=2)

#graphics.off()

library(MASS)
fitdistr(t,"exponential")
