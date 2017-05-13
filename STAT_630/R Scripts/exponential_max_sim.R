nreps=10000
n=5
temp=rep(0,nreps)
for (i in 1:nreps)temp[i]=max(rexp(n))
hist(temp,freq=FALSE,breaks=40,xlab="max",main=paste("Histogram of Max from Exponential Samples with n=",n))
x=seq(0,max(temp),length=1001)
lines(x,n*(1-exp(-x))^(n-1)*exp(-x),col=2)
