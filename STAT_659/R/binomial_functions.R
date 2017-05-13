binomhist=function(n,p){ # draws a histogram of the binomial pmf and approximating normal pdf
mu=n*p
stdev=sqrt(n*p*(1-p))
left=floor(max(0,mu-4*stdev))
right=ceiling(mu+4*stdev)
ylimits=c(0,max(c(dbinom(left:right,n,p),dnorm(0,sd=stdev))))
barplot(dbinom(left:right,n,p),space=0,names=left:right,xlab="x",ylab="p(x)",ylim=ylimits,main=paste("Binomial PMF with n=",n," and p=",p))
x=seq(left,right,length=1001)
lines(x-left,dnorm(x-.5,mean=mu,sd=stdev),col=2)
}

binomcdf=function(n,p){ # draws the graph of the binomial cdf
plot(c(-1,n),c(0,1),type="n",xlab="x",ylab="F(x)",main=paste("Binomial CDF with n=",n," and p=",p))
for (i in 0:(n+1)) {lines(c(i-1,i),c(pbinom(i-1,n,p),pbinom(i-1,n,p)))
points(i,pbinom(i,n,p),pch=19)}
}

binomsample=function(nsamp,n,p){ # takes a binomial sample and compares histogram with pmf
samp=rbinom(nsamp,n,p)
hist(samp,breaks=seq(min(samp)-.5,max(samp)+.5,1),freq=FALSE,main=paste("Histogram of ",nsamp," Obs from a Binomial Dist with n=",n," and p=",p))
for (i in min(samp):max(samp)) lines(c(i-.5,i+.5),c(dbinom(i,n,p),dbinom(i,n,p)),col=2)
diff=max(samp)-min(samp)
height=max(dbinom(0:n,n,p))
legend(c(min(samp)+.7*diff,max(samp)),c(.75*height,.95*height),legend=c("sample freq","probability"),col=1:2,lty=1)}

binomapprox=function(n,p){ # draws  the binomial cdf and normal approximation
mu=n*p
stdev=sqrt(n*p*(1-p))
left=floor(max(0,mu-4*stdev))
right=ceiling(mu+4*stdev)
plot(c(left,right),c(0,1),type="n",xlab="x",ylab="F(x)",main=paste("Binomial CDF with n=",n," and p=",p))
for (i in left:right) {lines(c(i-1,i),c(pbinom(i-1,n,p),pbinom(i-1,n,p)))
points(i,pbinom(i,n,p),pch=19)}
x=seq(left,right,length=1001)
lines(x,pnorm(x,mean=mu,sd=stdev),col=2)
lines(x,pnorm(x+1/2,mean=mu,sd=stdev),col=4)
}