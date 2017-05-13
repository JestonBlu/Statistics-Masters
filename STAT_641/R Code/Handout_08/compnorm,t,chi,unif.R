
#The following R program generates data from various specified distributions
#and the plots the empirical density function of the generated data.
# This program is ~longneck/meth1/compnorm,t,chi.R
#------------------------------------------------------------------------------
x1 = seq(-8,8,length=5000)
x2 = seq(-5,18,length=5000)
x3 = seq(-.5,1.5,length=5000)
y1 = dt(x1,2)
y2 = dnorm(x1,0,1)
y3 = dchisq(x2,4)
y4 = dnorm(x2,4,2.83)
y5 = dnorm(x3,.5,1/sqrt(12))
y6 = dunif(x3,0,1)
z1 = cbind(y1,y2)
z2 = cbind(y3,y4)
z3 = cbind(y5,y6)
 #postscript("u:/meth1/Rfiles/compnormt.ps",height=8,horizontal=FALSE)
par(mfrow=c(1,1))
matplot(x1,z1,main="t PDF with df=2 vs N(0,1)",xlab= "x", ylab="f(x)",type="l",ylim=c(0,.4),
     xlim=c(-8,8),lab=c(9,8,7),cex=.5)
legend(4,.35,c("t(2)","N(0,1)"),lty=c(1,2))

 #postscript("u:/meth1/Rfiles/compnormchi.ps",height=8,horizontal=FALSE)
par(mfrow=c(1,1))
matplot(x2,z2,main="Chisq PDF with df=4 vs N(4,8)",xlab= "x", ylab="f(x)",type="l",ylim=c(0,.20),
     xlim=c(-5,18),lab=c(9,8,7),cex=.5,lty=c(1,2))
legend(12,.19,c("Chisq(4)","N(4,8)"),lty=c(1,2))

 #postscript("u:/meth1/Rfiles/compnormunif.ps",height=8,horizontal=FALSE)
par(mfrow=c(1,1))
matplot(x3,z3,main="Uniform (0,1) PDF vs N(.5,1/12)",xlab="x",ylab="f(x)",type="l",ylim=c(0,1.5),
     xlim=c(-.5,1.5),lab=c(9,8,7),cex=.5,lty=c(1,2))
legend(.8,1.4,c("Uniform(0,1)","N(.5,1/12)"),lty=c(1,2))


 #graphics.off()