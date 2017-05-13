y <- seq(0,17,.01)
D1 <- dweibull(y,1,5)
D2 <- dweibull(y,2,5)
D3 <- dweibull(y,5,5)
D4 <- dweibull(y,8,5)
D <- cbind(D1,D2,D3,D4)

#postscript("u:/meth1/psfiles/Weibullpdf.ps",horizontal=FALSE)


matplot(y,D,type="l",ylab="f(y)", xlab="y",lab=c(18,10,7),col="black",lwd=1.8,lty="solid")
title("Weibull Density Functions-Different Shape")
par(font=5)
text(.71,.25,"g=1,a=5",adj=0)
arrows(1.4,.24,.8,.175)

text(8.5,.11,"g=2,a=5",adj=0)
arrows(9.2,.10,8.1,.05)

text(7.1,.23,"g=5,a=5",adj=0)
arrows(7.8,.22,6.2,.15)

text(6.6,.51,"g=8,a=5",adj=0)
arrows(7.3,.50,5.6,.43)

y <- seq(0,17,.01)
D5 <- dweibull(y,2,.6)
D6 <- dweibull(y,2,2)
D7 <- dweibull(y,2,5)
D8 <- dweibull(y,2,10)
DS <- cbind(D5,D6,D7,D8)

#postscript("u:/meth1/psfiles/Weibullpdf2.ps",horizontal=FALSE)


matplot(y,DS,type="l",ylab="f(y)", xlab="y",lab=c(18,10,7),col="black",lwd=1.8,lty="solid")
title("Weibull Density Functions-Different Scale")
par(font=5)
text(2.5,1.3,"g=2,a=0.6",adj=0)
arrows(3.3,1.27,0.87,1.1)

text(4.0,.4,"g=2,a=2",adj=0)
arrows(4.8,.37,2.8,.23)

text(7.1,.23,"g=2,a=5",adj=0)
arrows(7.8,.20,6.0,.13)

text(12,.21,"g=2,a=10",adj=0)
arrows(12.8,.18,11,.08)




#graphics.off()
 

