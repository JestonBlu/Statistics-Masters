
#The following R program plots the quantile function of the t with df=2 and
chisquare of df=4 vs a N(0,1) quantile
# This program is ~longneck/meth1/quantilenorm,t,chi.R
#------------------------------------------------------------------------------
x  =  seq(0.0001,.9999,length=5000)
y1  =  qt(x,2)
y2  =  qnorm(x,0,1)
y3  =  qchisq(x,4)
y4 = qunif(x,0,1)
z1 =  cbind(y1,y2)
z2 =  cbind(y3,y2)
z3 = cbind(y4,y2)

#postscript("u:/meth1/Rfiles/compquannormt.ps",height=8,horizontal=FALSE)

par(mfrow=c(1,1))
a = c(-3.08,3.08)
b = c(-3.08,3.08)
matplot(y2,y1,main="t Quantile with df=2 vs N(0,1)",ylab="Q(u) for t",xlab="Q(u) for N(0,1)",
type="l",ylim=c(-10,10),
     xlim=c(-3.5,3.5),lab=c(9,8,7),cex=.5)
lines(a,b)

#postscript("u:/meth1/Rfiles/compquannormunif.ps",height=8,horizontal=FALSE)

par(mfrow=c(1,1))
a = c(-3.08,3.08)
b = c(-.39,1.39)
matplot(y2,y4,main="Uniform (0,1) Quantile  vs N(0,1)",ylab="Q(u) for Uniform (0, 1)",xlab="Q(u) for N(0,1)",
type="l",ylim=c(0, 1),
     xlim=c(-3.5,3.5),lab=c(9,8,7),cex=.5)
lines(a,b)

#postscript("u:/meth1/Rfiles/compquannormchi.ps",height=8,horizontal=FALSE)

par(mfrow=c(1,1))
a = c(-3.08,3.08)
b = c(-4.71,12.71)
matplot(y2,y3,main="Chisq with df=4 vs N(0,1)",ylab="Q(u) for Chisq",xlab="Q(u) for N(0,1)",
type="l",ylim=c(-5,15),
     xlim=c(-3.5,3.5),lab=c(9,8,7),cex=.5,lty=c(1,2))
lines(a,b)

#graphics.off()
