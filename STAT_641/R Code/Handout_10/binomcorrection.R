
binomapprox=function(n,p)
{ # draws  the binomial cdf and normal approximation
mu=n*p
stdev=sqrt(n*p*(1-p))
left=floor(max(0,mu-4*stdev))
#left=28
right=ceiling(mu+4*stdev)
#right=36
plot(c(left,right),c(0,1),type="n",xlab="x",
#plot(c(left,right),c(.97,1),type="n",xlab="x",
ylab="F(x)",main=paste("Binomial CDF with n=",n," and p=",p))
for (i in left:right) {lines(c(i-1,i),c(pbinom(i-1,n,p),pbinom(i-1,n,p)))
points(i,pbinom(i,n,p),pch=19)}
x=seq(left,right,length=1001)
lines(x,pnorm(x,mean=mu,sd=stdev),col=2)
lines(x,pnorm(x+1/2,mean=mu,sd=stdev),col=4)
legend(5,.95,"Blue=With Correction")
legend(5,.85,"Red=Without Correction")
}
binomapprox(100,.2)

 

