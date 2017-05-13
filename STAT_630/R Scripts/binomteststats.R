binomlr=function(n,y,theta0)2*(y*log(y/(n*theta0))+(n-y)*log((n-y)/(n*(1-theta0))))
alpha=.05
qchi=qchisq(1-alpha,1)
n=50
y=14
mle=y/n
half=qnorm(1-.5*alpha/2)*sqrt(mle*(1-mle)/n)
lower=mle-half
upper=mle+half
thet=seq(lower,upper,length=1001)
plot(thet,binomlr(n,y,thet),type="l",ylab="TS",xlab=expression(theta))
lines(c(0,1),c(qchi,qchi),col=6)
lines(thet,n*(mle-thet)^2/(mle*(1-mle)),col=2)
lines(thet,n*(mle-thet)^2/(thet*(1-thet)),col=4)

leglow=n*(mle-lower)^2/(mle*(1-mle))
legupp=1.4*leglow

legend(c(mle-.6*sqrt(mle*(1-mle)/n),mle+sqrt(mle*(1-mle)/n)),c(leglow,legupp),lty=rep(1,3),col=c(1,2,4),legend=c("LR","Wald","Score"))

z=qnorm(1-alpha/2)
f=function(theta)binomlr(n,y,theta)-qchi
like_ci_l= uniroot(f,lower=lower,upper=mle)$root
like_ci_u=uniroot(f,lower=mle,upper=upper)$root
wald_ci_l=mle-z*sqrt(mle*(1-mle)/n)
wald_ci_u=mle+z*sqrt(mle*(1-mle)/n)
term=z*sqrt(mle*(1-mle)/n+z^2/(4*n*n))
score_ci_l=(mle+z^2/(2*n)-term)/(1+z^2/n)
score_ci_u=(mle+z^2/(2*n)+term)/(1+z^2/n)

A=cbind(c(like_ci_l,wald_ci_l,score_ci_l),c(like_ci_u,wald_ci_u,score_ci_u))
colnames(A)=c("lower","upper")
rownames(A)=c("likelihood","wald","score")
A



