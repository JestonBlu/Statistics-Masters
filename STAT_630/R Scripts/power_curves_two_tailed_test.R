par(lwd=2)
alpha=.05
mu0=2
sig=.27
plot(c(1.7,2.3),c(0,1),type="n",xlab=expression(mu),ylab=expression(paste(beta,"(",mu,")")),main="Power Curves for a Two-Tailed Test")
mu=seq(1.7,2.3,length=1001)
n=25
power=pnorm((mu0-mu)/(sig/sqrt(n))-qnorm(1-alpha/2))+1-pnorm((mu0-mu)/(sig/sqrt(n))+qnorm(1-alpha/2))
lines(mu,power)
n=50
power=pnorm((mu0-mu)/(sig/sqrt(n))-qnorm(1-alpha/2))+1-pnorm((mu0-mu)/(sig/sqrt(n))+qnorm(1-alpha/2))
lines(mu,power,col=2)
n=100
power=pnorm((mu0-mu)/(sig/sqrt(n))-qnorm(1-alpha/2))+1-pnorm((mu0-mu)/(sig/sqrt(n))+qnorm(1-alpha/2))
lines(mu,power,col=3)
n=200
power=pnorm((mu0-mu)/(sig/sqrt(n))-qnorm(1-alpha/2))+1-pnorm((mu0-mu)/(sig/sqrt(n))+qnorm(1-alpha/2))
lines(mu,power,col=4)
legend(c(1.7,1.9),c(0,0.25),lty=rep(1,4),col=1:4,legend=c("n=25","n=50","n=100","n=200"))


