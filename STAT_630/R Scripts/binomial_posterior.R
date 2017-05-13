binom.post=function(n,x,alpha,beta){
thet=seq(0,1,length=1001)
par(lwd=2)
upper=max(c(dbeta(thet,alpha,beta),dbeta(thet,alpha+x,n-x+beta)))
plot(c(0,1),c(0,upper),type="n",xlab=expression(theta),ylab="density",main="Prior and Posterior Densities")
lines(thet,dbeta(thet,alpha,beta),col=1)
lines(thet,dbeta(thet,alpha+x,n-x+beta),col=2)
legend(c(0.75,1),c(.85*upper,upper),lty=rep(1,2),col=1:2,legend=c("Prior","Posterior"))
}