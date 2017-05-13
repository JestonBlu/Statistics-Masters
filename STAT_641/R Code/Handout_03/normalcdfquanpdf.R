y  = seq(0,18,.01)
p  = seq(0,1,.001)
Y  = pnorm(y,10,2)
Q  = qnorm(p,10,2)
D  = dnorm(y,10,2)

#postscript("u:/meth1/Rfiles/normalcdf.ps")

plot(y,Y,type="l",ylab="F(y)", xlab="y",lab=c(21,11,7))
title("Normal Distribution Function (Mean=10, St.Dev=2)")

#postscript("u:/meth1/Rfiles/normalquantile.ps")

plot(p,Q,type="l",lab=c(21,18,7),
     ylab="Q(p)",xlab="p")
title("Normal Quantile Function (Mean=10, St.Dev=2)")

#postscript("u:/meth1/Rfiles/normalpdf.ps")

plot(y,D,type="l",ylab="f(y)", xlab="y",lab=c(18,21,7))
title("Normal Density Function (Mean=10, St.Dev=2)")

#graphics.off()
 

