binomhist=function(n,p){ # draws a histogram of the binomial pmf
mu=n*p
stdev=sqrt(n*p*(1-p))
left=floor(max(0,mu-4*stdev))
right=ceiling(mu+4*stdev)
heights=dbinom(left:right,n,p)
barplot(heights,space=0,ylim=c(0,max(heights,dnorm(0,sd=stdev))),names=left:right,xlab="x",ylab="p(x)",main=paste("Binomial PMF with n=",n," and p=",p))
x=seq(left,right,length=1001)
lines(x-left,dnorm(x-1/2,mean=mu,sd=stdev),col=2)
}

poissonhist=function(mu){  #draws a histogram of the Poisson pmf
left=floor(max(0,mu-3.5*sqrt(mu)))
right=ceiling(mu+3.5*sqrt(mu))
heights=dpois(left:right,mu)
barplot(heights,space=0,ylim=c(0,max(heights,dnorm(0,sd=sqrt(mu)))),names=left:right,xlab="x",ylab="p(x)",main=paste("Poisson PMF with mu=",mu))
x=seq(left,right,length=1001)
lines(x-left,dnorm(x,mean=mu,sd=sqrt(mu)),col=2)
}

library(stats)
negbinhist=function(r,theta){  #draws a histogram of the negative binomial pmf
mu=r*(1-theta)/theta
stdev=sqrt(mu/theta)
left=floor(max(0,mu-3.5*stdev))
right=ceiling(mu+3.5*stdev)
heights=dnbinom(left:right,r,theta)
barplot(heights,space=0,ylim=c(0,max(heights,dnorm(0,sd=stdev))),names=left:right,xlab="x",ylab="p(x)",main=paste("Negative Binomial PMF with mu=",mu))
x=seq(left,right,length=1001)
lines(x-left,dnorm(x,mean=mu,sd=stdev),col=2)
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
legend(c(min(samp)+.65*diff,max(samp)),c(.75*height,.95*height),legend=c("sample freq","probability"),col=1:2,lty=1)}


poissonapprox=function(n,p){  # draws a histogram of binomial pmf and the approximating Poisson pmf
mu=n*p
nplot=2*mu+4
probs=cbind(0:nplot,dbinom(0:nplot,n,p),dpois(0:nplot,mu))
colnames(probs)=c("x","binomprob","poisprob")
barplot(dbinom(0:nplot,n,p),space=0,names=0:nplot,xlab="x",ylab="p(x)",main=paste("Binomial PMF with n=",n," and p=",p))
for (i in 0:nplot) lines(c(i,i+1),c(dpois(i,mu),dpois(i,mu)),col=2)
plot(0:nplot,dpois(0:nplot,mu)-dbinom(0:nplot,n,p),xlab="x",ylab="error",main="Error in Poisson Approximation")
return(list(probs=probs))
}
