#
# R CODE FOR Exp Tolerance
# ----------------------------------------------------------------------------
#postscript("u:/meth1/psfiles/ExpTolplot.ps")

 x=seq(0,9500,.01)
  fx=dexp(x,1/2000)


 plot(x,fx,type="l",ylab="f(y)",xlab="y",xlim=c(0,9500),ylim=c(0,.0005),
main="Exponential(2000) pdf",
 lab=c(10,11,5))
abline(h=0)
 y=seq(0,5000,.01)
  fy=dexp(y,1/1000)

#postscript("u:/meth1/psfiles/ExpTolplot2.ps")

 plot(y,fy,type="l",ylab="f(y)",xlab="y",xlim=c(0,5000),ylim=c(0,.001),
main="Exponential pdf-Beta Unknown",
 lab=c(10,11,5))
abline(h=0)

#graphics.off()



n= 130
G= .95
P= .90
m= 0
imin= 0
i= 0
ans= 0
anst= 0
r= 1:n
ans= pbinom(r-1,n,1-P)
while(i<n)
{
i= i+1
if(ans[i]<=1-G)  anst[i]= ans[i]
if(ans[i]>1-G) anst[i]= -1
}
ansmax= max(anst)
imax= which(anst==ansmax)
m= imax
coverage= 1-ans[m]
coverage