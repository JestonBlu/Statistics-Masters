theta=rgamma(1,shape=5,rate=4)
n=12
mle=rep(0,10000)
adjmle=rep(0,10000)
mome=rep(0,10000)
for (i in 1:10000){
x=runif(n,min=0,max=theta)
mle[i]=max(x)
adjmle[i]=(n+1)*max(x)/n
mome[i]=2*mean(x)
}
mses=c(sum((mle-theta)^2)/10000,sum((adjmle-theta)^2)/10000,sum((mome-theta)^2)/10000)
summary=cbind(c(mean(mle),mean(adjmle),mean(mome)),c(var(mle),var(adjmle),var(mome)),mses)

rownames(summary)=c("mle","adjmle","mome")
colnames(summary)=c("mean","variance","mse")

hist(mle,freq=FALSE,nclass=40)
t=seq(min(mle),theta,length=1001)
lines(t,n*t^(n-1)/theta^n,col=2)

hist(mome,freq=FALSE,nclass=40)
t=seq(min(mome),max(mome),length=1001)
lines(t,dnorm(t,mean=theta,sd=sqrt(4*theta^2/(12*n))),col=2)

hist(adjmle,freq=FALSE,nclass=40)
t=seq(min(adjmle),max(adjmle),length=1001)
lines(t,n^(n+1)*t^(n-1)/(theta^n*(n+1)^n),col=2)

