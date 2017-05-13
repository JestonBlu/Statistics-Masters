N=100000
n=10
lambda0=1
temp=rep(0,N)

#plot lr statistic as a function of lambda hat
lamhat=seq(lambda0-3*sqrt(lambda0/n),lambda0+3*sqrt(lambda0/n),length=2001)
top=max(na.omit(2*n*(lambda0-lamhat+lamhat*log(lamhat/lambda0))))
plot(lamhat,2*n*(lambda0-lamhat+lamhat*log(lamhat/lambda0)),type="l",ylab="Test Statistic")
lamhat=(floor(n*lambda0-3*sqrt(lambda0*n)):ceiling(n*lambda0+3*sqrt(lambda0*n)))/n
points(lamhat,2*n*(lambda0-lamhat+lamhat*log((lamhat)/lambda0)))
points(lamhat,(lamhat-lambda0)^2/(lamhat/n),col=2)
points(lamhat,(lamhat-lambda0)^2/(lambda0/n),col=4)
legend(c(lambda0-sqrt(lambda0/n),lambda0+sqrt(lambda0/n)),c(0.8*top,top),lty=rep(1,3),col=c(1,2,4),legend=c("LR","Wald","score"))

#generate N LR statistics
for (i in 1:N){x=rpois(n,lambda0)
lambdahat=mean(x)
temp[i]=2*n*(lambda0-lambdahat+lambdahat*log(lambdahat/lambda0))}
q=c(.5,.75,.9,.95,.975,.99)
qchisq(q,1)
cbind(q,qchisq(q,1),sort(temp)[floor(q*N)])
rejectprop=rep(0,length(q))
for(j in 1:length(q)){
#rejectprop[j]=sum(temp>qchisq(q[j],1))/N}
rejectprop[j]=sum(na.omit(temp)>qchisq(q[j],1))/length(na.omit(temp))}
cbind(1-q,rejectprop)
 x=seq(0,max(na.omit(temp)),length=1001)
TS=na.omit(temp)
hist(TS,nclass=40,freq=FALSE,xlab="test statistics")
lines(x,dchisq(x,1))
#qqmath(temp,distribution=function(x) qchisq(x,df=1)) # load "lattice" package
