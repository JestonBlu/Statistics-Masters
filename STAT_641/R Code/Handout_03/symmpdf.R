y <- seq(-10,10,.01)
D1 <- dnorm(y)
D2 <- dlogis(y)
D3 <- exp(-abs(y))/2
D4 <- dcauchy(y)
D <- cbind(D1,D2,D3,D4)

#postscript("u:/meth1/psfiles/sympdfs.ps",horizontal=FALSE)
par(font=1)

matplot(y,D,type="l",ylab="f(y)", xlab="y",lab=c(18,10,7),col="black",lwd=1.8,
lty="solid")
title("Four Symmetric Density Functions")

text(2.2,.49,"Double Exponential",adj=0)
arrows(2.2,.49,0.01,.49)

text(2.2,.40,"Normal",adj=0)
arrows(2.2,.40,0.01,.40)

text(2.2,.32,"Cauchy",adj=0)
arrows(2.2,.32,0.01,.32)

text(2.2,.25,"Logistic",adj=0)
arrows(2.2,.25,0.01,.25)


text(2.9,.13,"Double Exponential",adj=0)
arrows(5.0,0.12,3.3,.02)

text(-2.2,.02,"Normal",adj=0)
arrows(0.2,.02,2.3,.02)

text(7.5,.05,"Cauchy",adj=0)
arrows(8.1,.04,7,.009)

text(5,.07,"Logistic",adj=0)
arrows(6,.06,4.7,.01)

#graphics.off()
 

