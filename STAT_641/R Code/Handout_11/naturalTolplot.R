#
# R CODE FOR Var(p)
# ----------------------------------------------------------------------------
 x=seq(0,21.9,.01)
 y=seq(21.9,60,.01)
 z=c(x,y)
 fx=.5*dchisq(x,15)
 fy=.5*dchisq(y,30)
 fz=c(fx,fy)

#postscript("u:/meth1/psfiles/natTolplot.ps")

 plot(z,fz,type="l",ylab="f(y)",xlab="y",xlim=c(0,60),main="Population pdf",
 lab=c(10,11,5))
abline(h=0)

#postscript("u:/meth1/psfiles/natTolNormplot.ps")

w=seq(0,30,.01)
fw=dnorm(w,20,3)


 plot(w,fw,type="l",ylab="f(y)",xlab="y",xlim=c(10,30),
main="pdf for a N(20,3) Distribution",
 lab=c(20,11,5))
abline(h=0)

#graphics.off()
