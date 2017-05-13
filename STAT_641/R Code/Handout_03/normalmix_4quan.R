#The file normix.s will generate the four different mixtures of
#two normal distributions.

#postscript("u:/meth1/psfiles/normmixquan.ps",horizontal=FALSE)

x <- seq(15,40,len=500)
y11 <- pnorm(x,25,1)
y12 <- pnorm(x,30,3)
y1 <- .15*y11+.85*y12
plot(y1,x,type="l",xlab="p",ylab="Q(p)")
title("Quantile Function for mixture of 15% n(25,1), 85% n(30,9)")




y21 <- pnorm(x,28,1)
y22 <- pnorm(x,30,3)
y2 <- .15*y21+.85*y22
plot(y2,x,type="l",xlab="p",ylab="Q(p)")
title("Quantile Function for mixture of  15% n(28,1), 85% n(30,9)")

 

y31 <- pnorm(x,20,1)
y32 <- pnorm(x,30,3)
y3 <- .05*y31+.95*y32
plot(y3,x,type="l",xlab="p",ylab="Q(p)")
title("Quantile Function for mixture of  5% n(20,1), 95% n(30,9)")


x <- seq(15,35,len=500)
y41 <- pnorm(x,20,1)
y42 <- pnorm(x,30,1)
y4 <- .90*y41+.10*y42
plot(y4,x,type="l",xlab="p",ylab="Q(p)")
title("Quantile Function for mixture of  90% n(20,1),  10% n(30,1)")


 

#graphics.off()



