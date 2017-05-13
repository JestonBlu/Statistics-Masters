y <- seq(0,32,.01)
yc <- seq(0,23,.01)
h=rep(1,900)
x=seq(23.01,32,.01)
p <- seq(0,1,.001)
Y <- pnorm(y,20,4)
Yc <- pnorm(yc,20,4)

#par(mfrow=c(3,1))
#postscript("u:/meth1/psfiles/cdfuncensored.ps")

plot(y,Y,type="l",ylab="F(t)", xlab="t",lab=c(21,11,7),xlim=c(8,32),ylim=c(0,1))
title("Distribution Function - Uncensored")

#postscript("u:/meth1/psfiles/cdfcensored.ps")

plot(yc,Yc,type="l",ylab="H(y)", xlab="y",lab=c(21,11,7),xlim=c(8,32),ylim=c(0,1))
title("Distribution Function - Censored")
lines(c(23,31),c(1,1))
points(23,1,pch=19)

#graphics.off()
 

