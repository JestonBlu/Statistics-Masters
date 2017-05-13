x=rgamma(100,2.5,4)

n=length(x)
sigma2hat=var(x)*(n-1)/n
xbar=mean(x)
momlambda=xbar/sigma2hat
momalpha=xbar*xbar/sigma2hat
eqnalpha=function(alpha)n*log(alpha)-n*log(xbar)+sum(log(x))-n*digamma(alpha)
alp=seq(2,3,length=1001)
plot(alp,eqnalpha(alp),type="l") #find mle of alpha by plotting equation
lines(c(2,3),c(0,0),col=2)

mlelambda=alpha/xbar

#now compute the mle using an R library
library(VGAM)
fit1 = vglm(x ~ 1, gamma1, trace=TRUE, crit="c")
fit2 = vglm(x ~ 1, gamma2.ab, trace=TRUE, crit="c")
coef(fit1, matrix=TRUE)
Coef(fit1)
coef(fit2, matrix=TRUE)
Coef(fit2)
hist(x,freq=FALSE)
xa=seq(min(x),max(x),length=1001)
lines(xa,dgamma(xa,shape=Coef(fit2)[2],rate=Coef(fit2)[1]),col=2)
